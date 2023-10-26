--trigger para n�o permitir a realiza��o de reservas em dias passados

CREATE TRIGGER [CDJ].[VERIFICADATA]
ON [CDJ].[RESERVAS]
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @dataAtual DATETIME = GETDATE();
    
    IF EXISTS (SELECT 1 FROM inserted WHERE data_reserva < @dataAtual)
    BEGIN
        PRINT 'Imposs�vel incluir/atualizar: Data da reserva menor que a data atual'
        ROLLBACK;
    END
END

--trigger que n�o permite a inser��o de jogos que j� existem no banco de dados CDJ

CREATE TRIGGER [CDJ].[VERIFICAJOGO]
ON [CDJ].[JOGOS]
AFTER INSERT
AS
BEGIN
    DECLARE @nomeJogo VARCHAR(50);

    SELECT @nomeJogo = i.nome_jogo
    FROM inserted i;

    IF EXISTS (SELECT 1 FROM [CDJ].[JOGOS] WHERE nome_jogo = @nomeJogo)
    BEGIN
        PRINT 'Imposs�vel incluir: Jogo j� existe no banco de dados';
        ROLLBACK;
    END
END


--trigger que n�o permite reservas antes ou depois do hor�rio  de funcionamento das 15h00 �s 00h00

CREATE OR ALTER TRIGGER [CDJ].[VerificarHorarioReserva]
ON [CDJ].[RESERVAS]
FOR INSERT
AS
BEGIN
    DECLARE @horaReserva TIME;

    SELECT @horaReserva = horario
    FROM inserted;

    IF @horaReserva <= '00:00:00' OR @horaReserva >= '15:00:00'
    BEGIN
        RAISERROR('A reserva n�o pode ser feita ap�s 00h ou antes de 15h.');
        ROLLBACK;
    END
END

