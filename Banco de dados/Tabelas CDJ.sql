create table CDJ.jogos(	
	id_jogo int primary key identity(100,1),
	nome_jogo varchar(50),
	tipo_jogo varchar(30),
)

create table CDJ.clientes(
	id_cliente      int identity(1,1) primary key,
	nome_cliente    varchar(60),
	email           varchar(100),
    tipo_favorito   varchar(30) 
)

create table CDJ.reservas(
	id_cliente int foreign key references CDJ.clientes(id_cliente),
	id_reserva int identity(1,1) primary key,
	data_reserva date,
	horario  time (0) NOT NULL,
	qte_pessoas int
)