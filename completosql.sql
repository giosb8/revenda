create database db_revenda_giovana;

create table endereco(
	id serial primary key,
	logradouro varchar(100) not null,
	localidade varchar (100) not null,
	uf char(2) not null,
	cep char(8) not null,
	bairro varchar(100) not null,
	numero char(6) not null
);

create table usuario(
	id serial primary key,
	nome varchar(50) not null,
	cpf char(8) not null unique,
	telefone char(9) not null, 
	endereco_id int, foreign key (endereco_id) references endereco(id)
);

create table produto(
	id serial primary key,
	nome varchar(50) not null,
	descricao text,
	peso float not null,
	valor int not null,
	taxa_entrega int
);

create table pedido(
	id serial primary key,
	produto_id int, foreign key (produto_id) references produto(id),
	endereco_id int, foreign key (endereco_id) references endereco(id),
	pagamento_id int, foreign key (pagamento_id), references pagamento(id)
);

create table cartao(
	id serial primary key,
	numero int not null unique,
	validade date not null,
	senha varchar(6) not null unique,
	nome_cartao varchar(60)
);

create table pix(
	id serial primary key,
	cod varchar(20) not null
);

create table pagamento(
	id serial primary key,
	cartao_id int, foreign key (cartao_id) references cartao(id),
	pix_id int,foreign key (pix_id) references pix(id)
);

insert into endereco(id,logradouro,localidade,uf,cep,bairro,numero)
values (1, 'Rua das Flores', 'São Paulo', 'SP', '01001000', 'Centro', '123'),
  (2, 'Avenida Brasil', 'Rio de Janeiro', 'RJ', '20040002', 'Copacabana', '456'),
  (3, 'Rua XV de Novembro', 'Curitiba', 'PR', '80020010', 'Centro', '789'),
  (4, 'Rua Augusta', 'São Paulo', 'SP', '01305000', 'Consolação', '321'),
  (5,'Avenida Paulista', 'São Paulo', 'SP', '01311000', 'Bela Vista', '654'),
  (6,'Rua da Praia', 'Porto Alegre', 'RS', '90010000', 'Centro Histórico', '987'),
  (7,'Rua das Acácias', 'Belo Horizonte', 'MG', '30140071', 'Savassi', '159'),
  (8,'Avenida Getúlio Vargas', 'Salvador', 'BA', '40060000', 'Barra', '753'),
  (9,'Rua das Laranjeiras', 'Fortaleza', 'CE', '60055000', 'Meireles', '852'),
  (10,'Rua Domingos Olímpio', 'Fortaleza', 'CE', '60010000', 'Centro', '951');

insert into usuario(id,nome, cpf,telefone, endereco_id)
values
  (1, 'Ana Souza', '12345678', '912345678', 1),
  (2, 'Bruno Lima', '23456789', '923456789', 2),
  (3, 'Carla Mendes', '34567890', '934567890', 3),
  (4, 'Daniel Rocha', '45678901', '945678901', 4),
  (5, 'Elaine Costa', '56789012', '956789012', 5),
  (6, 'Fernando Alves', '67890123', '967890123', 6),
  (7, 'Giselle Martins', '78901234', '978901234', 7),
  (8, 'Henrique Dias', '89012345', '989012345', 8),
  (9, 'Isabela Ferreira', '90123456', '990123456', 9),
  (10,'João Vitor', '01234567', '901234567', 10);
  
 INSERT INTO produto (id,nome, descricao, peso, valor, taxa_entrega)
VALUES
  (1, 'Hidratante Facial Neutro', 'Creme leve para uso diário, ideal para peles sensíveis.', 0.150, 35, 10),
  (2, 'Creme Antissinais Noturno', 'Combate linhas de expressão enquanto você dorme.', 0.100, 58, 12),
  (3, 'Loção Corporal Hidratante', 'Rico em vitaminas, indicado para pele seca.', 0.250, 42, 15),
  (4, 'Gel Antiacne', 'Reduz cravos e espinhas com uso contínuo.', 0.080, 28, 8),
  (5, 'Creme Clareador de Manchas', 'Auxilia no clareamento de manchas e uniformiza o tom da pele.', 0.120, 65, 10),
  (6, 'Creme Antirrugas com Retinol', 'Fórmula potente com ação rejuvenescedora.', 0.110, 75, 12),
  (7, 'Creme Hidratante com Ácido Hialurônico', 'Proporciona hidratação profunda e duradoura.', 0.130, 68, 10),
  (8, 'Creme Calmante Pós-sol', 'Alivia a vermelhidão e hidrata após exposição ao sol.', 0.200, 39, 9),
  (9, 'Creme Nutritivo Noturno', 'Nutre intensamente durante o sono.', 0.150, 55, 11),
  (10, 'Creme Esfoliante Facial', 'Remove impurezas e células mortas sem agredir a pele.', 0.090, 33, 7);
 
 insert into pedido(id,produto_id,endereco_id,pagamento_id)
 values
 	(1,1,1,1),
 	(2,2,2,2),
 	(3,3,3,3),
 	(4,4,4,4),
 	(5,5,5,5),
 	(6,6,6,6),
 	(7,7,7,7),
 	(8,8,8,8),
 	(9,9,9,9),
 	(10,10,10,10);
		
 insert into pagamento(id,cartao_id,pix_id)
 values
 	(1,1,1),
 	(2,2,2),
 	(3,3,3),
 	(4,4,4),
 	(5,5,5),
 	(6,6,6),
 	(7,7,7),
 	(8,8,8),
 	(9,9,9),
 	(10,10,10);
 	
 insert into cartao(id,numero, validade, senha, nome_cartao)
 values (1, 12345678, '2026-07-31', '123456', 'Ana Souza'),
  (2, 23456789, '2027-01-15', '234567', 'Bruno Lima'),
  (3, 34567890, '2025-12-01', '345678', 'Carla Mendes'),
  (4, 45678901, '2026-09-20', '456789', 'Daniel Rocha'),
  (5, 56789012, '2028-03-10', '567890', 'Elaine Costa'),
  (6, 67890123, '2025-11-05', '678901', 'Fernando Alves'),
  (7, 78901234, '2029-04-18', '789012', 'Giselle Martins'),
  (8, 89012345, '2027-06-30', '890123', 'Henrique Dias'),
  (9, 90123456, '2026-02-28', '901234', 'Isabela Ferreira'),
  (10, 11223344, '2028-08-25', '112233', 'João Vitor');
  
 insert into pix
 values (1,'12345678'),
	 (2,'23456789'),
	 (3,'34567890'),
	 (4,'45678901'),
	 (5, '56789012'),
	 (6, '67890123'),
	 (7, '78901234'),
	 (8, '89012345'),
	 (9, '90123456'),
	 (10, '01234567');
	 
	
	
CREATE VIEW usuario_produto AS
SELECT nome
FROM produto
WHERE id = '1'


CREATE VIEW pedido_endereco AS
select endereco_id
from pedido
WHERE id = '5';

select * from produto where id = '3';

select * from usuario where endereco_id = '5';


















