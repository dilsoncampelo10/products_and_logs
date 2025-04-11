<?php

namespace Contatoseguro\TesteBackend\Service;

use Contatoseguro\TesteBackend\Config\DB;
use PDO;

class ProductService
{
    private \PDO $pdo;
    public function __construct()
    {
        $this->pdo = DB::connect();
    }

    public function getAll(int $adminUserId, array $queryParams)
    {
        $active = isset($queryParams['active']) ? $queryParams['active'] : null;
        $category = isset($queryParams['category']) ? $queryParams['category'] : null;

        $query = "
            SELECT p.*, c.title as category
            FROM product p
            INNER JOIN product_category pc ON pc.product_id = p.id
            INNER JOIN category c ON c.id = pc.cat_id
            WHERE p.company_id = :adminUserId
        ";

        if (!is_null($active)) {
            $query .= " AND p.active = :active";
        }
        if (!is_null($category)) {
            $query .= " AND c.id = :category";
        }

        $stm = $this->pdo->prepare($query);
        $stm->bindValue(':adminUserId', $adminUserId, PDO::PARAM_INT);

        if (!is_null($active)) {
            $stm->bindValue(':active', $active, PDO::PARAM_INT);
        }
        if (!is_null($category)) {
            $stm->bindValue(':category', $category , PDO::PARAM_INT);
        }

        $stm->execute();
        return $stm;
    }


    public function getOne(int $id)
    {
        $stm = $this->pdo->prepare("
            SELECT *
            FROM product
            WHERE id = :id
        ");

        $stm->bindValue(':id', $id, PDO::PARAM_INT);
        $stm->execute();

        return $stm;
    }

    public function insertOne($body, $adminUserId)
    {
        $stm = $this->pdo->prepare("
            INSERT INTO product (
                company_id,
                title,
                price,
                active
            ) VALUES (
                {$body['company_id']},
                '{$body['title']}',
                {$body['price']},
                {$body['active']}
            )
        ");
        if (!$stm->execute())
            return false;

        $productId = $this->pdo->lastInsertId();

        $stm = $this->pdo->prepare("
            INSERT INTO product_category (
                product_id,
                cat_id
            ) VALUES (
                {$productId},
                {$body['category_id']}
            );
        ");
        if (!$stm->execute())
            return false;

        $stm = $this->pdo->prepare("
            INSERT INTO product_log (
                product_id,
                admin_user_id,
                `action`
            ) VALUES (
                {$productId},
                {$adminUserId},
                'create'
            )
        ");

        return $stm->execute();
    }

    public function updateOne($id, $body, $adminUserId)
    {
        $stm = $this->pdo->prepare("
            UPDATE product
            SET company_id = {$body['company_id']},
                title = '{$body['title']}',
                price = {$body['price']},
                active = {$body['active']}
            WHERE id = {$id}
        ");
        if (!$stm->execute())
            return false;

        $stm = $this->pdo->prepare("
            UPDATE product_category
            SET cat_id = {$body['category_id']}
            WHERE product_id = {$id}
        ");
        if (!$stm->execute())
            return false;

        $stm = $this->pdo->prepare("
            INSERT INTO product_log (
                product_id,
                admin_user_id,
                `action`
            ) VALUES (
                {$id},
                {$adminUserId},
                'update'
            )
        ");

        return $stm->execute();
    }

    public function deleteOne($id, $adminUserId)
    {
        $stm = $this->pdo->prepare("
            DELETE FROM product_category WHERE product_id = {$id}
        ");
        if (!$stm->execute())
            return false;

        $stm = $this->pdo->prepare("DELETE FROM product WHERE id = {$id}");
        if (!$stm->execute())
            return false;

        $stm = $this->pdo->prepare("
            INSERT INTO product_log (
                product_id,
                admin_user_id,
                `action`
            ) VALUES (
                {$id},
                {$adminUserId},
                'delete'
            )
        ");

        return $stm->execute();
    }

    public function getLog($id)
    {
        $stm = $this->pdo->prepare("
            SELECT *
            FROM product_log
            WHERE product_id = {$id}
        ");
        $stm->execute();

        return $stm;
    }
}
