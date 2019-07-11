create database teste;
use teste;

select * from nutricionista;

drop table nutricionista;
INSERT INTO nutricionista(nut_nome, nut_usuario,nut_cpf) VALUES ("Elisin", "cadastro","4990");
insert into nutricionista(nut_nome, nut_usuario, nut_senha, nut_cpf, nut_sexo, nut_email, nut_telefone, 
nut_cel1, nut_latitude, nut_longitude, nut_cidade)
values("Joana ilva", "Joana", "1234", "406.238.798-11", "F", "@gmail.com", "(11)5655-8976",
"(11)95544-0223", -7.094825, -34.863985, "joão Pessoa");
use teste;
select * from nutricionista;

delete from nutricionista where nut_cpf = '40667879838';
SELECT nut_latitude, nut_longitude FROM nutricionista WHERE nut_cidade = "santo andré";

CREATE TABLE nutricionista(
	nut_crn varchar (9) ,
	nut_cpf varchar (14) ,
    nut_nome varchar (60) ,
    nut_sexo enum ('M','F'),
    nut_email varchar (100),
    nut_telefone varchar (14),
    nut_cel1 varchar (15),
    nut_dataNasc date,
    nut_latitude double,
    nut_longitude double,
    nut_rua varchar (50),
    nut_cidade varchar (50),
    nut_bairro varchar (20),
    nut_numero varchar (5),
    nut_comple varchar (30),
    nut_usuario varchar(40),
    nut_senha varchar(16),
    primary key (nut_cpf)
)DEFAULT CHARSET = utf8;

use teste;
select * from nutricionista;


CREATE TABLE paciente(
	pac_cpf varchar (14) not null ,
    pac_nome varchar (60) not null,
    pac_rg varchar (13),
    pac_sexo enum ('M','F'),
    pac_estadoCivil varchar (15), /*Solteiro(a),Casado(a),Divorciado(a),Viúvo(a), Separado(a)*/
    pac_profissao varchar (60),
    pac_email varchar (100),
    pac_telefone varchar (14),
    pac_cel1 varchar (15),
    pac_cel2 varchar (15),
    pac_dataNasc date,
	nut_latidude numeric(15,10),
    nut_longitude numeric(15,10),
    nut_cpf varchar (14),
    pac_rua varchar (50),
    pac_cidade varchar (50),
    pac_bairro varchar (20),
    pac_numero varchar (5),	
    pac_comple varchar (30),
    pac_objetivos varchar(50),
	pac_usuario varchar(40),
    pac_senha varchar(16),
    primary key (pac_cpf),
    FOREIGN KEY (nut_cpf) REFERENCES nutricionista(nut_cpf)
)DEFAULT CHARSET = utf8;

CREATE TABLE consulta(
	con_id int  auto_increment,
    con_tipo varchar(10),
    con_horaInicio time,
    con_horaFim time,
    con_motivoConsulta varchar (30),
    con_dataRet date,
    con_dataConsu date,
    pac_cpf varchar(11),
    pro_id int,
    primary key (con_id),
    FOREIGN KEY (pac_cpf) REFERENCES paciente(pac_cpf)
    /*FOREIGN KEY (pro_id) REFERENCES prontuário(pro_id)*/
)DEFAULT CHARSET = utf8;

CREATE TABLE lista_equivalente(
	lis_id int  auto_increment,
    lis_nome varchar (50),
    lis_tipo varchar (50),
    lis_qtde varchar (4),
    lis_descricao varchar (50),
    lis_restricao varchar(1),/*s ou n */
    primary key (lis_id)
)DEFAULT CHARSET = utf8;

CREATE TABLE cardapio(
	car_id int  auto_increment,
    car_lanche1 varchar(100),
    car_lanche2 varchar(100),
    car_colacao varchar(100),
    car_jantar varchar(100),
    car_almoco varchar(100),
    car_desjejum varchar(100),
    lis_id int,
    primary key (car_id),
    foreign key (lis_id) REFERENCES lista_equivalente (lis_id)
    );

CREATE TABLE plano_alimentar(
	pla_id int auto_increment,
    pla_plano TinyInt, /*Contagem */
    pla_dataTerm date,
    pla_situacao varchar (2),
	pla_dataInicio date,
    pla_anotacoes varchar(200),
    pac_cpf varchar(11),
    car_id int,
    con_id int,
    primary key (pla_id),
	FOREIGN KEY (pac_cpf) REFERENCES paciente(pac_cpf),
    FOREIGN KEY (car_id) REFERENCES cardapio(car_id),
    FOREIGN KEY (con_id) REFERENCES consulta(con_id)
)DEFAULT CHARSET = utf8;


