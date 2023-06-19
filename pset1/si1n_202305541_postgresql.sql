
-- Remover banco de dados "uvv" caso já esteja presente no sistema.

DROP DATABASE IF EXISTS     "uvv";


-- Remover usuário "matheus_gregorio_muniz_arcanjo" caso já esteja presente no sistema.

DROP USER IF EXISTS         "matheus_gregorio_muniz_arcanjo";


-- Criação do usuário "matheus_gregorio_muniz_arcanjo".

CREATE USER                 matheus_gregorio_muniz_arcanjo 

WITH                        SUPERUSER

CREATEDB                    CREATEROLE 

ENCRYPTED PASSWORD          'mathgarcanjo';


-- Entrar no usuário "matheus_gregorio_muniz_arcanjo".

\c                          'postgresql://matheus_gregorio_muniz_arcanjo:mathgarcanjo@localhost/postgres';


-- Criação do banco de dados "uvv".

CREATE DATABASE             uvv 

WITH OWNER                  matheus_gregorio_muniz_arcanjo  

TEMPLATE                    template0 

ENCODING                    UTF8  

lc_collate                  'pt_BR.UTF-8'

lc_ctype                   'pt_BR.UTF-8'  

allow_connections          true;


-- Conexão ao banco de dados criado.

\c                          uvv;


-- Criação do esquema "lojas".

CREATE SCHEMA               lojas

AUTHORIZATION               matheus_gregorio_muniz_arcanjo;


-- Confirmar se o esquema "public" é o esquema atual padrão.

SELECT                      CURRENT_SCHEMA();


-- Mostrar a ordem dos esquemas.

SHOW                        SEARCH_PATH;


-- Alteração do search_path para o usuário criado.

SET SEARCH_PATH TO          lojas, "$user", public;


-- Mostrar a ordem dos esquemas para conferir se a alteração foi realizada com sucesso.

SHOW                        SEARCH_PATH;


-- Estabelecer a modificação realizada anteriormente de forma permanente.

ALTER USER                  matheus_gregorio_muniz_arcanjo

SET SEARCH_PATH TO          lojas, "$user", public;


-- Comentário referente ao banco de dados "uvv".

COMMENT ON DATABASE         uvv

IS                          'Banco de dados usado no PSET.';


-- Criação da tabela "produtos" no esquema "lojas".


CREATE TABLE                lojas.produtos (

produto_id                  NUMERIC(38) NOT NULL,

nome                        VARCHAR(255) NOT NULL,

preco_unitario              NUMERIC(10,2),

detalhes                    BYTEA,

imagem                      BYTEA,

imagem_mime_type            VARCHAR(512),

imagem_arquivo              VARCHAR(512),

imagem_charset              VARCHAR(512),

imagem_ultima_atualizacao   DATE,

CONSTRAINT                  produtos_pk 

PRIMARY KEY                 (produto_id));


-- Comentário referente à criação da tabela "produtos".

COMMENT ON TABLE            lojas.produtos

IS                          'Criação da tabela "produtos", a fim de abranger dados sobre os produtos.';


-- Comentário referente à criação da coluna "produto_id" na tabela "produtos".

COMMENT ON COLUMN           lojas.produtos.produto_id

IS                          'Criação da PK "produto_id" na tabela "produtos".';


-- Comentário referente à criação da coluna "nome" na tabela "produtos".

COMMENT ON COLUMN           lojas.produtos.nome

IS                          'Criação da coluna "nome" na tabela "produtos".';


-- Comentário referente à criação da coluna "preco_unitario" na tabela "produtos".

COMMENT ON COLUMN           lojas.produtos.preco_unitario 

IS                          'Criação da coluna "preco_unitario" na tabela "produtos".';


-- Comentário referente à criação da coluna "detalhes" na tabela "produtos".

COMMENT ON COLUMN           lojas.produtos.detalhes 

IS                          'Criação da coluna "detalhes" na tabela "produtos".';


