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

  
}
