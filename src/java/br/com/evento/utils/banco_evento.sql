create table estado(
	idEstado serial primary key,
	nomeEstado varchar(50) not null,
	siglaEstado varchar(02) not null,
	situacao varchar(1) not null
);

insert into estado(nomeestado,siglaestado,situacao) values('São Paulo','SP','A');

create table cidade(
	idcidade serial primary key,
	nomecidade varchar(100) not null,
	situacao varchar(1) not null,
	idestado int not null,
	constraint fk_estado foreign key (idestado) references estado(idestado)
);

insert into cidade(nomecidade,situacao,idestado) values('Fernandópolis','A',1);
insert into cidade(nomecidade,situacao,idestado) values('Meridiano','A',1);

create table tipotrabalho(
	idtipotrabalho serial primary key,
	descricao varchar(100) not null,
	situacao varchar(1) not null
);

create table instituicao(
	idInstituicao serial primary key, 
	nomeInstituicao varchar(100),
	cnpj varchar(25),
	situacao varchar(10),
        imagem text
);

create table curso(
	idCurso serial primary key, 
	nomeCurso varchar(100),
	situacao varchar(10),
	idInstituicao int, 
	constraint fk_curso foreign key(idInstituicao) references instituicao(idInstituicao)
);

create table funcao(
	idfuncao serial primary key,
	descricao varchar (100) not null,
	situacao varchar (1) not null
);

create table tipoatividade(
	idTipoAtividade serial primary key,
	descricao varchar(50),
	situacao varchar(1)
);

/*
permiteLogin = S
adm
organizador
participante

permiteLogin = N
fornecedor
patrocinador
*/

create table pessoa(
	idPessoa serial primary key,
	nomeRazaoPessoa varchar(100) not null,
	rgIePessoa varchar(12),
	cpfCnpjPessoa varchar(14) unique,
	dataNascFundPessoa date,
	telefonePessoa varchar(11),
	logradouroPessoa varchar(100),
	numLogradouroPessoa varchar(10),
	bairroPessoa varchar(60),
	cepPessoa varchar(8),
	emailPessoa varchar(100),
	login varchar(30),
	senha varchar(20),
	idCidade int,
	constraint fk_pessoa_cidade foreign key (idcidade) references cidade
);

INSERT INTO pessoa(nomerazaopessoa, rgiepessoa, cpfcnpjpessoa, datanascfundpessoa, telefonepessoa, logradouropessoa, numlogradouropessoa, bairropessoa, ceppessoa, emailpessoa, login, senha, idcidade)
VALUES ('Administrador', '','11111111111', '01-01-1990', '17997000000', 'Rua Brasil', '10', 'Centro', '15600000', 'adm@adm.com', 'adm', 'adm', 1);

create table administrador(
	idAdministrador serial primary key,
	idPessoa int unique,
	situacao varchar(1),
	permitelogin varchar(1),
	constraint fk_administrador_pessoa foreign key (idpessoa) references pessoa
);

insert into administrador(idpessoa, situacao, permitelogin) values(1,'A','S');

create table organizador(
	idOrganizador serial primary key,
	idPessoa int unique,
	situacao varchar(1),
	permitelogin varchar(1),
	constraint fk_organizador_pessoa foreign key (idpessoa) references pessoa
);

create table patrocinador(
	idPatrocinador serial primary key,
	idPessoa int unique,
	situacao varchar(1),
	permitelogin varchar(1),
	constraint fk_patrocinador_pessoa foreign key (idpessoa) references pessoa
);

create table fornecedor(
	idfornecedor serial primary key,
	idPessoa int unique,
	situacao varchar(1),
	permitelogin varchar(1),
        idTipoTrabalho int,
        constraint fk_fornecedor_tipotrabalho foreign key (idTipoTrabalho) references tipotrabalho, 
	constraint fk_fornecedor_pessoa foreign key (idpessoa) references pessoa
);

create table participante(
	idparticipante serial primary key,
	idPessoa int unique,
	sexoParticipante varchar(1),
	situacao varchar(1),
	permitelogin varchar(1),
	constraint fk_participante_pessoa foreign key (idpessoa) references pessoa
);

create or replace view usuario as
select
	p.idpessoa,	a.idadministrador as id, p.nomerazaopessoa,
	p.cpfcnpjpessoa, p.login,p.senha,'Administrador' as tipo
from pessoa p, administrador a
where p.idpessoa = a.idpessoa
and a.permitelogin = 'S'
and a.situacao = 'A'
union all
select
	p.idpessoa,	o.idorganizador as id, p.nomerazaopessoa,
	p.cpfcnpjpessoa, p.login,p.senha,'Organizador' as tipo
from pessoa p, organizador o
where p.idpessoa = o.idpessoa
and o.permitelogin = 'S'
and o.situacao = 'A'
union all
select
	p.idpessoa,	pr.idparticipante as id, p.nomerazaopessoa,
	p.cpfcnpjpessoa, p.login,p.senha,'Participante' as tipo
from pessoa p, participante pr
where p.idpessoa = pr.idpessoa
and pr.permitelogin = 'S'
and pr.situacao = 'A';

create table evento (
	idevento serial primary key, 
	nomeevento varchar(100),
	valorevento numeric(15,2),
	valoreventoprazo numeric(15,2),
	datainicioevento date, 
	dataterminoevento date,
	informacaoevento varchar(1000),
	situacaoevento char(1),
	saldocaixa numeric(15,2),
	situacaocaixa char(1),
	imagem text,
	idcidade integer, 
	idcurso integer,
	idcategoriaevento integer,
	constraint fk_cidade_evento foreign key (idcidade) references cidade(idcidade),
	constraint fk_curso_evento foreign key (idcurso) references curso(idcurso),
	constraint fk_categoria_evento foreign key (idcategoriaevento) references categoriaevento(idcategoriaevento)	
);

create table categoriaevento(
	idcategoriaevento serial primary key,
	nome varchar(100),
        situacao char(1)
);

create table evento (
	idevento serial primary key, 
	nomeevento varchar(100),
	valorevento numeric(15,2),
	valoreventoprazo numeric(15,2),
	datainicioevento date, 
	dataterminoevento date,
	informacaoevento varchar(1000),
	situacaoevento char(1),
	saldocaixa numeric(15,2),
	situacaocaixa char(1),
	imagem text,
	idcidade integer, 
	idcurso integer,
	idcategoriaevento integer,
	constraint fk_cidade_evento foreign key (idcidade) references cidade(idcidade),
	constraint fk_curso_evento foreign key (idcurso) references curso(idcurso),
	constraint fk_categoria_evento foreign key (idcategoriaevento) references categoriaevento(idcategoriaevento)	
);

create table organizadorevento(
	idorganizadorevento serial primary key, 
	idevento integer, 
	idorganizador integer, 
	idfuncao integer,
	constraint fk_evento_organizadorevento foreign key (idevento) references evento(idevento),
	constraint fk_organizador_organizadorevento foreign key (idorganizador) references organizador(idorganizador),
	constraint fk_funcao_organizadorevento foreign key (idfuncao) references funcao(idfuncao)
);