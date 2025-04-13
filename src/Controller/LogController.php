<?php

namespace Contatoseguro\TesteBackend\Controller;

use Contatoseguro\TesteBackend\Service\LogService;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;

class LogController
{
    private LogService $service;

    public function __construct()
    {
        $this->service = new LogService();
    }

    public function getProductLog(ServerRequestInterface $request, ResponseInterface $response, array $args): ResponseInterface
    {
        $queryParams = $request->getQueryParams();
        $title = $queryParams['title'] ?? null;
        $field = $queryParams['field'] ?? 'price';

        if (!$title) {
            $response->getBody()->write(json_encode(['message' => 'O parâmetro "title" é obrigatório']));
            return $response
                ->withStatus(400)
                ->withHeader('Content-Type', 'application/json');
        }

        $log = $this->service->getLastFieldUpdateUserByTitle($title, $field);

        if (!$log) {
            $response->getBody()->write(json_encode(['message' => 'Log não encontrado para o produto informado']));
            return $response
                ->withStatus(404)
                ->withHeader('Content-Type', 'application/json');
        }

        $response->getBody()->write(json_encode($log));
        return $response->withStatus(200)->withHeader('Content-Type', 'application/json');
    }
}
