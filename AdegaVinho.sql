
create database AdegaVinhos;

create table Vinicula
(
	codVinicula bigint primary key,
    nomeVinicula varchar(100),
    descricaoVinicula text,
    foneVinicula varchar(15),
    emailVinicula varchar(15),
    codRegiao bigint,
    foreign key (codRegiao) references adegavinhos.Regiao (codRegiao)
);

create table Vinhos
(
	codVinho bigint primary key,
    nomeVinho varchar(50),
    tipoVinho varchar(30),
    anoVinho int,
    descricaoVinho text,
    codVinicula bigint,
    foreign key (codVinicula) references adegavinhos.Vinicula (codVinicula)
);

create table Regiao
(
	codRegiao bigint primary key,
    nomeRegiao varchar(100),
    descricaoRegiao text
);

insert into Regiao (codRegiao, nomeRegiao, descricaoRegiao)
values('1', 'Bourgogne', 'Bourgogne é uma das regiões de maior prestígio da Borgonha, incluindo alguns dos mais importantes terroir da França.'),
('2', 'Bordeaux', 'Bordeaux, talvez a mais celebrada e conhecida região vinícola do mundo, é a terra dos grandes Châteaux, que, em geral, fazem jus à fama de produzir vinhos muito elegantes, longevos, encorpados e classudos.'),
('3', 'Veneto', 'A região de Veneto, localizada no nordeste da Itália, é a terra natal de algumas das mais conhecidas denominações italianas, como Valpolicella, Bardolino e Prosecco.'),
('4','Alicante', 'A região de Alicante localiza-se no leste da Espanha, bem próxima de outras áreas vinícolas importantes, como Jumilla e Valência. A Espanha é um dos países com a maior gama de opções para os amantes dos bons vinhos.'),
('5','Mendoza', 'A região de Mendoza é conhecida como o berço do vinho argentino e possui a fama de produzir o melhor Malbec do mundo. Mendoza é responsável por 70% da produção de vinhos da Argentina.');


insert into Vinicula (codVinicula, nomeVinicula, descricaoVinicula, foneVinicula, emailVinicula, codRegiao)
values('001','Faiveley', 'Descrição Faiveley', '34566789', 'faiveley@gmail', '1'),
('002', 'Jm Cazes', 'Descrição Jm', '23467890', 'jm@gmail', '2'),
('003', 'Adami', 'Descrição Adami', '89641256', 'adami@gmail', '3'),
('004', 'Telmo', 'Descrição Telmo', '65387235', 'telmo@gmail', '4'),
('005', 'Zapata', 'Descrição Zapata', '58902376', 'zapata@gmail', '5');


insert into Vinhos (codVinho, nomeVinho, tipoVinho, anoVinho, descricaoVinho, codVinicula)
values('001', 'Joseph Faiveley Bourgogne', 'Tinto', '2019', 'Um excelente Bourgogne rouge, Joseph Faiveley é um vinho delicioso mas sério na opinião da Burghound', '001'),
('002', 'Jm Cazes', 'Tinto', '2010', 'Elaborado pela família Cazes, o Cordeillan-Bages é um vinho-boutique de Bordeaux', '002'),
('003', 'Adami', 'Espumante', '1999', 'Feito exclusivamente com uvas Prosecco de ótimos vinhedos nas comunas de Valdobbiadene e Vidor', '003'),
('004', 'Telmo', 'Tinto', '2019', 'Chamado de ""Terrific Value"" por Robert Parker, o cativante Al Muvedre recebeu 89 pontos do crítico na safra de 2009', '004'),
('005', 'Zapata', 'Tinto', '2019', 'A Cabernet Franc da Argentina é talvez a mais grata surpresa recente do mundo do vinho', '005');


select
	nomeVinho as Vinho,
    anoVinho as Ano,
    nomeVinicula as Vinicula,
    nomeRegiao as Região
from vinhos 
inner join
	vinicula 
    on vinhos.codVinicula = vinicula.codVinicula
inner join
	regiao 
    on vinicula.codRegiao = regiao.codRegiao
order by 
	nomeVinho;

drop user Sommelier@"localhost";
create user Sommelier@"localhost" identified by "1234" with max_queries_per_hour 40;
grant select on adegavinhos.vinhos to Sommelier@"localhost";
grant select (codVinicula, nomeVinicula) on vinicula to Sommelier@"localhost";