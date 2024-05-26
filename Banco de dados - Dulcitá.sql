create database dulcita;
use dulcita;

/* criando a tabela categorias */

create table categorias (
    id_categoria int auto_increment primary key,
    nome_categoria varchar(255) not null
);

/* inserindo dados na tabela categorias */

insert into categorias (nome_categoria) values ('Tradicionais');
insert into categorias (nome_categoria) values ('Recheados');
insert into categorias (nome_categoria) values ('Salgados');
insert into categorias (nome_categoria) values ('Mini Donuts');
insert into categorias (nome_categoria) values ('Donuts Flork');

/* criando a tabela donuts */

create table donuts (
	id_donut int auto_increment primary key,
	nome_donut varchar(255) not null,
    descricao_donut varchar(500) not null,
    preco_donut decimal(7,2) not null,
    id_categoria int not null,
    foreign key (id_categoria) references categorias (id_categoria)
);

/* selecionar a tabela donuts */

select * from donuts;

/* inserindo dados na tabela donuts */

insert into donuts(nome_donut,descricao_donut,preco_donut,id_categoria)
values
('Açúcar com canela','donut passado no açúcar refinado com canela em pó', 8.9, 1), 
('Chocolate ao leite','cobertura de chocolate ao leite e granulado', 10.9, 1),
('Blue','cobertura de chocolate branco tingido de azul e granulado colorido', 11.9, 1),
('Homer','cobertura de chocolate branco tingido de rosa e granulado colorido', 11.9, 1),
('Chocolate meio amargo','cobertura de chocolate meio amargo', 11.9, 1),
('Confete','cobertura de chocolate ao leite e coberto com confete', 11.9, 1),
('Nutella','cobertura generosa de Nutella', 14.9, 1),
('Ouro branco','cobertura de ganache de chocolate branco, fios de chocolate ao leite e ouro branco picado', 14.5, 1),
('Ninho','cobertura de brigadeiro de leite ninho finalizado com leite em pó', 13.9, 1),
('KitKat','cobertura de ganache de chocolate ao leite finalizado com KitKat', 13.9, 1),
('Stikadinho','cobertura de chocolate meio amargo, fios de recheio de morango e stikadinho', 13.9, 1),
('Churros','cobertura de brigadeiro de churros, polvilhado de açúcar e canela', 13.9, 1),
('Doce de leite','cobertura de doce de leite', 13.9, 1);

insert into donuts(nome_donut,descricao_donut,preco_donut,id_categoria)
values
('Kinder Bueno','recheado de Nutella e ganache branca, coberto de chocolate ao leite e Kinder Bueno', 19.9, 2),
('Ferrero Rocher','recheado com brigadeiro de ferrero, coberto com chocolate ao leite e amendoim e bombom ferrero', 19.9, 2),
('Petit Gateau','recheado com brigadeiro, coberto com chocolate meio amargo e uma generosa bola de sorvete', 19.9, 2),
('Nutella','recheado de Nutella com cobertura de Nutella', 19.9, 2),
('Ninho com Nutella','recheado com brigadeiro de ninho, coberto com Nutella, finalizado com chocoball', 18.9, 2),
('Banana nevada','recheado de ganache de chocolate braco, coberto com banana e casquinha de chocolate branco', 18.9, 2),
('Surpresa de uva','recheado com brigadeiro de ninho e uvas frescas, coberto com ganache de chocolate ao leite, uva e polvilhado de leite ninho', 18.9, 2),
('Ouro branco','recheio cremoso de ouro branco, coberto com chocolate branco, bombom de ouro branco picado e fios de chocolate ao leite', 17.9, 2),
('Super ninho','recheado de brigadeiro de ninho, coberto com brigadeiro de ninho, polvilhado com leite ninho', 15.9, 2),
('Stikadinho','recheado com creme de morango, coberto com chocolate meio amargo, fios de creme de morango e stikadinho', 15.9, 2),
('Oreo','brigadeiro de oreo, coberto com chocolate branco e oreo', 15.9, 2),
('Super doce de leite','recheado de doce de leite e coberto com doce de leite', 15.9, 2);

insert into donuts(nome_donut,descricao_donut,preco_donut,id_categoria)
values
('Frango Cremoso','donut coberto com delicioso frango cremoso desfiado e catupiry original', 16.9, 3),
('Baconpiry','donut coberto com catupiry original e cubos de bacon frito', 16.9, 3),
('Bacon cheddar','donut coberto com cheddar e cubos de bacon frito', 16.9, 3),
('Cheddar com doritos','donut coberto com cheddar e muitos doritos', 16.9, 3);

insert into donuts(nome_donut,descricao_donut,preco_donut,id_categoria)
values
('Mini donuts coberto','feito mediante encomenda de uma semana antes (pedido mínimo de 30 unidades)', 3.5, 4),
('Mini donuts recheado','feito mediante encomenda de uma semana antes (pedido mínimo de 30 unidades)', 5.00, 4);

insert into donuts(nome_donut,descricao_donut,preco_donut,id_categoria)
values
('Donuts flork coberto','donuts personalizado com desenho e frase (somente encomenda)', 17.5, 5),
('Donuts flork recheado','sabores disponíveis: nutella, ninho, morango e doce de leite', 21.9, 5);

