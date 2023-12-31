--trigger para não permitir a realização de reservas em dias passados

CREATE TRIGGER [jogos].[VERIFICADATA]
ON [RESERVAS]
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @dataAtual DATETIME = GETDATE();
    
    IF EXISTS (SELECT 1 FROM inserted WHERE data_reserva < @dataAtual)
    BEGIN
        PRINT 'Impossível incluir/atualizar: Data da reserva menor que a data atual'
        ROLLBACK;
    END
END


--trigger que não permite reservas antes ou depois do horário  de funcionamento das 15h00 ás 00h00

CREATE OR ALTER TRIGGER [reservas].[VerificarHorarioReserva]
ON [RESERVAS]
FOR INSERT
AS
BEGIN
    DECLARE @horaReserva TIME;

    SELECT @horaReserva = horario
    FROM inserted;

    IF @horaReserva <= '23:59:00' OR @horaReserva >= '15:00:00'
    BEGIN
        RAISERROR('A reserva não pode ser feita após 00h ou antes de 15h.');
        ROLLBACK;
    END
END

