<?php

namespace Contatoseguro\TesteBackend\Service;

use Contatoseguro\TesteBackend\Config\DB;
use PDO;

class LogService
{
    private \PDO $pdo;
    public function __construct()
    {
        $this->pdo = DB::connect();
    }


}
