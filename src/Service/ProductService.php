<?php

namespace Contatoseguro\TesteBackend\Service;

use Contatoseguro\TesteBackend\Config\DB;
use PDO;
use PDOStatement;

class ProductService
{
    private \PDO $pdo;
    public function __construct()
    {
        $this->pdo = DB::connect();
    }

    public function getAll(int $adminUserId, array $queryParams)
    {
        $filters = $this->extractFilters($queryParams);
        $query = $this->buildQuery($filters);

        $stm = $this->pdo->prepare($query);
        $this->bindParams($stm, $adminUserId, $filters);

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
                :company_id,
                :title,
                :price,
                :active
            )
        ");
        $stm->bindValue(':company_id', $body['company_id'], PDO::PARAM_INT);
        $stm->bindValue(':title', $body['title'], PDO::PARAM_STR);
        $stm->bindValue(':price', $body['price'], PDO::PARAM_INPUT_OUTPUT);
        $stm->bindValue(':active', $body['active'], PDO::PARAM_INT);
        if (!$stm->execute())
            return false;

        $productId = $this->pdo->lastInsertId();

        $stm = $this->pdo->prepare("
            INSERT INTO product_category (
                product_id,
                cat_id
            ) VALUES (
               :product_id,
               :category_id
            );
        ");

        $stm->bindValue(':product_id', $productId, PDO::PARAM_INT);
        $stm->bindValue(':category_id', $body['category_id'], PDO::PARAM_INT);

        if (!$stm->execute())
            return false;

        $stm = $this->pdo->prepare("
            INSERT INTO product_log (
                product_id,
                admin_user_id,
                `action`,
                `field`
             
            ) VALUES (
                :product_id,
                :admin_user_id,
                :action,
                :field
            )
        ");
        $stm->bindValue(':product_id', $productId, PDO::PARAM_INT);
        $stm->bindValue(':admin_user_id', $adminUserId, PDO::PARAM_INT);
        $stm->bindValue(':action', 'create', PDO::PARAM_STR);
        $stm->bindValue(':field', 'all', PDO::PARAM_STR);


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

    public function getLog(int $id)
    {
        $stm = $this->pdo->prepare("
            SELECT pl.*, au.name
            FROM product_log AS pl
            INNER JOIN admin_user AS au ON au.id = pl.admin_user_id
            WHERE pl.product_id = :id
        ");


        $stm->bindValue(':id', $id, PDO::PARAM_INT);
        $stm->execute();

        return $stm;
    }

    private function extractFilters(array $queryParams): array
    {
        $allowedOrderBy = ['created_at', 'title', 'price'];
        $allowedOrder = ['ASC', 'DESC'];

        $orderBy = in_array($queryParams['order_by'] ?? '', $allowedOrderBy)
            ? $queryParams['order_by']
            : 'created_at';

        $order = strtoupper($queryParams['order'] ?? 'DESC');
        $order = in_array($order, $allowedOrder) ? $order : 'DESC';

        return [
            'active' => $queryParams['active'] ?? null,
            'category' => $queryParams['category'] ?? null,
            'orderBy' => $orderBy,
            'order' => $order,
        ];
    }

    private function buildQuery(array $filters): string
    {
        $query = "
        SELECT p.*, c.title as category
        FROM product p
        INNER JOIN product_category pc ON pc.product_id = p.id
        INNER JOIN category c ON c.id = pc.cat_id
        WHERE p.company_id = :adminUserId
    ";

        if (!is_null($filters['active'])) {
            $query .= " AND p.active = :active";
        }

        if (!is_null($filters['category'])) {
            $query .= " AND c.id = :category";
        }

        $query .= " ORDER BY p.{$filters['orderBy']} {$filters['order']}";

        return $query;
    }

    private function bindParams(PDOStatement $stm, int $adminUserId, array $filters): void
    {
        $stm->bindValue(':adminUserId', $adminUserId, PDO::PARAM_INT);

        if (!is_null($filters['active'])) {
            $stm->bindValue(':active', $filters['active'], PDO::PARAM_INT);
        }

        if (!is_null($filters['category'])) {
            $stm->bindValue(':category', $filters['category'], PDO::PARAM_INT);
        }
    }
}