-- Comentário referente à criação da coluna "imagem" na tabela "produtos".

COMMENT ON COLUMN           lojas.produtos.imagem 

IS                          'Criação da coluna "imagem" na tabela "produtos".';


-- Comentário referente à criação da coluna "imagem_mime_type" na tabela "produtos".

COMMENT ON COLUMN           lojas.produtos.imagem_mime_type 

IS                          'Criação da coluna "imagem_mime_type" na tabela "produtos".';


-- Comentário referente à criação da coluna "imagem_arquivo" na tabela "produtos".

COMMENT ON COLUMN           lojas.produtos.imagem_arquivo 

IS                          'Criação da coluna "imagem_arquivo" na tabela "produtos".';


-- Comentário referente à criação da coluna "imagem_charset" na tabela "produtos".

COMMENT ON COLUMN           lojas.produtos.imagem_charset 

IS                          'Criação da coluna "imagem_charset" na tabela "produtos".';


-- Comentário referente à criação da coluna "imagem_ultima_atualizacao" na tabela "produtos".

COMMENT ON COLUMN           lojas.produtos.imagem_ultima_atualizacao 

IS                          'Criação da coluna "imagem_ultima_atualizacao" na tabela "produtos".';


-- Criação da tabela "lojas" no esquema "lojas".

CREATE TABLE                lojas.lojas (

loja_id                     NUMERIC(38) NOT NULL,

nome                        VARCHAR(255) NOT NULL,

endereco_web                VARCHAR(100),

endereco_fisico             VARCHAR(512),

latitude                    NUMERIC,

longitude                   NUMERIC,

logo                        BYTEA,

logo_mime_type              VARCHAR(512),

logo_arquivo                VARCHAR(512),

logo_charset                VARCHAR(512),

logo_ultima_atualizacao     DATE,

CONSTRAINT                  lojas_pk 

PRIMARY KEY                 (loja_id));


-- Comentário referente à criação da tabela "lojas".

COMMENT ON TABLE            lojas.lojas 

IS                          'Criação da tabela "lojas", a fim de abranger dados sobre as lojas.';


-- Comentário referente à criação da coluna "loja_id" na tabela "lojas".

COMMENT ON COLUMN           lojas.lojas.loja_id 

IS                          'Criação da PK "loja_id" na tabela "lojas".';


-- Comentário referente à criação da coluna "nome" na tabela "lojas".

COMMENT ON COLUMN           lojas.lojas.nome 

IS                          'Criação da coluna "nome" na tabela "lojas".';


-- Comentário referente à criação da coluna "endereco_web" na tabela "lojas".

COMMENT ON COLUMN           lojas.lojas.endereco_web 

IS                          'Criação da coluna "endereco_web" na tabela "lojas".';


-- Comentário referente à criação da coluna "endereco_fisico" na tabela "lojas".

COMMENT ON COLUMN           lojas.lojas.endereco_fisico 

IS                          'Criação da coluna "endereco_fisico" na tabela "lojas".';


-- Comentário referente à criação da coluna "latitude" na tabela "lojas".

COMMENT ON COLUMN           lojas.lojas.latitude 

IS                          'Criação da coluna "latitude" na tabela "lojas".';


-- Comentário referente à criação da coluna "longitude" na tabela "lojas".

COMMENT ON COLUMN           lojas.lojas.longitude 

IS                          'Criação da coluna "longitude" na tabela "lojas".';


-- Comentário referente à criação da coluna "logo" na tabela "lojas".

COMMENT ON COLUMN           lojas.lojas.logo

IS                          'Criação da coluna "logo" na tabela "lojas".';


-- Comentário referente à criação da coluna "logo_mime_type" na tabela "lojas".

COMMENT ON COLUMN           lojas.lojas.logo_mime_type 

IS                          'Criação da coluna "logo_mime_type" na tabela "lojas".';


