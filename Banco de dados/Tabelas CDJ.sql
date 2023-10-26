create table cdjjogos(	
	id_jogo int primary key auto_increment,
	nome_jogo varchar(50),
	tipo_jogo varchar(30)
);

create table cdjclientes(
	id_cliente      int primary key auto_increment,
	nome_cliente    varchar(60),
	email           varchar(100),
    	tipo_favorito   varchar(30) 
);

create table cdjreservas(
	id_cliente int foreign key references cdjclientes(id_cliente),
	id_reserva int primary key auto_increment,
	data_reserva date,
	horario  time (0) NOT NULL,
	qte_pessoas int
);
