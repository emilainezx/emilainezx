-- =====================================================
-- consultas sql - sistema de cantina
-- arquivo com consultas para relatorios e analises
-- =====================================================

-- 1. listar todos os clientes com patente e lotacao
select 
    c.cod_cli,
    c.nom_cli as cliente,
    p.nom_pat as patente,
    l.nom_lot as lotacao
from cliente c
join patente p on c.cod_pat = p.cod_pat
left join lotacao l on c.cod_lot = l.cod_lot;

-- -----------------------------------------------------
-- 2. total gasto por cada cliente
select 
    c.nom_cli as cliente,
    sum(v.val_tot) as total_gasto
from vendas v
join cliente c on v.cod_cli = c.cod_cli
group by c.nom_cli;

-- -----------------------------------------------------
-- 3. total pago por cada cliente
select 
    c.nom_cli as cliente,
    sum(p.val_pgm) as total_pago
from pagamentos p
join cliente c on p.cod_cli = c.cod_cli
group by c.nom_cli;

-- -----------------------------------------------------
-- 4. saldo disponivel do cliente (saldo + limite)
select 
    nom_cli as cliente,
    saldo_cli,
    lim_cli,
    (saldo_cli + lim_cli) as saldo_disponivel
from cliente;

-- -----------------------------------------------------
-- 5. produtos cadastrados com tipo e fornecedor
select 
    pr.des_pro as produto,
    tp.desc_tipo as tipo,
    f.nome_for as fornecedor,
    pr.qnd_prod as quantidade,
    pr.uni_prod as unidade
from produtos pr
join tipo_prod tp on pr.cod_tipo = tp.cod_tipo
join fornecedor f on pr.cod_for = f.cod_for;

-- -----------------------------------------------------
-- 6. produtos abaixo do nivel de reposicao
select 
    des_pro as produto,
    qnd_prod as quantidade_atual,
    niv_rep as nivel_reposicao
from produtos
where qnd_prod < niv_rep;

-- -----------------------------------------------------
-- 7. quantidade total vendida por produto
select 
    pr.des_pro as produto,
    sum(i.qnd_item) as total_vendido
from itens i
join produtos pr on i.cod_pro = pr.cod_pro
group by pr.des_pro;

-- -----------------------------------------------------
-- 8. valor total vendido por dia
select 
    data_vend as data_venda,
    sum(val_tot) as total_do_dia
from vendas
group by data_vend
order by data_vend;

-- -----------------------------------------------------
-- 9. clientes com maior volume de compras
select 
    c.nom_cli as cliente,
    count(v.seq_ven) as quantidade_compras,
    sum(v.val_tot) as total_gasto
from vendas v
join cliente c on v.cod_cli = c.cod_cli
group by c.nom_cli
order by total_gasto desc;

-- -----------------------------------------------------
-- 10. resumo diario do caixa
select 
    data_caixa,
    val_ini_din as valor_inicial,
    val_tot_ven as total_vendas,
    val_fin_din as valor_final
from caixa
order by data_caixa;