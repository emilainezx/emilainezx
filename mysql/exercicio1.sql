create database exercicio1;
use exercicio1;
create table ano (
	idAno int primary key auto_increment not null,
    ano int not null
);
create table veiculo (
	idVeiculo int primary key auto_increment not null,
    descricao varchar(150),
    valor int not null,
    idModelo int not null,
    idFabricante int not null,
    idAno int not null,
    dataCompra date not null
);
create table modelo (
	idModelo int primary key auto_increment not null,
    descricao varchar(150)
);
create table fabricante (
	idFabricante int primary key auto_increment not null,
    nome varchar(60) not null,
    cidade varchar(60) not null,
    endereco varchar(200) not null,
    uf char(2) not null,
    telefone char(11) not null,
    contato char(11)
);
create table vendasanuais (
	idVendas int primary key auto_increment not null,
    qtd int not null,
    idVeiculo int not null,
    idAno int not null,
    idMes int not null
);
create table mes (
	idMes int primary key auto_increment not null,
    mes varchar(11) not null
);
alter table veiculo
add constraint fk_vei_ano foreign key (idAno)
	references ano (idAno);
alter table vendasanuais
add constraint fk_ven_vei foreign key (idVeiculo)
 references veiculo (idVeiculo);
alter table vendasanuais
 add constraint fk_mes_ven foreign key (idMes)
	references mes (idMes);
alter table vendasanuais
 add constraint fk_ano_ven foreign key (idAno)
	references ano (idAno);
alter table veiculo
add constraint fk_ve_mod foreign key (idModelo)
	references modelo (idModelo);
alter table veiculo
add constraint fk_ve_fa foreign key (idFabricante)
	references fabricante (idFabricante);
insert into ano
(ano)
values
('2020'),
('2021'),
('2022'),
('2023'),
('2024');
insert into mes
(mes)
values
('janeiro'),
('fevereiro'),
('março'),
('abril'),
('maio');
insert into fabricante
(nome,cidade,endereco,uf,telefone,contato)
values
('Vulcan Motors','Recife','Rua das Palmeiras, 120','PE','8199001122','81991002211'),
('NordCar','Fortaleza','Av. Beira Mar, 890','CE','8599887766','85997766554'),
('SolAuto','Salvador','Rua do Farol, 45','BA','7199003456','71998554433'),
('TurboLine','João Pessoa','Av. Atlântica, 300','PB','83993001234','8399888123'),
('MetalDrive','Natal','Rua das Dunas, 77','RN','84992005678','84998114455');
insert into modelo
(descricao)
values
('falcon x1'),
('horizon 200'),
('stratus GT'),
('urban life'),
('thinder pro');
insert into veiculo
(descricao,valor,idModelo,idFabricante,idAno,dataCompra)
values
('falcon X1 Preto','85000','1','1','1','2022-03-15'),
('forizon 200 Branco','76000','2','2','2','2021-11-02'),
('stratus GT Vermelho','120000','3','3','3','2023-07-19'),
('urban Lite Cinza','68000','4','4','4','2020-09-10'),
('thunder Pro Azul','132000','5','5','5','2024-01-25');
insert into vendasanuais
(qtd,idVeiculo,idAno,idMes)
values
('9','16','1','1'),
('8','17','2','2'),
('15','18','3','3'),
('5','19','4','4'),
('17','20','5','5');