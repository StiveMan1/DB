CREATE TABLE IF NOT EXISTS public."Customer"
(
    "customerId" integer NOT NULL,
    "customerName" "char"[] NOT NULL,
    city "char"[] NOT NULL,
    CONSTRAINT "Customer_pkey" PRIMARY KEY ("customerId")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Customer"
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS public."Item"
(
    "itemName" "char"[] NOT NULL,
    price double precision NOT NULL,
    "itemId" integer
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Item"
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS public."Orders"
(
    day integer,
    month interval,
    year integer,
    "orderId" integer NOT NULL,
    "customerId" integer,
    "itemId" integer,
    quant integer,
    CONSTRAINT "Orders_pkey" PRIMARY KEY ("orderId"),
    CONSTRAINT customer FOREIGN KEY ("customerId")
        REFERENCES public."Customer" ("customerId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Orders"
    OWNER to postgres;


INSERT INTO Orders ("orderId", "year", "month", "day", "customerId", "itemId", "quant") 
  VALUES (2301, '2011', '02', '23', 101, 3786, 3) ON CONFLICT ("orderId", "itemId") DO NOTHING;

INSERT INTO Orders ("orderId", "year", "month", "day", "customerId", "itemId", "quant") 
  VALUES (2301, '2011', '02', '23', 101, 4011, 6) ON CONFLICT ("orderId", "itemId") DO NOTHING;

INSERT INTO Orders ("orderId", "year", "month", "day", "customerId", "itemId", "quant") 
  VALUES (2301, '2011', '02', '23', 101, 9132, 8) ON CONFLICT ("orderId", "itemId") DO NOTHING;

INSERT INTO Orders ("orderId", "year", "month", "day", "customerId", "itemId", "quant") 
  VALUES (2301, '2011', '02', '25', 101, 5794, 4) ON CONFLICT ("orderId", "itemId") DO NOTHING;

INSERT INTO Orders ("orderId", "year", "month", "day", "customerId", "itemId", "quant") 
  VALUES (2301, '2011', '02', '27', 101, 4011, 2) ON CONFLICT ("orderId", "itemId") DO NOTHING;

INSERT INTO Orders ("orderId", "year", "month", "day", "customerId", "itemId", "quant") 
  VALUES (2301, '2011', '02', '27', 101, 3141, 2) ON CONFLICT ("orderId", "itemId") DO NOTHING;


INSERT INTO Customer ("customerId", "customerName", "city") 
  VALUES (101, "Martin", "Prague");

INSERT INTO Customer ("customerId", "customerName", "city") 
  VALUES (107, "Herman", "Madrid");

INSERT INTO Customer ("customerId", "customerName", "city") 
  VALUES (110, "Pedro", "Moscow");

INSERT INTO Item ("itemId", "price", "itemName") 
  VALUES (3786, 35.00, 'Net');

INSERT INTO Item ("itemId", "price", "itemName") 
  VALUES (4011, 65.00, 'Racket');

INSERT INTO Item ("itemId", "price", "itemName") 
  VALUES (9132, 4.75, 'Pack-3');

INSERT INTO Item ("itemId", "price", "itemName") 
  VALUES (9132, 5.00, 'Pack -6');

INSERT INTO Item ("itemId", "price", "itemName") 
  VALUES (3141, 10.00, 'Cover');

SELECT * FROM Customer
WHERE amount = (
   SELECT MAX (amount)
   FROM payment
);

