-- Group [Group]
create table `group` (
   `oid`  integer  not null,
   `groupname`  varchar(255),
  primary key (`oid`)
);


-- Module [Module]
create table `module` (
   `oid`  integer  not null,
   `moduleid`  varchar(255),
   `modulename`  varchar(255),
  primary key (`oid`)
);


-- Utente [User]
create table `utente` (
   `oid`  integer  not null,
   `username`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
   `cognome`  varchar(255),
   `nome`  varchar(255),
   `data_di_nascita`  date,
  primary key (`oid`)
);


-- Transazione [ent1]
create table `transazione` (
   `oid`  integer  not null,
   `data`  date,
   `costo`  double precision,
   `motivotransazione`  varchar(255),
  primary key (`oid`)
);


-- Catalogo_personale [ent12]
create table `catalogo_personale` (
   `oid`  integer  not null,
   `ampiezza_film`  integer,
   `ampiezza_serie`  integer,
  primary key (`oid`)
);


-- Utente_esterno_registrato [ent15]
create table `utente_esterno_registrato` (
   `utente_oid`  integer  not null,
  primary key (`utente_oid`)
);


-- DatiPagamento [ent16]
create table `datipagamento` (
   `oid`  integer  not null,
   `numerocarta`  integer,
   `ccv`  integer,
   `scadenza`  date,
  primary key (`oid`)
);


-- Genere [ent17]
create table `genere` (
   `oid`  integer  not null,
   `categoria`  varchar(255),
  primary key (`oid`)
);


-- Lingua [ent18]
create table `lingua` (
   `oid`  integer  not null,
   `lingua`  varchar(255),
  primary key (`oid`)
);


-- DataDiUscita [ent19]
create table `datadiuscita` (
   `oid`  integer  not null,
   `giorno`  integer,
   `mese`  integer,
   `anno`  integer,
  primary key (`oid`)
);


-- Film [ent2]
create table `film` (
   `oid`  integer  not null,
   `titolo`  varchar(255),
   `trama`  longtext,
   `sottotitoli`  varchar(255),
   `cast`  varchar(255),
   `eta_minima`  integer,
   `durata`  integer,
   `locandina`  varchar(255),
   `sfondo`  varchar(255),
   `trailer`  varchar(255),
   `valutazione_della_critica`  double precision,
   `valutazione_media`  double precision,
  primary key (`oid`)
);


-- Abbonamento [ent20]
create table `abbonamento` (
   `oid`  integer  not null,
   `data_fine`  date,
   `noleggi`  integer,
   `prezzo`  integer,
  primary key (`oid`)
);


-- Utente_esterno_registrato_abbonato [ent21]
create table `utente_esterno_registrato_abbo` (
   `utente_esterno_registrato_oid`  integer  not null,
  primary key (`utente_esterno_registrato_oid`)
);


-- FasciaDiPrezzo [ent22]
create table `fasciadiprezzo` (
   `oid`  integer  not null,
   `prezzo_acquisto`  double precision,
   `fascia_prezzo`  bit,
   `prezzo_noleggio`  double precision,
  primary key (`oid`)
);


-- Regista [ent23]
create table `regista` (
   `oid`  integer  not null,
   `nomecognome`  varchar(255),
  primary key (`oid`)
);


-- Serie [ent3]
create table `serie` (
   `oid`  integer  not null,
   `titolo`  varchar(255),
   `trama`  longtext,
   `sottotitoli`  varchar(255),
   `cast`  varchar(255),
   `eta_minima`  integer,
   `stagioni`  varchar(255),
   `locandina`  varchar(255),
   `sfondo`  varchar(255),
   `trailer`  varchar(255),
   `valutazione_della_critica`  double precision,
   `valutazione_media`  double precision,
  primary key (`oid`)
);


-- Episodio [ent4]
create table `episodio` (
   `oid`  integer  not null,
   `titolo`  varchar(255),
   `trama`  longtext,
   `cast`  varchar(255),
   `durata`  integer,
   `stagione`  integer,
  primary key (`oid`)
);