CREATE TABLE prontuario(
	pro_id int auto_increment,
    pro_gestante varchar(1),/*s ou n*/
    pro_ig varchar(6),
    pro_dum varchar(6),
    pro_dpp varchar (6),
    pro_pesoPreGes decimal (5,2),
    pro_ganhoPesoReco decimal(3,2),
	/*Dados Bioquímicos*/
    pro_hemoglobina varchar(7),
    pro_triglicerideos varchar(7),
	pro_colesterolTotal varchar(7),
	pro_ldl varchar(7),
	pro_hdl varchar(7),
	pro_vldl varchar(7),
	pro_glicemiaJejum varchar(7),
	pro_glicemiaPandrial varchar(7),
	pro_pressaoArterial varchar(7),
	pro_leucocitos varchar(7),
	pro_ureia varchar(7),
	pro_creatina varchar(7),
    pro_albumina varchar(7),
	pro_dm varchar(1),
	pro_has varchar(1),
	pro_gastrite varchar(1),
	pro_anemia  varchar(1),
	pro_avc varchar(1),
	pro_iam varchar(1),
	pro_obesidade varchar(1),
	pro_cancer varchar(1),
	pro_outras varchar(30),
	pro_medicamentos varchar(1), /*(sim ou não)*/
	pro_qualMed varchar(20),
	pro_suplementos varchar(1), /*(sim ou não)*/
	pro_qualSuple varchar(20),
	pro_disfagia varchar(1),
	pro_odinofagia varchar(1),
	pro_dispepsia varchar(1),
	pro_pirose varchar(1),
	pro_refluxo varchar(1),
	pro_nausea varchar(1),
    pro_vomito varchar(1),
	pro_flatulencias varchar(1),
	pro_habitoIntestinal  varchar(1),  /*Normal constipação diarreia*/
	pro_ritimo varchar(1),/*diário ,dia sim dia não 2x semana 1x semana*/
    
    pro_tabagismo varchar(1),
	pro_frequenciaTabagismo varchar(15),
	pro_etilismo varchar(1),
	pro_frequenciaEtilismo varchar(15),
	pro_horasSono TinyInt, /*5/6/7/8/>8*/
	pro_atividadeFisica varchar(1),
	pro_modalidade varchar(15),
	pro_frequenciaAtivFisi varchar(15),

	pro_apetiteAtual varchar(10),
	pro_motivoApetiAtual varchar(30),
	pro_numRefeicoes TinyInt,
	pro_liquidosRefeicoes varchar(1),
	pro_aversao varchar(1),
	pro_especificarAversao varchar(25),
	pro_alergia varchar(1),
	pro_especificarAlergia varchar(25),
	pro_intolerancia varchar(1),
	pro_especificarIntolerancia varchar(25),
	pro_ingestaoAgua decimal(3,1),/*qtde litros*/
	pro_Preferencia varchar(20),/*não sei o que é */
	pro_ingestaoNaCi varchar(8),/*leve/moderada/severa*/
	pro_ingestaoAcucar varchar(8), /*leve/moderada/severa*/
    
	pro_peso  decimal(5,2),/*kg*/
	pro_altura decimal (3,2), /*metros*/
	pro_imc decimal (4,2), /*Kg/m²*/
	pro_classificacao varchar (15),
	/*PTpeso teórico*/
	pro_ptMinimo  decimal(5,2), /*Kg*/
	pro_ptMedio  decimal(5,2),/*Kg   ideal*/
	pro_ptMaximo  decimal(5,2),/*Kg*/
	pro_pesoDesejavel decimal(5,2), /*kg*/

	pro_anotacao text,

	pro_lado varchar(7),
	pro_pct TinyInt ,/*mm triciptal*/
	pro_pcs TinyInt,/*mm subescapular*/
	pro_pcb TinyInt, /*mm bicipal*/
	pro_pcam TinyInt, /*mm auxiliar média*/
	pro_pcsi TinyInt ,/*mm supra ilíaca*/
	pro_pca TinyInt, /*mm abdominal*/
	pro_pcp decimal(3,1), /*mm panturrilia */
	pro_pccD decimal(3,1), /*mm ou cm coxa*/
	pro_pccE decimal(3,1), /*mm ou cm coxa*/
	pro_cQuadril decimal(3,1), /*cm */
	pro_punho decimal(3,1),/*cm */
	pro_bracoD decimal(3,1), /*cm */
	pro_bracoE decimal(3,1) ,/*cm */
	pro_cCintura decimal(3,1),/*cm */
	pro_cAbdominal decimal(3,1), /*cm */
	pro_cPanturrilhaD decimal(3,1),/*cm */
	pro_cPanturrilhaE decimal(3,1),/*cm */
	pro_ganhoPeso varchar(1),
	pro_qtdeGanhoPeso decimal(4,2),/*kg*/
	pro_perdaPeso varchar(1),
	pro_qtdePerdaPeso decimal(4,2), /*Kg*/
	pro_gorduraCorporal float, /*%*/
	pro_classifGordura varchar (25),
	pro_massaMagra decimal(4,2),
	pro_massaGorda float (4,2),/* (1,20*IMC)+(0,23*idade)-(10,8*sexo)-5,4=*/ 
	pro_vet decimal (7,2), /*calorias */
    con_id int,
    primary key (pro_id),
    foreign key (con_id) REFERENCES consulta (con_id)
)DEFAULT CHARSET = utf8;

ALTER TABLE consulta 
ADD FOREIGN KEY (pro_id)
REFERENCES prontuario(pro_id);