-- Comentário referente à criação da coluna "logo_arquivo" na tabela "lojas".

COMMENT ON COLUMN           lojas.lojas.logo_arquivo 

IS                          'Criação da coluna "logo_arquivo" na tabela "lojas".';


-- Comentário referente à criação da coluna "logo_charset" na tabela "lojas".

COMMENT ON COLUMN           lojas.lojas.logo_charset 

IS                          'Criação da coluna "logo_charset" na tabela "lojas".';


-- Comentário referente à criação da coluna "logo_ultima_atualizacao" na tabela "lojas".

COMMENT ON COLUMN           lojas.lojas.logo_ultima_atualizacao 

IS                          'Criação da coluna "logo_ultima_atualizacao" na tabela "lojas".';


-- Criação da tabela "estoques" no esquema "lojas".

CREATE TABLE                lojas.estoques (

estoque_id                  NUMERIC(38) NOT NULL,

loja_id                     NUMERIC(38) NOT NULL,

produto_id                  NUMERIC(38) NOT NULL,

quantidade                  NUMERIC(38) NOT NULL,

CONSTRAINT                  estoques_pk 

PRIMARY KEY                 (estoque_id));


-- Comentário referente à criação da tabela "estoques".

COMMENT ON TABLE            lojas.estoques 

IS                          'Criação da tabela "estoques", a fim de abranger dados sobre os estoques.';


-- Comentário referente à criação da coluna "estoque_id" na tabela "estoques".

COMMENT ON COLUMN           lojas.estoques.estoque_id 

IS                          'Criação da PK "estoque_id" na tabela "estoques".';


-- Comentário referente à criação da coluna "loja_id" na tabela "estoques".

COMMENT ON COLUMN           lojas.estoques.loja_id 

IS                          'Criação da FK "loja_id" na tabela "estoques".';


-- Comentário referente à criação da coluna "produto_id" na tabela "estoques".

COMMENT ON COLUMN           lojas.estoques.produto_id 

IS                          'Criação da FK "produto_id" na tabela "estoques".';


-- Comentário referente à criação da coluna "quantidade" na tabela "estoques".

COMMENT ON COLUMN           lojas.estoques.quantidade 

IS                          'Criação da coluna "quantidade" na tabela "estoques".';


-- Criação da tabela "clientes" no esquema "lojas".

CREATE TABLE                lojas.clientes (

cliente_id                  NUMERIC(38) NOT NULL,

email                       VARCHAR(255) NOT NULL,

nome                        VARCHAR(255) NOT NULL,

telefone1                   VARCHAR(20),

telefone2                   VARCHAR(20),

telefone3                   VARCHAR(20),

CONSTRAINT                  clientes_pk 

PRIMARY KEY                 (cliente_id));


-- Comentário referente à criação da tabela "clientes".

COMMENT ON TABLE            lojas.clientes 

IS                          'Criação da tabela "clientes", a fim de abranger dados sobre os clientes.';


-- Comentário referente à criação da coluna "cliente_id" na tabela "clientes".

COMMENT ON COLUMN           lojas.clientes.cliente_id 

IS                          'Criação da PK "cliente_id" na tabela "clientes".';	


-- Comentário referente à criação da coluna "email" na tabela "clientes".

COMMENT ON COLUMN           lojas.clientes.email 

IS                          'Criação da coluna "email" na tabela "clientes".';


-- Comentário referente à criação da coluna "nome" na tabela "clientes".

COMMENT ON COLUMN           lojas.clientes.nome 

IS                          'Criação da coluna "nome" na tabela "clientes".';


-- Comentário referente à criação da coluna "telefone1" na tabela "clientes".

COMMENT ON COLUMN           lojas.clientes.telefone1 

IS                          'Criação da coluna "telefone1" na tabela "clientes".';


-- Comentário referente à criação da coluna "telefone2" na tabela "clientes".

COMMENT ON COLUMN           lojas.clientes.telefone2 

