<?php

namespace Contatoseguro\TesteBackend\Service;

use Contatoseguro\TesteBackend\Config\DB;
use PDO;

class CompanyService
{
    private \PDO $pdo;
    public function __construct()
    {
        $this->pdo = DB::connect();
    }

    public function getNameById(int $id)
    {
        $stm = $this->pdo->prepare("SELECT name FROM company WHERE id = :id");
        $stm->bindValue(':id', $id, PDO::PARAM_INT);
        $stm->execute();

        return $stm;
    }
}
