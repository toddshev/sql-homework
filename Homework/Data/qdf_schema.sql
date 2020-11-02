-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/7yskun
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
DROP TABLE IF EXISTS Customers CASCADE;
DROP TABLE IF EXISTS Merchants CASCADE;
DROP TABLE IF EXISTS Merchant_Categories CASCADE;
DROP TABLE IF EXISTS Cards CASCADE;
DROP TABLE IF EXISTS Transactions CASCADE;




CREATE TABLE "Customers" (
    "customer_id" SERIAL   NOT NULL,
    "full_name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_Customers" PRIMARY KEY (
        "customer_id"
     )
);

CREATE TABLE "Cards" (
    "card_id" VARCHAR(20)   NOT NULL,
    "customer_id" int   NOT NULL,
    CONSTRAINT "pk_Cards" PRIMARY KEY (
        "card_id"
     )
);

CREATE TABLE "Merchant_Categories" (
    "category_id" SERIAL   NOT NULL,
    "category_name" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_Merchant_Categories" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "Merchants" (
    "merchant_id" SERIAL   NOT NULL,
    "merchant_name" VARCHAR(50)   NOT NULL,
    "category_id" INT NOT NULL,
    CONSTRAINT "pk_Merchants" PRIMARY KEY (
        "merchant_id"
     )
);

CREATE TABLE "Transactions" (
    "transaction_id" INT   NOT NULL,
    "transaction_date" TIMESTAMP   NOT NULL,
    "amount" FLOAT   NOT NULL,
    "card_id" VARCHAR(20)   NOT NULL,
    "merchant_id" INT   NOT NULL,
    CONSTRAINT "pk_Transactions" PRIMARY KEY (
        "transaction_id"
     )
);

ALTER TABLE "Cards" ADD CONSTRAINT "fk_Cards_customer_id" FOREIGN KEY("customer_id")
REFERENCES "Customers" ("customer_id");

ALTER TABLE "Merchants" ADD CONSTRAINT "fk_Merchants_category_id" FOREIGN KEY("category_id")
REFERENCES "Merchant_Categories" ("category_id");

ALTER TABLE "Transactions" ADD CONSTRAINT "fk_Transactions_card_id" FOREIGN KEY("card_id")
REFERENCES "Cards" ("card_id");

ALTER TABLE "Transactions" ADD CONSTRAINT "fk_Transactions_merchant_id" FOREIGN KEY("merchant_id")
REFERENCES "Merchants" ("merchant_id");

