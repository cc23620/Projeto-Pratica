CREATE VIEW JogosDisponiveis AS 
SELECT nome_jogo, tipo_jogo 
FROM cdjjogos;


CREATE VIEW ReservasFeitas AS 
SELECT nome_cliente, cdjclientes.id_cliente AS cliente_id, id_reserva, data_reserva, horario, qte_pessoas
FROM cdjreservas
INNER JOIN cdjclientes ON cdjreservas.id_cliente = cdjclientes.id_cliente;

