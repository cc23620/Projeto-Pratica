create schema CDJ

create table CDJ.jogos(	
	id_jogo int primary key identity(100,1),
	nome_jogo varchar(50),
	tipo_jogo varchar(30),
)

Insert into CDJ.jogos
(nome_jogo, tipo_jogo)
VALUES
('Banco Imobiliário','Tabuleiro'),
('Baralho Comum','Cartas'),
('Cara a Cara','Tabuleiro'),
('Dama','Tabuleiro'),
('Detetive','Tabuleiro'),
('Dominó','Tabuleiro'),
('Ludo','Tabuleiro'),
('Monópoli','Tabuleiro'),
('Uno','Cartas'),
('Xadrez','Tabuleiro');



create table CDJ.clientes(
	id_cliente      int identity(1,1) primary key,
	nome_cliente    varchar(60),
	email           varchar(100),
    tipo_favorito   varchar(30) 
)

Insert into CDJ.clientes
(nome_cliente, email, tipo_favorito)
VALUES
('Livia Oliveira','LiviaOliveira@gmail.com','Cartas'),
('Joao Machado Rocha','JoãoRocha@gmail.com','Tabuleiro'),
('Maria Gabriella Araujo','MariaGaab@gmail.com','Cartas'),
('Gustavo Henrique Santos','GuSantos@gmail.com','Tabuleiro'),
('Julia Heloisa Guimaraes','JuGuimaraes@gmail.com','Tabuleiro'),
('Bianca Andrade Neves','BiancaNeves@gmail.com','Cartas'),
('Melissa Vitória Lima','MelissaLima@gmail.com','Cartas'),
('Benjamin Otavio Silva','BenSilva@gmail.com','Tabuleiro'),
('George Campos Sales','GeorgeSales@gmail.com','Cartas'),
('Izack Miguel Dantas','IzackDantas@gmail.com','Tabuleiro');



create table CDJ.reservas(
	id_cliente int foreign key references CDJ.clientes(id_cliente),
	id_reserva int identity(1,1) primary key,
	data_reserva date,
	horario  time (0) NOT NULL,
	qte_pessoas int
)

Insert into CDJ.reservas
(id_cliente,data_reserva, horario, qte_pessoas)
VALUES
(1,'2023-11-10','19:00:00',3),
(2,'2023-11-08','15:30:00',2),
(3,'2023-11-07','16:00:00',5),
(4,'2023-11-09','18:30:00',4),
(5,'2023-11-11','17:00:00',3),
(6,'2023-11-13','20:30:00',2),
(7,'2023-11-12','21:30:00',5),
(8,'2023-11-14','22:00:00',4),
(9,'2023-11-06','23:00:00',3),
(10,'2023-11-15','16:30:00',5);


Insert into CDJ.reservas
(id_cliente,data_reserva, horario, qte_pessoas)
VALUES
(1,'2023-11-10','9:00:00',3);

select * from CDJ.jogos
select * from CDJ.clientes
select * from CDJ.reservas