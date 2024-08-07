DROP TABLE BlacklistedIban IF EXISTS;

create table BlacklistedIban
(
    id         int not null,
    IBAN_CODE  varchar(255),
    PRIMARY KEY (id)
);
