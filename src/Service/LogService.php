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

    public function getLastPriceUpdateUserByTitle(string $title)
    {
        $query = "
        SELECT pl.*, au.name AS admin_name
        FROM product_log pl
        INNER JOIN admin_user au ON au.id = pl.admin_user_id
        INNER JOIN product p ON p.id = pl.product_id
        WHERE p.title = :title
          AND pl.field = 'price'
        ORDER BY pl.updated_at DESC
        LIMIT 1
    ";

        $stm = $this->pdo->prepare($query);
        $stm->bindValue(':title', $title);
        $stm->execute();

        return $stm->fetch(PDO::FETCH_ASSOC);
    }
}
