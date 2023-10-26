CREATE VIEW vw_JogosDisponiveis AS 
SELECT nome_jogo, tipo_jogo 
FROM CDJ.jogos;

CREATE VIEW vw_ReservasFeitas AS 
SELECT CDJ.clientes.nome_cliente, CDJ.clientes.id_cliente, id_reserva, data_reserva,horario,qte_pessoas
FROM CDJ.reservas
INNER JOIN CDJ.clientes ON CDJ.reservas.id_cliente = CDJ.clientes.id_cliente;

select * from CDJ.jogos;
select * from CDJ.reservas;
