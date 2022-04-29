<?php

namespace App\Controller;

use App\Data\SearchData;
use App\Entity\Article;
use App\Form\SearchForm;
use App\Repository\ArticleRepository;
use App\Repository\CategoryRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\String\Slugger\SluggerInterface;

class ArticlesController extends AbstractController
{
    /**
     * @var ArticleRepository
     */
    private $repository;

    public function __construct(ArticleRepository $repository)
    {
        $this->repository = $repository;
    }

    /**
     * @Route("/articles", name="articles")
     * @return Response
     */

    public function index(Request $request, PaginatorInterface $paginator, ArticleRepository $repository, SluggerInterface $slugger): Response
    {
        $data = new SearchData();
        $form = $this->createForm(SearchForm::class, $data);
        $form->handleRequest($request);
        $articles = $repository->findSearch($data);
        $donness = $this->getDoctrine()->getRepository(Article::class)->findAll();

        $articles = $paginator->paginate(
            $donness,
            $request->query->getInt('page', 1),
            10
        );
        if ($form->isSubmitted()){
                /** @var UploadedFile $brochureFile */
                $imageFile = $form->get('image')->getData();

                // this condition is needed because the 'brochure' field is not required
                // so the PDF file must be processed only when a file is uploaded
                if ($imageFile) {
                    $originalFilename = pathinfo($imageFile->getClientOriginalName(), PATHINFO_FILENAME);
                    // this is needed to safely include the file name as part of the URL
                    $safeFilename = $slugger->slug($originalFilename);
                    $newFilename = $safeFilename.'-'.uniqid().'.'.$imageFile->guessExtension();
    
                    // Move the file to the directory where brochures are stored
                    try {
                        $imageFile->move(
                            $this->getParameter('articles_directory'),
                            $newFilename
                        );
                    } catch (FileException $e) {
                        // ... handle exception if something happens during file upload
                    }
    
                    // updates the 'brochureFilename' property to store the PDF file name
                    // instead of its contents
                    $imageFile->setImageFile($newFilename);
                }
            }
        return $this->render('articles/index.html.twig', [
            'articles' => $donness,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/articles/{slug}-{id}", name="article.show", requirements={"slug": "[a-z0-9\-]*"})
     * @return Response
     */
    public function show(Article $article, string $slug): Response
    {
        if ($article->getSlug() !== $slug) {
            return $this->redirectToRoute('article.show', [
                'id' => $article->getId(),
                'slug' => $article->getSlug()
            ], 301);
        }
        $em = $this->getDoctrine()->getManager();
        $article = $em->getRepository(Article::class)->find($article);

        return $this->render('articles/show.html.twig', [
            'article' => $article,
            'current_menu' => $article
        ]);
    }
}