IS                          'Criação da coluna "telefone2" na tabela "clientes".';


-- Comentário referente à criação da coluna "telefone3" na tabela "clientes".

COMMENT ON COLUMN           lojas.clientes.telefone3 

IS                          'Criação da coluna "telefone3" na tabela "clientes".';


-- Criação da tabela "envios" no esquema "lojas".

CREATE TABLE                lojas.envios (

envio_id                    NUMERIC(38) NOT NULL,

loja_id                     NUMERIC(38) NOT NULL,

cliente_id                  NUMERIC(38) NOT NULL,

endereco_entrega            VARCHAR(512) NOT NULL,

status                      VARCHAR(15) NOT NULL,

CONSTRAINT                  envios_pk

PRIMARY KEY                 (envio_id));


-- Comentário referente à criação da tabela "envios".

COMMENT ON TABLE            lojas.envios 

IS                          'Criação da tabela "envios", a fim de abranger dados sobre os envios.';


-- Comentário referente à criação da coluna "envio_id" na tabela "envios".

COMMENT ON COLUMN           lojas.envios.envio_id 

IS                          'Criação da PK "envio_id" na tabela "envios".';


-- Comentário referente à criação da coluna "loja_id" na tabela "envios".

COMMENT ON COLUMN           lojas.envios.loja_id

IS                         'Criação da FK "loja_id" na tabela "envios".';


-- Comentário referente à criação da coluna "cliente_id" na tabela "envios".

COMMENT ON COLUMN           lojas.envios.cliente_id

IS                         'Criação da FK "cliente_id" na tabela "envios".';


-- Comentário referente à criação da coluna "endereco_entrega" na tabela "envios".

COMMENT ON COLUMN           lojas.envios.endereco_entrega 

IS                          'Criação da coluna "endereco_entrega" na tabela "envios".';


-- Comentário referente à criação da coluna "status" na tabela "envios".

COMMENT ON COLUMN           lojas.envios.status 

IS                          'Criação da coluna "status" na tabela "envios".';


-- Criação da tabela "pedidos" no esquema "lojas".

CREATE TABLE                lojas.pedidos (

pedido_id                   NUMERIC(38) NOT NULL,

data_hora                   TIMESTAMP NOT NULL,

cliente_id                  NUMERIC(38) NOT NULL,

status                      VARCHAR(15) NOT NULL,

loja_id                     NUMERIC(38) NOT NULL,

CONSTRAINT                  pedidos_pk 

PRIMARY KEY                 (pedido_id));


-- Comentário referente à criação da tabela "pedidos".

COMMENT ON TABLE            lojas.pedidos 

IS                          'Criação da tabela "pedidos", a fim de abranger dados sobre os pedidos.';


-- Comentário referente à criação da coluna "pedido_id" na tabela "pedidos".

COMMENT ON COLUMN           lojas.pedidos.pedido_id

IS                         'Criação da PK "pedido_id" na tabela "pedidos".';


-- Comentário referente à criação da coluna "data_hora" na tabela "pedidos".

COMMENT ON COLUMN           lojas.pedidos.data_hora 

IS                          'Criação da coluna "data_hora" na tabela "pedidos".';


-- Comentário referente à criação da coluna "cliente_id" na tabela "pedidos".

COMMENT ON COLUMN           lojas.pedidos.cliente_id

IS                          'Criação da FK "cliente_id" na tabela "pedidos".';


-- Comentário referente à criação da coluna "status" na tabela "pedidos".

COMMENT ON COLUMN           lojas.pedidos.status 

IS                          'Criação da coluna "status" na tabela "pedidos".';


-- Comentário referente à criação da coluna "loja_id" na tabela "pedidos".

COMMENT ON COLUMN           lojas.pedidos.loja_id

IS                         'Criação da FK "loja_id" na tabela "pedidos".';


-- Criação da tabela "pedidos_itens" no esquema "lojas".

