create database barbearia;
use barbearia;
create table cliente (
	cpf char(11) primary key not null,
    logradouro varchar(60) not null,
    numero int not null,
    complemento varchar(20),
    nome varchar(30) not null,
    telefone char(11) not null
);
create table trabalha (
	cod_fun int not null,
    seq_agenda int not null,
    constraint pk_tra primary key (cod_fun, seq_agenda)
);
create table funcionario (
	cod_fun int primary key auto_increment not null,
    nome varchar(30) not null,
    sexo char(1) not null,
    datanasc date not null
);
create table agendamento (
	seq_agenda int primary key auto_increment,
    data_hora date,
    cpf char(11),
    cod_ser int
);
create table servico (
	cod_ser int primary key auto_increment,
    des varchar(60),
    valor decimal(10,2)
);
alter table agendamento 
add constraint fk_agen_cli foreign key (cpf)
	references cliente (cpf);
alter table agendamento
add constraint fk_agen_ser foreign key (cod_ser)
	references servico (cod_ser);
alter table trabalha
add constraint fk_tra_agen foreign key (seq_agenda)
	references agendamento (seq_agenda);
alter table trabalha
add constraint fk_tra_fun foreign key (cod_fun)
	references funcionario (cod_fun);
insert into servico
(des,valor)
values
('corte masculino','30.00'),
('corte feminino','45.00'),
('escova','25.00'),
('hidratação','50.00'),
('manicure','15.00'),
('pedicure','25.00'),
('sobrancelha','15.00');
insert into funcionario
(nome,sexo,datanasc)
values
('ana souza','f','1994-04-12'),
('joão ribeiro','m','1990-01-22'),
('beatriz lima','f','1999-09-03'),
('marcos silva','m','1988-07-10'),
('carla menezes','f','1995-02-18'),
('rodrigo amorim','m','1993-11-29'),
('padrícia gomes','f','2000-05-09');
insert into cliente
(cpf,logradouro,numero,complemento,nome,telefone)
values
('11111111111','Rua Flores','12','Casa A','Marina Duarte','88999887766'),
('22222222222','Av. Central','89','Bloco B','Paulo Torres','88991234567'),
('33333333333','Rua Sol','45','Apt 303','Letícia Moraes','88998877655'),
('44444444444','Rua Pedra Azul','102','Casa 2','Carlos Neves','88997654321'),
('55555555555','Rua Palmeiras','9','Apt 202','Larissa Melo','88996543210'),
('66666666666','Av. Leste','210','Casa 7','Gustavo Lira','88998765432'),
('77777777777','Rua Horizonte','78','Casa 4','Camila Freitas','88993456789');
insert into agendamento
(data_hora,cpf,cod_ser)
values
('2024-07-20','11111111111','1'),
('2024-07-21','22222222222','3'),
('2024-07-22','33333333333','2'),
('2024-07-23','44444444444','7'),
('2024-07-24','55555555555','4'),
('2024-07-25','66666666666','5'),
('2024-07-26','77777777777','6');
insert into trabalha
(cod_fun,seq_agenda)
values
('1','1'),
('2','2'),
('3','3'),
('4','4'),
('5','5'),
('6','6'),
('7','7');