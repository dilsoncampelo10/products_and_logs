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

    public function getLastFieldUpdateUserByTitle(string $title, string $field)
    {
        $query = "
        SELECT  p.title AS product_title,
                pl.field,
                pl.old_value,
                pl.new_value,
                pl.timestamp,
                au.name AS admin_name  
        FROM product_log pl
        INNER JOIN admin_user au ON au.id = pl.admin_user_id
        INNER JOIN product p ON p.id = pl.product_id
        WHERE pl.action LIKE 'update'
            AND p.title LIKE :title
            AND pl.field = :field
        ORDER BY pl.timestamp DESC
        LIMIT 1
    ";

        $stm = $this->pdo->prepare($query);
        $stm->bindValue(':title', $title);
        $stm->bindValue(':field', $field);
        $stm->execute();

        return $stm->fetch(PDO::FETCH_ASSOC);
    }
}