CREATE TABLE                lojas.pedidos_itens (

pedido_id                   NUMERIC(38) NOT NULL,

produto_id                  NUMERIC(38) NOT NULL,

numero_da_linha             NUMERIC(38) NOT NULL,

preco_unitario              NUMERIC(10,2) NOT NULL,

quantidade                  NUMERIC(38) NOT NULL,

envio_id                    NUMERIC(38),

CONSTRAINT                  pedidos_itens_pk 

PRIMARY KEY                 (pedido_id, produto_id));


-- Comentário referente à criação da tabela "pedidos_itens".

COMMENT ON TABLE            lojas.pedidos_itens 

IS                          'Criação da tabela "pedidos_itens".';


-- Comentário referente à criação da coluna "pedido_id" na tabela "pedidos_itens".

COMMENT ON COLUMN           lojas.pedidos_itens.pedido_id 

IS                          'Criação da PFK "pedido_id" na tabela "pedidos_itens".';


-- Comentário referente à criação da coluna "produto_id" na tabela "pedidos_itens".

COMMENT ON COLUMN           lojas.pedidos_itens.produto_id 

IS                          'Criação da PFK "produto_id" na tabela "pedidos_itens".';


-- Comentário referente à criação da coluna "numero_da_linha" na tabela "pedidos_itens".

COMMENT ON COLUMN           lojas.pedidos_itens.numero_da_linha 

IS                          'Criação da coluna "numero_da_linha" na tabela "pedidos_itens".';


-- Comentário referente à criação da coluna "preco_unitario" na tabela "pedidos_itens".

COMMENT ON COLUMN           lojas.pedidos_itens.preco_unitario 

IS                          'Criação da coluna "preco_unitario" na tabela "pedidos_itens".';


-- Comentário referente à criação da coluna "quantidade" na tabela "pedidos_itens".

COMMENT ON COLUMN           lojas.pedidos_itens.quantidade 

IS                          'Criação da coluna "quantidade" na tabela "pedidos_itens".';


-- Comentário referente à criação da coluna "envio_id" na tabela "pedidos_itens".

COMMENT ON COLUMN           lojas.pedidos_itens.envio_id 

IS                          'Criação da FK "envio_id" na tabela "pedidos_itens".';



-- Criação do relacionamento entre a tabela "estoques" e a tabela "produtos".

ALTER TABLE                 lojas.estoques 

ADD CONSTRAINT              produtos_estoques_fk

FOREIGN KEY                 (produto_id)

REFERENCES                  lojas.produtos (produto_id)

ON DELETE                   NO ACTION

ON UPDATE                   NO ACTION

NOT DEFERRABLE;


-- Criação do relacionamento entre a tabela "pedidos_itens" e a tabela "produtos".

ALTER TABLE                 lojas.pedidos_itens 

ADD CONSTRAINT              produtos_pedidos_itens_fk

FOREIGN KEY                 (produto_id)

REFERENCES                  lojas.produtos (produto_id)

ON DELETE                   NO ACTION

ON UPDATE                   NO ACTION

NOT DEFERRABLE;


-- Criação do relacionamento entre a tabela "envios" e a tabela "lojas".

ALTER TABLE                 lojas.envios 

ADD CONSTRAINT              lojas_envios_fk

FOREIGN KEY                 (loja_id)

REFERENCES                  lojas.lojas (loja_id)

ON DELETE                   NO ACTION

ON UPDATE                   NO ACTION

NOT DEFERRABLE;


-- Criação do relacionamento entre a tabela "estoques" e a tabela "lojas".

ALTER TABLE                 lojas.estoques 

ADD CONSTRAINT              lojas_estoques_fk

FOREIGN KEY                 (loja_id)

REFERENCES                  lojas.lojas (loja_id)

ON DELETE                   NO ACTION

ON UPDATE                   NO ACTION

NOT DEFERRABLE;


-- Criação do relacionamento entre a tabela "pedidos" e a tabela "lojas".

