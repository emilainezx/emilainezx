create database cantina;
use cantina;
create table cliente (
	cod_cli int primary key auto_increment not null,
    nom_cli varchar(30) not null,
    saldo_cli decimal(10,2),
    lim_cli decimal (10,2),
    cod_pat int not null,
    cod_lot int
);
create table lotacao (
	cod_lot int primary key auto_increment not null,
    nom_lot varchar(30) not null,
    sigla_lot char(3)
);
create table patente (
	cod_pat int primary key auto_increment not null,
    nom_pat varchar(30) not null,
    sigla_pat char(30) not null
);
create table tipo_prod (
	cod_tipo int primary key auto_increment not null,
    desc_tipo varchar(30) not null
);
create table fornecedor (
	cod_for int primary key auto_increment not null,
    nome_for varchar(30) not null,
    cont_for varchar(40)
);
create table produtos (
	cod_pro int primary key auto_increment not null,
    des_pro varchar(30) not null,
    cod_tipo int not null,
    cod_for int not null,
    qnd_prod int not null,
    uni_prod char(3) not null,
	niv_rep int
);
create table vendas (
	seq_ven int primary key auto_increment not null,
    data_vend date not null,
    val_tot decimal(10,2) not null,
    val_pago decimal(10,2) not null,
    qnd_itens int not null,
    cod_cli int not null,
    form_pag int not null
);
create table itens (
	seq_ven int not null,
    cod_pro int not null,
    val_item decimal(10,2) not null,
    qnd_item int not null,
    constraint pk_itens primary key (seq_ven, cod_pro)
);
create table pagamentos (
	seq_pgm int primary key auto_increment not null,
    cod_cli int not null,
    data_pgm date not null,
    val_pgm decimal(10,2) not null
);
create table caixa (
	data_caixa date primary key not null,
    data_abert date not null,
    hora_abert date not null,
	val_ini_din decimal(10,2) not null,
    val_fin_din decimal(10,2) not null,
    val_tot_ven decimal (10,2) not null
);
alter table itens
add constraint fk_itens_prod foreign key (cod_pro)
	references produtos (cod_pro);
alter table produtos
add constraint fk_prod_for foreign key (cod_for)
	references fornecedor (cod_for);
alter table produtos
add constraint fk_prod_tipo foreign key (cod_tipo)
	references tipo_prod (cod_tipo);
alter table vendas
add constraint fk_vendas_itens foreign key (seq_ven)
	references itens (seq_ven);
alter table vendas
add constraint fk_vendas_cli foreign key (cod_cli)
	references cliente (cod_cli);
alter table cliente
add constraint fk_lot_cliente foreign key (cod_lot)
	references lotacao (cod_lot);
alter table pagamentos 
add constraint fk_pag_cli foreign key (cod_cli)
	references cliente (cod_cli);
alter table cliente
add constraint fk_cli_pat foreign key (cod_pat)
	references patente (cod_pat);
insert into tipo_prod
(desc_tipo)
values
('Bebidas'),
('Padaria'),
('Limpeza'),
('Higiene'),
('Mercearia');
insert into fornecedor
(nome_for, cont_for)
values
('Silva Distribuidora','81999998888'),
('Mundo das Bebidas','81988887777'),
('LimpaTudo LTDA','81977776666'),
('Delícias do Trigo','81966665555'),
('Global Suprimentos','81955554444');
insert into produtos
(des_pro,cod_tipo,cod_for,qnd_prod,uni_prod,niv_rep)
values
('Refrigerante Cola 2L','1','2','40','UN','101'),
('Pão Francês ','2','4','200','UN','102'),
('Detergente Neutro','3','3','80','UN','103'),
('Sabonete Flor','4','3','150','UN','104'),
('Arroz Branco 5kg','5','5','60','UN','105');
insert into caixa
(data_caixa,data_abert,hora_abert,val_ini_din,val_fin_din,val_tot_ven)
values
('2025-01-10','2025-01-10','08:00:00','100.00','450.00','350.00'),
('2025-01-11','2025-01-11','08:00:00','100.00','520.00','420.00'),
('2025-01-12','2025-01-12','08:00:00','100.00','390.00','290.00'),
('2025-01-13','2025-01-13','08:00:00','100.00','600.00','500.00'),
('2025-01-14','2025-01-14','08:00:00','100.00','700.00','600.00');
insert into lotacao
(nom_lot,sigla_lot)
values
('Recife','REC'),
('Olinda','OLD'),
('Paulista','PAU'),
('Jaboatão','JAB'),
('Caruaru','CAR');
insert into patente
(nom_pat,sigla_pat)
values
('Básico','BAS'),
('Bronze','BRO'),
('Prata','PRA'),
('Ouro','OUR'),
('Diamante','DIA');
insert into cliente
(nom_cli,saldo_cli,lim_cli,cod_pat,cod_lot)
values
('João Carlos','1500.00','800.00','1','1'),
('Maria Helena','2800.00','1200.00','3','2'),
('Ana Paula','3500.00','2000.00','4','1'),
('Beatriz Souza','500.00','3000.00','5','4');