-- Catalogo_generale [ent5]
create table `catalogo_generale` (
   `oid`  integer  not null,
   `ampiezza_film`  integer,
   `ampiezza_serie`  integer,
  primary key (`oid`)
);


-- Recensione [ent6]
create table `recensione` (
   `oid`  integer  not null,
   `valutazione`  integer,
   `data`  date,
   `commento`  longtext,
  primary key (`oid`)
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group`  add column  `module_oid`  integer;
alter table `group`   add index fk_group_module (`module_oid`), add constraint fk_group_module foreign key (`module_oid`) references `module` (`oid`);


-- Group_Module [Group2Module_Module2Group]
create table `group_module` (
   `group_oid`  integer not null,
   `module_oid`  integer not null,
  primary key (`group_oid`, `module_oid`)
);
alter table `group_module`   add index fk_group_module_group (`group_oid`), add constraint fk_group_module_group foreign key (`group_oid`) references `group` (`oid`);
alter table `group_module`   add index fk_group_module_module (`module_oid`), add constraint fk_group_module_module foreign key (`module_oid`) references `module` (`oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `utente`  add column  `group_oid`  integer;
alter table `utente`   add index fk_utente_group (`group_oid`), add constraint fk_utente_group foreign key (`group_oid`) references `group` (`oid`);


-- User_Group [User2Group_Group2User]
create table `user_group` (
   `utente_oid`  integer not null,
   `group_oid`  integer not null,
  primary key (`utente_oid`, `group_oid`)
);
alter table `user_group`   add index fk_user_group_utente (`utente_oid`), add constraint fk_user_group_utente foreign key (`utente_oid`) references `utente` (`oid`);
alter table `user_group`   add index fk_user_group_group (`group_oid`), add constraint fk_user_group_group foreign key (`group_oid`) references `group` (`oid`);


-- Serie_Genere [rel1]
alter table `serie`  add column  `genere_oid`  integer;
alter table `serie`   add index fk_serie_genere (`genere_oid`), add constraint fk_serie_genere foreign key (`genere_oid`) references `genere` (`oid`);


-- Episodio_Serie [rel11]
alter table `episodio`  add column  `serie_oid`  integer;
alter table `episodio`   add index fk_episodio_serie (`serie_oid`), add constraint fk_episodio_serie foreign key (`serie_oid`) references `serie` (`oid`);


-- Utente_esterno_registrato_abbonato_Abbonamento [rel12]
alter table `abbonamento`  add column  `utente_esterno_registrato_abbo`  integer;
alter table `abbonamento`   add index fk_abbonamento_utente_esterno (`utente_esterno_registrato_abbo`), add constraint fk_abbonamento_utente_esterno foreign key (`utente_esterno_registrato_abbo`) references `utente_esterno_registrato_abbo` (`utente_esterno_registrato_oid`);


-- Serie_Recensione [rel13]
alter table `recensione`  add column  `serie_oid`  integer;
alter table `recensione`   add index fk_recensione_serie (`serie_oid`), add constraint fk_recensione_serie foreign key (`serie_oid`) references `serie` (`oid`);


-- Recensione_Film [rel14]
alter table `recensione`  add column  `film_oid`  integer;
alter table `recensione`   add index fk_recensione_film (`film_oid`), add constraint fk_recensione_film foreign key (`film_oid`) references `film` (`oid`);


-- Transazione_Film [rel15]
alter table `transazione`  add column  `film_oid`  integer;
alter table `transazione`   add index fk_transazione_film (`film_oid`), add constraint fk_transazione_film foreign key (`film_oid`) references `film` (`oid`);


-- Utente_esterno_registrato_Recensione [rel16]
alter table `recensione`  add column  `utente_esterno_registrato_oid`  integer;
alter table `recensione`   add index fk_recensione_utente_esterno_r (`utente_esterno_registrato_oid`), add constraint fk_recensione_utente_esterno_r foreign key (`utente_esterno_registrato_oid`) references `utente_esterno_registrato` (`utente_oid`);


-- Catalogo_personale_Utente_esterno_registrato [rel18]
alter table `utente_esterno_registrato`  add column  `catalogo_personale_oid`  integer;
alter table `utente_esterno_registrato`   add index fk_utente_esterno_registrato_c (`catalogo_personale_oid`), add constraint fk_utente_esterno_registrato_c foreign key (`catalogo_personale_oid`) references `catalogo_personale` (`oid`);


-- Serie_Lingua [rel2]
alter table `serie`  add column  `lingua_oid`  integer;
alter table `serie`   add index fk_serie_lingua (`lingua_oid`), add constraint fk_serie_lingua foreign key (`lingua_oid`) references `lingua` (`oid`);


-- Serie_DataDiUscita [rel20]
alter table `serie`  add column  `datadiuscita_oid`  integer;
alter table `serie`   add index fk_serie_datadiuscita (`datadiuscita_oid`), add constraint fk_serie_datadiuscita foreign key (`datadiuscita_oid`) references `datadiuscita` (`oid`);


-- Transazione_DatiPagamento [rel22]
alter table `transazione`  add column  `datipagamento_oid`  integer;
alter table `transazione`   add index fk_transazione_datipagamento (`datipagamento_oid`), add constraint fk_transazione_datipagamento foreign key (`datipagamento_oid`) references `datipagamento` (`oid`);


-- DatiPagamento_Utente_esterno_registrato [rel23]
alter table `utente_esterno_registrato`  add column  `datipagamento_oid`  integer;
alter table `utente_esterno_registrato`   add index fk_utente_esterno_registrato_d (`datipagamento_oid`), add constraint fk_utente_esterno_registrato_d foreign key (`datipagamento_oid`) references `datipagamento` (`oid`);


-- Transazione_Abbonamento [rel24]
alter table `transazione`  add column  `abbonamento_oid`  integer;
alter table `transazione`   add index fk_transazione_abbonamento (`abbonamento_oid`), add constraint fk_transazione_abbonamento foreign key (`abbonamento_oid`) references `abbonamento` (`oid`);


-- Serie_FasciaDiPrezzo [rel25]
alter table `serie`  add column  `fasciadiprezzo_oid`  integer;
alter table `serie`   add index fk_serie_fasciadiprezzo (`fasciadiprezzo_oid`), add constraint fk_serie_fasciadiprezzo foreign key (`fasciadiprezzo_oid`) references `fasciadiprezzo` (`oid`);


-- Film_Genere [rel26]
alter table `film`  add column  `genere_oid`  integer;
alter table `film`   add index fk_film_genere (`genere_oid`), add constraint fk_film_genere foreign key (`genere_oid`) references `genere` (`oid`);


-- Film_Lingua [rel27]
alter table `film`  add column  `lingua_oid`  integer;
alter table `film`   add index fk_film_lingua (`lingua_oid`), add constraint fk_film_lingua foreign key (`lingua_oid`) references `lingua` (`oid`);


-- Film_DataDiUscita [rel28]
alter table `film`  add column  `datadiuscita_oid`  integer;
alter table `film`   add index fk_film_datadiuscita (`datadiuscita_oid`), add constraint fk_film_datadiuscita foreign key (`datadiuscita_oid`) references `datadiuscita` (`oid`);


-- Film_FasciaDiPrezzo [rel29]
alter table `film`  add column  `fasciadiprezzo_oid`  integer;
alter table `film`   add index fk_film_fasciadiprezzo (`fasciadiprezzo_oid`), add constraint fk_film_fasciadiprezzo foreign key (`fasciadiprezzo_oid`) references `fasciadiprezzo` (`oid`);


-- Film_Regista [rel31]
alter table `film`  add column  `regista_oid`  integer;
alter table `film`   add index fk_film_regista (`regista_oid`), add constraint fk_film_regista foreign key (`regista_oid`) references `regista` (`oid`);


-- Catalogo_generale_Film [rel32]
alter table `film`  add column  `catalogo_generale_oid`  integer;
alter table `film`   add index fk_film_catalogo_generale (`catalogo_generale_oid`), add constraint fk_film_catalogo_generale foreign key (`catalogo_generale_oid`) references `catalogo_generale` (`oid`);


-- Catalogo_generale_Serie [rel33]
alter table `serie`  add column  `catalogo_generale_oid`  integer;
alter table `serie`   add index fk_serie_catalogo_generale (`catalogo_generale_oid`), add constraint fk_serie_catalogo_generale foreign key (`catalogo_generale_oid`) references `catalogo_generale` (`oid`);


-- Catalogo_personale_Film [rel34]
create table `catalogo_personale_film` (
   `catalogo_personale_oid`  integer not null,
   `film_oid`  integer not null,
  primary key (`catalogo_personale_oid`, `film_oid`)
);
alter table `catalogo_personale_film`   add index fk_catalogo_personale_film_cat (`catalogo_personale_oid`), add constraint fk_catalogo_personale_film_cat foreign key (`catalogo_personale_oid`) references `catalogo_personale` (`oid`);
alter table `catalogo_personale_film`   add index fk_catalogo_personale_film_fil (`film_oid`), add constraint fk_catalogo_personale_film_fil foreign key (`film_oid`) references `film` (`oid`);


-- Catalogo_personale_Serie [rel35]
create table `catalogo_personale_serie` (
   `catalogo_personale_oid`  integer not null,
   `serie_oid`  integer not null,
  primary key (`catalogo_personale_oid`, `serie_oid`)
);
alter table `catalogo_personale_serie`   add index fk_catalogo_personale_serie_ca (`catalogo_personale_oid`), add constraint fk_catalogo_personale_serie_ca foreign key (`catalogo_personale_oid`) references `catalogo_personale` (`oid`);
alter table `catalogo_personale_serie`   add index fk_catalogo_personale_serie_se (`serie_oid`), add constraint fk_catalogo_personale_serie_se foreign key (`serie_oid`) references `serie` (`oid`);


-- Transazione_Utente_esterno_registrato [rel6]
alter table `transazione`  add column  `utente_esterno_registrato_oid`  integer;
alter table `transazione`   add index fk_transazione_utente_esterno (`utente_esterno_registrato_oid`), add constraint fk_transazione_utente_esterno foreign key (`utente_esterno_registrato_oid`) references `utente_esterno_registrato` (`utente_oid`);


-- Transazione_Serie [rel9]
alter table `transazione`  add column  `serie_oid`  integer;
alter table `transazione`   add index fk_transazione_serie (`serie_oid`), add constraint fk_transazione_serie foreign key (`serie_oid`) references `serie` (`oid`);


-- GEN FK: Utente_esterno_registrato --> Utente
alter table `utente_esterno_registrato`   add index fk_utente_esterno_registrato_u (`utente_oid`), add constraint fk_utente_esterno_registrato_u foreign key (`utente_oid`) references `utente` (`oid`);


-- GEN FK: Utente_esterno_registrato_abbonato --> Utente_esterno_registrato
alter table `utente_esterno_registrato_abbo`   add index fk_utente_esterno_registrato_a (`utente_esterno_registrato_oid`), add constraint fk_utente_esterno_registrato_a foreign key (`utente_esterno_registrato_oid`) references `utente_esterno_registrato` (`utente_oid`);


-- SeriePremiata [ent10]
create view `seriepremiata_view` as
select distinct AL1.`oid` as `oid`
from  `serie` AL1 
where AL1.`valutazione_della_critica` >= 4.5;


-- SerieRecente [ent11]
create view `serierecente_view` as
select distinct AL1.`oid` as `oid`
from  `serie` AL1 
               left outer join `datadiuscita` AL2 on AL1.`datadiuscita_oid`=AL2.`oid`
where AL2.`anno` >= 2019;


-- FilmPremiato [ent8]
create view `filmpremiato_view` as
select distinct AL1.`oid` as `oid`
from  `film` AL1 
where AL1.`valutazione_della_critica` >= 4.5;


-- FilmRecente [ent9]
create view `filmrecente_view` as
select distinct AL1.`oid` as `oid`
from  `film` AL1 
               left outer join `datadiuscita` AL2 on AL1.`datadiuscita_oid`=AL2.`oid`
where AL2.`anno` >= 2019;


