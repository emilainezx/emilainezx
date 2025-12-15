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
