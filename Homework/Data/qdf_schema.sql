-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/7yskun
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
DROP TABLE IF EXISTS card_holder CASCADE;
DROP TABLE IF EXISTS merchant CASCADE;
DROP TABLE IF EXISTS merchant_category CASCADE;
DROP TABLE IF EXISTS credit_card CASCADE;
DROP TABLE IF EXISTS "transaction" CASCADE;




CREATE TABLE "card_holder" (
    "customer_id" SERIAL   NOT NULL,
    "full_name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_Customers" PRIMARY KEY (
        "customer_id"
     )
);

CREATE TABLE "credit_card" (
    "card_id" VARCHAR(20)   NOT NULL,
    "customer_id" int   NOT NULL,
    CONSTRAINT "pk_Cards" PRIMARY KEY (
        "card_id"
     )
);

CREATE TABLE "merchant_category" (
    "category_id" SERIAL   NOT NULL,
    "category_name" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_merchant_category" PRIMARY KEY (
        "category_id"
     )
);

CREATE TABLE "merchant" (
    "merchant_id" SERIAL   NOT NULL,
    "merchant_name" VARCHAR(50)   NOT NULL,
    "category_id" INT NOT NULL,
    CONSTRAINT "pk_merchant" PRIMARY KEY (
        "merchant_id"
     )
);

CREATE TABLE "transaction" (
    "transaction_id" INT   NOT NULL,
    "transaction_date" TIMESTAMP   NOT NULL,
    "amount" FLOAT   NOT NULL,
    "card_id" VARCHAR(20)   NOT NULL,
    "merchant_id" INT   NOT NULL,
    CONSTRAINT "pk_transaction" PRIMARY KEY (
        "transaction_id"
     )
);

ALTER TABLE "credit_card" ADD CONSTRAINT "fk_credit_card_customer_id" FOREIGN KEY("customer_id")
REFERENCES "card_holder" ("customer_id");

ALTER TABLE "merchant" ADD CONSTRAINT "fk_merchant_category_id" FOREIGN KEY("category_id")
REFERENCES "merchant_category" ("category_id");

ALTER TABLE "transaction" ADD CONSTRAINT "fk_transaction_card_id" FOREIGN KEY("card_id")
REFERENCES "credit_card" ("card_id");

ALTER TABLE "transaction" ADD CONSTRAINT "fk_transaction_merchant_id" FOREIGN KEY("merchant_id")
REFERENCES "merchant" ("merchant_id");

