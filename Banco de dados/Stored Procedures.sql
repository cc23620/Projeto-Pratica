
-- uso: EXEC AddCliente 'John Doe', 'johndoe@example.com', 'Sports';

CREATE PROCEDURE AddCliente
    @NomeCliente VARCHAR(60),
    @Email VARCHAR(100),
    @TipoFavorito VARCHAR(30)
AS
BEGIN
    INSERT INTO cdj.clientes (nome_cliente, email, tipo_favorito)
    VALUES (@NomeCliente, @Email, @TipoFavorito);
END;


--uso: EXEC AddReserva @ClienteID = 1, @DataReserva = '2023-10-10', @Horario = '14:00:00', @QtePessoas = 4;
CREATE PROCEDURE AddReserva
    @ClienteID INT,
    @DataReserva DATE,
    @Horario TIME,
    @QtePessoas INT
AS
BEGIN
    INSERT INTO cdj.reservas (id_cliente, data_reserva, horario, qte_pessoas)
    VALUES (@ClienteID, @DataReserva, @Horario, @QtePessoas);
END;


-- stored procedure para atualizar o email dos clientes
CREATE PROCEDURE [CDJ].[AtualizarEmailCliente]
    @clienteID INT,
    @novoEmail VARCHAR(100)
AS
BEGIN
    UPDATE [CDJ].[clientes]
    SET email = @novoEmail
    WHERE id_cliente = @clienteID;
END;



-- stored procedure para REMOVER CLIENTES
-- exec removeCliente 1(1 sendo um exemplo para o id do cliente)
CREATE PROCEDURE removeCliente
    @ClienteID INT
AS
BEGIN
    DELETE FROM CDJ.clientes
    WHERE id_cliente = @ClienteID;
END;



-- stored procedure para REMOVER RESERVAS
--uso: EXEC RemoveReservation @ReservaID = 1; 
CREATE PROCEDURE RemoveReservation
    @ReservaID INT
AS
BEGIN
    DELETE FROM CDJ.reservas
    WHERE id_reserva = @ReservaID;
END;

