-- uso: call AddCliente ('John Doe', 'johndoe@example.com', 'Sports');
CREATE PROCEDURE AddCliente(
    IN NomeCliente VARCHAR(60),
    IN Email VARCHAR(100),
    IN TipoFavorito VARCHAR(30)
)
BEGIN
    INSERT INTO cdjclientes (nome_cliente, email, tipo_favorito)
    VALUES (NomeCliente, Email, TipoFavorito);
END;


-- uso: call AddReserva (1,'2023-10-10','14:00:00',4);
CREATE PROCEDURE AddReserva(
    IN ClienteID INT,
    IN DataReserva DATE,
    IN Horario TIME,
    IN QtePessoas INT
)
BEGIN
    INSERT INTO cdjreservas (id_cliente, data_reserva, horario, qte_pessoas)
    VALUES (ClienteID, DataReserva, Horario, QtePessoas);
END;

-- uso: call  AtualizarEmailCliente (9, 'IloveMoney@attmail.com');
CREATE PROCEDURE AtualizarEmailCliente(
    in clienteID INT,
    in novoEmail VARCHAR(100))
BEGIN
    UPDATE cdjclientes
    SET email = @novoEmail
    WHERE id_cliente = @clienteID;
END;


