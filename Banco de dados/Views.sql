CREATE VIEW mostraClientes AS 
SELECT nome_cliente, email, tipo_favorito 
FROM cdjclientes;


CREATE VIEW ReservasFeitas AS 
SELECT nome_cliente, cdjclientes.id_cliente AS cliente_id, id_reserva, data_reserva, horario, qte_pessoas
FROM cdjreservas
INNER JOIN cdjclientes ON cdjreservas.id_cliente = cdjclientes.id_cliente;