ALTER TABLE                 lojas.pedidos 

ADD CONSTRAINT              lojas_pedidos_fk

FOREIGN KEY                 (loja_id)

REFERENCES                  lojas.lojas (loja_id)

ON DELETE                   NO ACTION

ON UPDATE                   NO ACTION

NOT DEFERRABLE;


-- Criação do relacionamento entre a tabela "pedidos" e a tabela "clientes".

ALTER TABLE                 lojas.pedidos

ADD CONSTRAINT              clientes_pedidos_fk

FOREIGN KEY                 (cliente_id)

REFERENCES                  lojas.clientes (cliente_id)

ON DELETE                   NO ACTION

ON UPDATE                   NO ACTION

NOT DEFERRABLE;


-- Criação do relacionamento entre a tabela "envios" e a tabela "clientes".

ALTER TABLE                 lojas.envios 

ADD CONSTRAINT              clientes_envios_fk

FOREIGN KEY                 (cliente_id)

REFERENCES                  lojas.clientes (cliente_id)

ON DELETE                   NO ACTION

ON UPDATE                   NO ACTION

NOT DEFERRABLE;


-- Criação do relacionamento entre a tabela "pedidos_itens" e a tabela "envios".

ALTER TABLE                 lojas.pedidos_itens 

ADD CONSTRAINT              envios_pedidos_itens_fk

FOREIGN KEY                 (envio_id)

REFERENCES                  lojas.envios (envio_id)

ON DELETE                   NO ACTION

ON UPDATE                   NO ACTION

NOT DEFERRABLE;


-- Criação do relacionamento entre a tabela "pedidos_itens" e a tabela "pedidos".

ALTER TABLE                 lojas.pedidos_itens 

ADD CONSTRAINT              pedidos_pedidos_itens_fk

FOREIGN KEY                 (pedido_id)

REFERENCES                  lojas.pedidos (pedido_id)

ON DELETE                   NO ACTION

ON UPDATE                   NO ACTION

NOT DEFERRABLE;


-- Restrição de checagem na coluna "preco_unitario" da tabela "produtos".

ALTER TABLE                 lojas.produtos

ADD CONSTRAINT              check_preco_unitario_positivo

CHECK                       (lojas.produtos.preco_unitario >= 0);


-- Restrição de checagem na coluna "quantidade" da tabela "pedidos_itens".

ALTER TABLE                 lojas.pedidos_itens

ADD CONSTRAINT              check_quantidade_positivo

CHECK                       (lojas.pedidos_itens.quantidade >= 0);


-- Restrição de checagem na coluna "numero_da_linha" da tabela "pedidos_itens".

ALTER TABLE                 lojas.pedidos_itens

ADD CONSTRAINT              check_numero_da_linha_positivo

CHECK                       (lojas.pedidos_itens.numero_da_linha >= 0);


-- Restrição de checagem na coluna "preco_unitario" da tabela "pedidos_itens".

ALTER TABLE                  lojas.pedidos_itens

ADD CONSTRAINT               check_preco_unitario_positivo

CHECK                        (lojas.pedidos_itens.preco_unitario >= 0);


-- Restrição de checagem na coluna "quantidade" da tabela "estoques".

ALTER TABLE                  lojas.estoques

ADD CONSTRAINT               check_quantidade_positivo

CHECK                        (lojas.estoques.quantidade >= 0);


-- Restrição de checagem na coluna "status" da tabela "pedidos".

ALTER TABLE                 lojas.pedidos

ADD CONSTRAINT              check_status_valido

CHECK                       (lojas.pedidos.status IN ('COMPLETO', 'PAGO', 'ABERTO', 'REEMBOLSADO', 'ENVIADO', 'CANCELADO'));


-- Restrição de checagem na coluna "status" da tabela "envios".

ALTER TABLE                 lojas.envios

ADD CONSTRAINT              check_status_valido

