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
