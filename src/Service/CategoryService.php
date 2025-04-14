<?php

namespace Contatoseguro\TesteBackend\Service;

use Contatoseguro\TesteBackend\Config\DB;
use PDO;

class CategoryService
{
    private \PDO $pdo;
    public function __construct()
    {
        $this->pdo = DB::connect();
    }

    public function getAll(int $adminUserId)
    {
        $query = "
            SELECT *
            FROM category c
            WHERE c.company_id = :adminUserId
        ";

        $stm = $this->pdo->prepare($query);
        $stm->bindValue(':adminUserId', $this->getCompanyFromAdminUser($adminUserId), PDO::PARAM_INT);

        $stm->execute();

        return $stm;
    }

    public function getOne(int $adminUserId, int $categoryId)
    {
        $query = "
            SELECT c.title
            FROM category c
            WHERE c.active = 1
            AND c.company_id = :adminUserId
            OR c.company_id IS NULL
            AND c.id = :categoryId
        ";

        $stm = $this->pdo->prepare($query);

        $stm->bindValue(':adminUserId', $this->getCompanyFromAdminUser($adminUserId), PDO::PARAM_INT);
        $stm->bindValue(':categoryId', $categoryId, PDO::PARAM_INT);

        $stm->execute();

        return $stm;
    }

    public function getProductCategory(int $productId, int $adminUserId)
    {
        $query = "
            SELECT c.id, c.title
            FROM category c
            INNER JOIN product_category pc ON pc.cat_id = c.id
            WHERE pc.product_id = :productId
            AND (c.company_id = :adminUserId OR c.company_id IS NULL)
        ";

        $stm = $this->pdo->prepare($query);
        $stm->bindValue(':productId', $productId, PDO::PARAM_INT);
        $stm->bindValue(':adminUserId', $adminUserId, PDO::PARAM_INT);
        $stm->execute();

        return $stm;
    }


    public function insertOne(array $body, int $adminUserId)
    {
        $stm = $this->pdo->prepare("
            INSERT INTO category (
                company_id,
                title,
                active
            ) VALUES (
                :adminUserId,
                :title,
                :active
            )
        ");

        $stm->bindValue(':title', $body['title'], PDO::PARAM_STR);
        $stm->bindValue(':active', $body['active'], PDO::PARAM_INT);
        $stm->bindValue(':adminUserId', $this->getCompanyFromAdminUser($adminUserId), PDO::PARAM_INT);


        return $stm->execute();
    }

    public function updateOne(int $id, array $body, int $adminUserId)
    {
        $active = (int)$body['active'];

        $stm = $this->pdo->prepare("
            UPDATE category
            SET title = :title,
                active = :active
            WHERE id = :id
            AND company_id = :adminUserId
        ");

        $stm->bindValue(':title', $body['title'], PDO::PARAM_STR);
        $stm->bindValue(':active', $active, PDO::PARAM_INT);
        $stm->bindValue(':id', $id, PDO::PARAM_INT);
        $stm->bindValue(':adminUserId', $this->getCompanyFromAdminUser($adminUserId), PDO::PARAM_INT);

        return $stm->execute();
    }

    public function deleteOne(int $id, int $adminUserId)
    {
        $stm = $this->pdo->prepare("
            DELETE
            FROM category
            WHERE id = :id
            AND company_id = :adminUserId
        ");

        $stm->bindValue(':id', $id, PDO::PARAM_INT);
        $stm->bindValue(':adminUserId', $this->getCompanyFromAdminUser($adminUserId), PDO::PARAM_INT);

        return $stm->execute();
    }

    private function getCompanyFromAdminUser(int $adminUserId)
    {
        $query = "
            SELECT company_id
            FROM admin_user
            WHERE id = :adminUserId
        ";

        $stm = $this->pdo->prepare($query);
        $stm->bindValue(':adminUserId', $adminUserId, PDO::PARAM_INT);

        $stm->execute();

        return $stm->fetch()->company_id;
    }
}