CHECK                       (lojas.envios.status IN ('ENVIADO', 'CRIADO', 'TRANSITO', 'ENTREGUE'));


-- Restrição de checagem nas colunas "endereco_fisico" e "endereco_web" da tabela "lojas".

ALTER TABLE                 lojas.lojas

ADD CONSTRAINT              check_endereco_preenchido

CHECK                       ((lojas.lojas.endereco_web IS NOT NULL) OR (lojas.lojas.endereco_fisico IS NOT NULL));


-- Restrição de checagem na coluna "cliente_id" da tabela "clientes".

ALTER TABLE                  lojas.clientes

ADD CONSTRAINT               check_cliente_id_positivo

CHECK                        (lojas.clientes.cliente_id > 0);


-- Restrição de checagem na coluna "cliente_id" da tabela "pedidos".

ALTER TABLE                  lojas.pedidos

ADD CONSTRAINT               check_cliente_id_positivo

CHECK                        (lojas.pedidos.cliente_id > 0);


-- Restrição de checagem na coluna "pedido_id" da tabela "pedidos".

ALTER TABLE                  lojas.pedidos

ADD CONSTRAINT               check_pedido_id_positivo

CHECK                        (lojas.pedidos.pedido_id > 0);


-- Restrição de checagem na coluna "loja_id" da tabela "pedidos".

ALTER TABLE                  lojas.pedidos

ADD CONSTRAINT               check_loja_id_positivo

CHECK                        (lojas.pedidos.loja_id > 0);


-- Restrição de checagem na coluna "loja_id" da tabela "envios".

ALTER TABLE                  lojas.envios

ADD CONSTRAINT               check_loja_id_positivo

CHECK                        (lojas.envios.loja_id > 0);


-- Restrição de checagem na coluna "cliente_id" da tabela "envios".

ALTER TABLE                  lojas.envios

ADD CONSTRAINT               check_cliente_id_positivo

CHECK                        (lojas.envios.cliente_id > 0);


-- Restrição de checagem na coluna "envio_id" da tabela "envios".

ALTER TABLE                  lojas.envios

ADD CONSTRAINT               check_envio_id_positivo

CHECK                        (lojas.envios.envio_id > 0);


-- Restrição de checagem na coluna "loja_id" da tabela "lojas".

ALTER TABLE                  lojas.lojas

ADD CONSTRAINT               check_loja_id_positivo

CHECK                        (lojas.lojas.loja_id > 0);


-- Restrição de checagem na coluna "estoque_id" da tabela "estoques".

ALTER TABLE                  lojas.estoques

ADD CONSTRAINT               check_estoque_id_positivo

CHECK                        (lojas.estoques.estoque_id > 0);


-- Restrição de checagem na coluna "loja_id" da tabela "estoques".

ALTER TABLE                  lojas.estoques

ADD CONSTRAINT               check_loja_id_positivo

CHECK                        (lojas.estoques.loja_id > 0);


-- Restrição de checagem na coluna "produto_id" da tabela "estoques".

ALTER TABLE                  lojas.estoques

ADD CONSTRAINT               check_produto_id_positivo

CHECK                        (lojas.estoques.produto_id > 0);


-- Restrição de checagem na coluna "produto_id" da tabela "produtos".

ALTER TABLE                  lojas.produtos

ADD CONSTRAINT               check_produto_id_positivo

CHECK                        (lojas.produtos.produto_id > 0);


-- Restrição de checagem na coluna "pedido_id" da tabela "pedidos_itens".

ALTER TABLE                  lojas.pedidos_itens

ADD CONSTRAINT               check_pedido_id_positivo

CHECK                        (lojas.pedidos_itens.pedido_id > 0);


-- Restrição de checagem na coluna "envio_id" da tabela "pedidos_itens".

ALTER TABLE                  lojas.pedidos_itens

ADD CONSTRAINT               check_envio_id_positivo

CHECK                        (lojas.pedidos_itens.envio_id > 0);
