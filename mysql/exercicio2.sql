create database exercicio2;
use exercicio2;
create table usuario (
	id_usuario int primary key auto_increment not null,
    nome_usuario varchar(50) not null,
    tipo_usuario int not null,
    login_usuario varchar(12) not null,
    senha_usuario varchar(8) not null,
    ditinclusao_usuario char(10) not null
);
alter table usuario
modify tipo_usuario varchar(20) not null;
create table tiporeq (
	id_ti int primary key auto_increment not null,
    nome varchar(250) not null,
    obs varchar(255)
);
create table sertarefa (
	id_tar int primary key auto_increment not null,
    id_projeto int not null,
    id_usuario int not null,
    idtarefadep int not null,
    nome varchar(250) not null,
    inicio varchar(10) not null,
    fim varchar(10) not null,
    obs text
);
alter table sertarefa
modify inicio date not null,
modify fim date not null;
create table serprojeto (
	id_projeto int primary key auto_increment not null,
    nome varchar(250) not null,
    dt_inicio varchar(10) not null,
    idsergestor int not null,
    dt_termino varchar(10) not null,
    obs text
);
alter table serprojeto
modify dt_inicio date not null,
modify dt_termino date not null;
create table requisitos (
	id_req int primary key auto_increment not null,
    id_ti int not null,
    id_projeto int not null,
    id_tar int not null,
    descricao text,
    dataa varchar(10),
    tempo varchar(7)
);
alter table requisitos
modify dataa date,
modify tempo time;
create table diagrama (
	id_dia int primary key auto_increment not null,
    nome_diagrama varchar(65) not null,
    id_ator int not null,
    id_projeto int not null,
    imgdiagrama varchar(255) not null
);
create table ator (
	id_ator int primary key auto_increment not null,
    desc_ator varchar(35) not null
);
create table abertura (
	id_aber int primary key auto_increment not null,
    titulo varchar(250) not null,
    texto text not null
);
create table casodeuso (
	id_caso int primary key auto_increment not null,
    nome_casodeuso varchar(150) not null,
    des_casodeuso text,
    id_dia int not null,
    resumo text not null,
    precondicao varchar(255) not null,
    descalt_casodeuso text not null,
    execoes varchar(255) not null,
	poscondicao varchar(255) not null,
    regrasnegocio varchar(255) not null
);
alter table sertarefa
add constraint fk_tar_pro foreign key (id_projeto)
	references serprojeto (id_projeto);
alter table sertarefa
add constraint fk_tar_usu foreign key (id_usuario)
	references usuario (id_usuario);
alter table serprojeto
add constraint fk_pro_usu foreign key (id_usuario)
	references usuario (id_usuario);
alter table requisitos
add constraint fk_req_tipo foreign key (id_ti)
	references tiporeq (id_ti);
alter table requisitos
add constraint fk_req_pro foreign key (id_projeto)
	references serprojeto (id_projeto);
alter table requisitos
add constraint fk_req_ta foreign key (id_tar)
	references sertarefa (id_tar);
alter table diagrama
add constraint fk_dia_ator foreign key (id_ator)
	references ator (id_ator);
alter table diagrama
add constraint fk_dia_pro foreign key (id_projeto)
	references serprojeto (id_projeto);
alter table casodeuso
add constraint fk_caso_dia foreign key(id_dia)
	references diagrama (id_dia);
insert into tiporeq
(nome, obs)
values
('requisito funcional','define funções do sistema'),
('requisito não funcional','estabelece o desempenho do sistema'),
('requisito técnoco','regras de infraestrutura');
insert into usuario
(nome_usuario,tipo_usuario,login_usuario,senha_usuario,ditinclusao_usuario)
values
('maria santos','admin','maria.s','1234','2024-05-12'),
('joão lima','user','joão.l','abcd',2024-06-02),
('carla nunes','analista','carla.n','9988','2024-07-20');
insert into serprojeto
(nome,dt_inicio,id_usuario,dt_termino,obs)
values
('sistema web','2024-02-01','1','2024-12-01','projeto principal'),
('app mobile','2024-03-10','2','2024-11-30','bersão android'),
('api interna','2024-01-15','3','2024-08-15','integração');
insert into sertarefa
(id_projeto,id_usuario,idtarefadep,nome,inicio,fim,obs)
values
('1','1','1',' criar tela de login','2024-05-01','2024-05-05','tela inicial'),
('2','2','2','implementar api','2024-06-02','2024-06-10','endpoint'),
('3','3','3','testes internos','2024-07-15','2024-07-20','ajustes gerais');
insert into requisitos
(id_ti,id_projeto,id_tar,descricao,dataa,tempo)
values
('1','1','1','cadastro de usuarios','2024-05-03','02:00'),
('2','2','2','tempo de resposta rápido','2024-06-10','01:00'),
('3','3','3','servidor dedicado','2024-07-01','03:00');
insert into ator
(desc_ator)
values
('usuário final'),
('adiministrador'),
('sistema externo');
insert into diagrama
(nome_diagrama,id_ator,id_projeto,imgdiagrama)
values
('loginflow','1','1','login.png'),
('APIMap','2','2','api.png'),
('userCaseMain','3','3','usecase.png');
insert into casodeuso
(nome_casodeuso,des_casodeuso,id_dia,resumo,precondicao,descalt_casodeuso,execoes,poscondicao,regrasnegocio)
values
('Criar Conta','Cadastrar novo usuário','1','Fluxo simples','Usuário não cadastrado','NULL','NULL','Conta criada','NULL'),
('Fazer Login','Acessar sistema','2','Fluxo principal','Conta ativa','NULL','NULL','Sessão ativa','NULL'),
('Consultar Dados','Visualizar dados','3','Fluxo direto','Estar logado','NULL','NULL','Dados exibidos','NULL');
