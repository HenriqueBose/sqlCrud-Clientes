create table IF NOT EXISTS cliente
(
    id          serial       not null
        constraint usuario_pk
            primary key,
    nome        varchar(100) not null,
    cpf         varchar(11)  not null,
    cep         integer      not null,
    logradouro  varchar      not null,
    bairro      varchar      not null,
    cidade      varchar      not null,
    uf          varchar      not null,
    complemento varchar
);

alter table cliente
    owner to postgres;

create unique index usuario_id_uindex
    on cliente (id);

/* Como seria possível inserir mais de 1 telefone, se tornou necessário a criação de uma nova tabela para armazena-los e fazer uma relação N=1.*/

create table IF NOT EXISTS telefone
(
    id         serial  not null
        constraint telefone_pk
            primary key,
    numero     varchar not null,
    id_cliente integer not null
        constraint id_cliente_fk
            references cliente
            on delete cascade
);

alter table telefone
    owner to postgres;

create unique index telefone_id_uindex
    on telefone (id);

create table IF NOT EXISTS emails
(
    id         serial  not null
        constraint email_pk
            primary key,
    email      varchar not null,
    id_cliente integer not null
        constraint id_cliente_fk
            references cliente
            on delete cascade
);

alter table  emails
    owner to postgres;

create unique  index email_id_uindex
    on emails (id);

create table IF NOT EXISTS usuario
(
    id    integer not null
        constraint usuario_pkey
            primary key,
    login varchar(255)
        constraint uk_pm3f4m4fqv89oeeeac4tbe2f4
            unique,
    senha varchar(255),
    role  varchar(5)
);

alter table usuario
    owner to postgres;




/* Caso as sequences nao sejam geradas automaticamentes
create sequence cliente_id_seq
    as integer;

alter sequence cliente_id_seq owner to postgres;

create sequence telefone_id_seq
    as integer;

alter sequence telefone_id_seq owner to postgres;

create sequence email_id_seq
    as integer;

alter sequence email_id_seq owner to postgres;

Caso as sequences nao sejam geradas automaticamentes.*/


/* Insert dos 2 usuarios soliciados.*/
insert into usuario (id , login, role, senha)
values (1, 'admin', 'ADMIN', '123456');

insert into usuario (id , login, role, senha)
values (2, 'comum', 'COMUM', '123456');