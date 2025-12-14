create database agendamento;
use agendamento;
create table agendamento (
	id int primary key not null auto_increment,
    nome char(30) not null,
    telefone char(11) not null,
    dataagen date not null,
    horario datetime not null
);
create table fila (
    quantidade int not null
);
alter table fila
add constraint fk_fila_agen foreign key (id)
	references agendamento (id);
