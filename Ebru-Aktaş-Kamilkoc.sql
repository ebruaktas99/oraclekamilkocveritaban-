--------------------------------------------------------
--  File created - Pazar-Haziran-13-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence BILETLER_BILETID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BILETLER_BILETID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQCALISANTIPID
--------------------------------------------------------

   CREATE SEQUENCE  "SEQCALISANTIPID"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQMUSTERI
--------------------------------------------------------

   CREATE SEQUENCE  "SEQMUSTERI"  MINVALUE 1 MAXVALUE 100000 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQSEHIRLER
--------------------------------------------------------

   CREATE SEQUENCE  "SEQSEHIRLER"  MINVALUE 1 MAXVALUE 100000 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQSUBELER
--------------------------------------------------------

   CREATE SEQUENCE  "SEQSUBELER"  MINVALUE 1 MAXVALUE 100000 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table BILETLER
--------------------------------------------------------

  CREATE TABLE "BILETLER" 
   (	"ISLEMYAPANPERSONELID" NUMBER(*,0), 
	"BILETID" NUMBER(*,0), 
	"MUSTERIID" NUMBER(*,0), 
	"SEFERID" NUMBER(*,0), 
	"ISLEMZAMANI" DATE, 
	"KOLTUKNO" NUMBER(*,0), 
	"UCRET" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table CALISANTIPLERI
--------------------------------------------------------

  CREATE TABLE "CALISANTIPLERI" 
   (	"CALISANTIPID" NUMBER(*,0), 
	"CALISANTIPADI" NVARCHAR2(50)
   ) ;
--------------------------------------------------------
--  DDL for Table MARKALAR
--------------------------------------------------------

  CREATE TABLE "MARKALAR" 
   (	"MARKAID" NUMBER(*,0), 
	"MARKAADI" NVARCHAR2(50)
   ) ;
--------------------------------------------------------
--  DDL for Table MASRAFTIPLERI
--------------------------------------------------------

  CREATE TABLE "MASRAFTIPLERI" 
   (	"MASRAFTIPID" NUMBER(*,0), 
	"MASRAFTIPADI" NVARCHAR2(50)
   ) ;
--------------------------------------------------------
--  DDL for Table MUSTERIADRESLERI
--------------------------------------------------------

  CREATE TABLE "MUSTERIADRESLERI" 
   (	"ADRESID" NUMBER(*,0), 
	"ILCE" NVARCHAR2(50), 
	"SEHIRID" NUMBER(*,0), 
	"MAHALLE" NVARCHAR2(50), 
	"SOKAK" NVARCHAR2(50), 
	"DIÞKAPI" NUMBER(*,0)
   ) ;
--------------------------------------------------------
--  DDL for Table MUSTERILER
--------------------------------------------------------

  CREATE TABLE "MUSTERILER" 
   (	"MUSTERIID" NUMBER(*,0), 
	"AD" NVARCHAR2(50), 
	"SOYAD" NVARCHAR2(50), 
	"EMAIL" NVARCHAR2(60), 
	"TELEFON" NVARCHAR2(11), 
	"DOGUMTARIHI" DATE, 
	"ADRESID" NUMBER(*,0), 
	"KARTNUMARASI" NVARCHAR2(16)
   ) ;
--------------------------------------------------------
--  DDL for Table OTOBUSLER
--------------------------------------------------------

  CREATE TABLE "OTOBUSLER" 
   (	"OTOBUSID" NUMBER(*,0), 
	"PLAKA" NVARCHAR2(10), 
	"KOLTUKSAYISI" NUMBER(*,0), 
	"MARKAID" NUMBER(*,0)
   ) ;
--------------------------------------------------------
--  DDL for Table OTOBUSMASRAFLARI
--------------------------------------------------------

  CREATE TABLE "OTOBUSMASRAFLARI" 
   (	"OTOBUSMASRAFID" NUMBER(*,0), 
	"OTOBUSID" NUMBER(*,0), 
	"MASRAFTIPID" NUMBER(*,0), 
	"TUTAR" NUMBER(*,0), 
	"SEFERID" NUMBER(*,0)
   ) ;
--------------------------------------------------------
--  DDL for Table PERSONELISLEMLERI
--------------------------------------------------------

  CREATE TABLE "PERSONELISLEMLERI" 
   (	"PERSONELISLEMID" NUMBER(*,0), 
	"PERSONELID" NUMBER(*,0), 
	"ISLEMZAMANI" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table PERSONELLER
--------------------------------------------------------

  CREATE TABLE "PERSONELLER" 
   (	"PERSONELID" NUMBER(*,0), 
	"AD" NVARCHAR2(50), 
	"SOYAD" NVARCHAR2(50), 
	"EMAIL" NVARCHAR2(65), 
	"SUBEID" NUMBER(*,0), 
	"EVADRESI" NVARCHAR2(150), 
	"KULLANICIADI" NVARCHAR2(25), 
	"CALISANTIPID" NUMBER(*,0), 
	"SIFRE" NVARCHAR2(25)
   ) ;
--------------------------------------------------------
--  DDL for Table SEFERLER
--------------------------------------------------------

  CREATE TABLE "SEFERLER" 
   (	"SEFERID" NUMBER(*,0), 
	"KALKISSEHIRID" NUMBER(*,0), 
	"VARISSEHIRID" NUMBER(*,0), 
	"OTOBUSID" NUMBER(*,0), 
	"SOFORID" NUMBER(*,0), 
	"MUAVINID" NUMBER(*,0), 
	"KALKISZAMANI" DATE, 
	"VARISZAMANI" DATE, 
	"TAHMINISURE" NUMBER(*,0), 
	"BILETTUTARI" NUMBER(*,0)
   ) ;
--------------------------------------------------------
--  DDL for Table SEHIRLER
--------------------------------------------------------

  CREATE TABLE "SEHIRLER" 
   (	"SEHIRID" NUMBER(*,0), 
	"SEHIRADI" NVARCHAR2(50)
   ) ;
--------------------------------------------------------
--  DDL for Table SUBELER
--------------------------------------------------------

  CREATE TABLE "SUBELER" 
   (	"SUBEID" NUMBER(*,0), 
	"SEHÝRID" NUMBER(*,0), 
	"SUBEADI" NVARCHAR2(50)
   ) ;
--------------------------------------------------------
--  DDL for View BILV
--------------------------------------------------------

  CREATE OR REPLACE VIEW "BILV" ("PERSONELID", "MUSTERIID", "SEFERID", "KOLTUKNO", "UCRET") AS 
  SELECT  p.PERSONELID,m.MUSTERIID,s.SEFERID,l.KOLTUKNO,l.UCRET 

FROM BILETLER l,PERSONELLER p,MUSTERILER m,SEFERLER s

WHERE p.PERSONELID=l.ISLEMYAPANPERSONELID AND s.SEFERID=l.SEFERID
;
--------------------------------------------------------
--  DDL for View MADRESLERV
--------------------------------------------------------

  CREATE OR REPLACE VIEW "MADRESLERV" ("ADRESID", "ILCE", "SEHIRID") AS 
  SELECT 
    m.ADRESID, m.ILCE, m.SEHIRID
FROM 
    MUSTERIADRESLERI m
;
--------------------------------------------------------
--  DDL for View MUSTERIV
--------------------------------------------------------

  CREATE OR REPLACE VIEW "MUSTERIV" ("M", "ADSOYAD", "ADRESID") AS 
  SELECT 
    MUSTERIID m, m.AD||' '||m.SOYAD ADSOYAD, m.ADRESID
FROM 
  
MUSTERILER m
;
REM INSERTING into BILETLER
SET DEFINE OFF;
Insert into BILETLER (ISLEMYAPANPERSONELID,BILETID,MUSTERIID,SEFERID,ISLEMZAMANI,KOLTUKNO,UCRET) values ('23','11','11','4',to_date('11/06/2021','DD/MM/RRRR'),'11','120');
Insert into BILETLER (ISLEMYAPANPERSONELID,BILETID,MUSTERIID,SEFERID,ISLEMZAMANI,KOLTUKNO,UCRET) values ('22','1','1','1',to_date('15/06/2021','DD/MM/RRRR'),'1','150');
Insert into BILETLER (ISLEMYAPANPERSONELID,BILETID,MUSTERIID,SEFERID,ISLEMZAMANI,KOLTUKNO,UCRET) values ('22','2','2','2',to_date('14/06/2021','DD/MM/RRRR'),'2','50');
Insert into BILETLER (ISLEMYAPANPERSONELID,BILETID,MUSTERIID,SEFERID,ISLEMZAMANI,KOLTUKNO,UCRET) values ('23','3','3','3',to_date('06/06/2021','DD/MM/RRRR'),'3','150');
Insert into BILETLER (ISLEMYAPANPERSONELID,BILETID,MUSTERIID,SEFERID,ISLEMZAMANI,KOLTUKNO,UCRET) values ('23','4','4','4',to_date('07/06/2021','DD/MM/RRRR'),'4','120');
Insert into BILETLER (ISLEMYAPANPERSONELID,BILETID,MUSTERIID,SEFERID,ISLEMZAMANI,KOLTUKNO,UCRET) values ('23','5','5','4',to_date('09/06/2021','DD/MM/RRRR'),'5','120');
Insert into BILETLER (ISLEMYAPANPERSONELID,BILETID,MUSTERIID,SEFERID,ISLEMZAMANI,KOLTUKNO,UCRET) values ('23','6','6','4',to_date('14/06/2021','DD/MM/RRRR'),'6','120');
Insert into BILETLER (ISLEMYAPANPERSONELID,BILETID,MUSTERIID,SEFERID,ISLEMZAMANI,KOLTUKNO,UCRET) values ('22','7','7','7',to_date('19/06/2021','DD/MM/RRRR'),'7','150');
Insert into BILETLER (ISLEMYAPANPERSONELID,BILETID,MUSTERIID,SEFERID,ISLEMZAMANI,KOLTUKNO,UCRET) values ('24','8','8','8',to_date('03/06/2021','DD/MM/RRRR'),'8','260');
Insert into BILETLER (ISLEMYAPANPERSONELID,BILETID,MUSTERIID,SEFERID,ISLEMZAMANI,KOLTUKNO,UCRET) values ('24','9','9','9',to_date('14/06/2021','DD/MM/RRRR'),'9','130');
Insert into BILETLER (ISLEMYAPANPERSONELID,BILETID,MUSTERIID,SEFERID,ISLEMZAMANI,KOLTUKNO,UCRET) values ('23','10','10','10',to_date('20/06/2021','DD/MM/RRRR'),'10','275');
REM INSERTING into CALISANTIPLERI
SET DEFINE OFF;
Insert into CALISANTIPLERI (CALISANTIPID,CALISANTIPADI) values ('1','Muavin');
Insert into CALISANTIPLERI (CALISANTIPID,CALISANTIPADI) values ('2','Þoför');
Insert into CALISANTIPLERI (CALISANTIPID,CALISANTIPADI) values ('3','Þube Görevlisi');
Insert into CALISANTIPLERI (CALISANTIPID,CALISANTIPADI) values ('4','Ýkinci Þoför');
Insert into CALISANTIPLERI (CALISANTIPID,CALISANTIPADI) values ('5','Ýkinci Muavin ');
REM INSERTING into MARKALAR
SET DEFINE OFF;
Insert into MARKALAR (MARKAID,MARKAADI) values ('1','Hyundai Otobüs');
Insert into MARKALAR (MARKAID,MARKAADI) values ('2','Man Otobüs');
Insert into MARKALAR (MARKAID,MARKAADI) values ('3','Otokar Otobüs');
Insert into MARKALAR (MARKAID,MARKAADI) values ('4','Volvo Otobüs');
REM INSERTING into MASRAFTIPLERI
SET DEFINE OFF;
Insert into MASRAFTIPLERI (MASRAFTIPID,MASRAFTIPADI) values ('1','Otobüs Benzin');
Insert into MASRAFTIPLERI (MASRAFTIPID,MASRAFTIPADI) values ('2','Sefer Ýkram Ýçecekleri');
Insert into MASRAFTIPLERI (MASRAFTIPID,MASRAFTIPADI) values ('3','Sefer Ýkram Yiyecekleri');
Insert into MASRAFTIPLERI (MASRAFTIPID,MASRAFTIPADI) values ('4','Otobüs Bakým ');
Insert into MASRAFTIPLERI (MASRAFTIPID,MASRAFTIPADI) values ('5','Çalýþan Ücretleri');
REM INSERTING into MUSTERIADRESLERI
SET DEFINE OFF;
Insert into MUSTERIADRESLERI (ADRESID,ILCE,SEHIRID,MAHALLE,SOKAK,"DIÞKAPI") values ('11','Karacabey','2','L1','L1','22');
Insert into MUSTERIADRESLERI (ADRESID,ILCE,SEHIRID,MAHALLE,SOKAK,"DIÞKAPI") values ('1','Beþiktaþ','1','A1','B1','14');
Insert into MUSTERIADRESLERI (ADRESID,ILCE,SEHIRID,MAHALLE,SOKAK,"DIÞKAPI") values ('2','Beþiktaþ','1','C1','C2','15');
Insert into MUSTERIADRESLERI (ADRESID,ILCE,SEHIRID,MAHALLE,SOKAK,"DIÞKAPI") values ('3','Nilüfer','2','D1','D1','16');
Insert into MUSTERIADRESLERI (ADRESID,ILCE,SEHIRID,MAHALLE,SOKAK,"DIÞKAPI") values ('4','Ýnegöl','2','E1','E1','26');
Insert into MUSTERIADRESLERI (ADRESID,ILCE,SEHIRID,MAHALLE,SOKAK,"DIÞKAPI") values ('5','Ýnegöl','2','E1','E1','26');
Insert into MUSTERIADRESLERI (ADRESID,ILCE,SEHIRID,MAHALLE,SOKAK,"DIÞKAPI") values ('6','Ýnegöl','2','E1','E1','26');
Insert into MUSTERIADRESLERI (ADRESID,ILCE,SEHIRID,MAHALLE,SOKAK,"DIÞKAPI") values ('7','Beþiktaþ','1','F1','F1','24');
Insert into MUSTERIADRESLERI (ADRESID,ILCE,SEHIRID,MAHALLE,SOKAK,"DIÞKAPI") values ('8','Yenimahalle','3','G1','G1','12');
Insert into MUSTERIADRESLERI (ADRESID,ILCE,SEHIRID,MAHALLE,SOKAK,"DIÞKAPI") values ('9','Etimesgut','3','H1','H1','11');
Insert into MUSTERIADRESLERI (ADRESID,ILCE,SEHIRID,MAHALLE,SOKAK,"DIÞKAPI") values ('10','Yýldýrým','2','K1','K1','10');
REM INSERTING into MUSTERILER
SET DEFINE OFF;
Insert into MUSTERILER (MUSTERIID,AD,SOYAD,EMAIL,TELEFON,DOGUMTARIHI,ADRESID,KARTNUMARASI) values ('11','Veli','Doðan','veli@hotmail.com','5556664477',to_date('02/06/1987','DD/MM/RRRR'),'11','5874');
Insert into MUSTERILER (MUSTERIID,AD,SOYAD,EMAIL,TELEFON,DOGUMTARIHI,ADRESID,KARTNUMARASI) values ('1','Ali','Arslan','ali3@hotmail.com','5555555555',to_date('24/06/2000','DD/MM/RRRR'),'1','1111');
Insert into MUSTERILER (MUSTERIID,AD,SOYAD,EMAIL,TELEFON,DOGUMTARIHI,ADRESID,KARTNUMARASI) values ('2','Ahmet','Arslan','ahmet3@hotmail.com','5553334411',to_date('04/06/1999','DD/MM/RRRR'),'2','2222');
Insert into MUSTERILER (MUSTERIID,AD,SOYAD,EMAIL,TELEFON,DOGUMTARIHI,ADRESID,KARTNUMARASI) values ('3','Yýlmaz','Eren','yýlmaz3@hotmail.com','5558889966',to_date('25/10/2000','DD/MM/RRRR'),'3','3333');
Insert into MUSTERILER (MUSTERIID,AD,SOYAD,EMAIL,TELEFON,DOGUMTARIHI,ADRESID,KARTNUMARASI) values ('4','Ebru','Aktaþ','ebru@hotmail.com','5553337766',to_date('21/01/1999','DD/MM/RRRR'),'4','4444');
Insert into MUSTERILER (MUSTERIID,AD,SOYAD,EMAIL,TELEFON,DOGUMTARIHI,ADRESID,KARTNUMARASI) values ('5','Elif','Aktaþ','elif@hotmail.com','5554446677',to_date('09/11/1997','DD/MM/RRRR'),'5','5555');
Insert into MUSTERILER (MUSTERIID,AD,SOYAD,EMAIL,TELEFON,DOGUMTARIHI,ADRESID,KARTNUMARASI) values ('6','Erdem','Aktaþ','erdem@hotmail.com','5551113344',to_date('07/09/2009','DD/MM/RRRR'),'6','6666');
Insert into MUSTERILER (MUSTERIID,AD,SOYAD,EMAIL,TELEFON,DOGUMTARIHI,ADRESID,KARTNUMARASI) values ('7','Esra','Ekinci','esra@hotmail.com','5559994466',to_date('13/10/1998','DD/MM/RRRR'),'7','7777');
Insert into MUSTERILER (MUSTERIID,AD,SOYAD,EMAIL,TELEFON,DOGUMTARIHI,ADRESID,KARTNUMARASI) values ('8','Kadir','Yýlmaz','kadir@hotmail.com','5558883344',to_date('30/06/1999','DD/MM/RRRR'),'8','8888');
Insert into MUSTERILER (MUSTERIID,AD,SOYAD,EMAIL,TELEFON,DOGUMTARIHI,ADRESID,KARTNUMARASI) values ('9','Mert','Yýldýrým','mert3@hotmail.com','5552221111',to_date('23/04/1995','DD/MM/RRRR'),'9','9999');
Insert into MUSTERILER (MUSTERIID,AD,SOYAD,EMAIL,TELEFON,DOGUMTARIHI,ADRESID,KARTNUMARASI) values ('10','Volkan','Atýcý','volkan3@hotmail.com','5553339911',to_date('14/02/1993','DD/MM/RRRR'),'10','4747');
REM INSERTING into OTOBUSLER
SET DEFINE OFF;
Insert into OTOBUSLER (OTOBUSID,PLAKA,KOLTUKSAYISI,MARKAID) values ('1','16BB','40','1');
Insert into OTOBUSLER (OTOBUSID,PLAKA,KOLTUKSAYISI,MARKAID) values ('2','16AA','40','2');
Insert into OTOBUSLER (OTOBUSID,PLAKA,KOLTUKSAYISI,MARKAID) values ('3','16CC','40','2');
Insert into OTOBUSLER (OTOBUSID,PLAKA,KOLTUKSAYISI,MARKAID) values ('4','16DD','40','3');
Insert into OTOBUSLER (OTOBUSID,PLAKA,KOLTUKSAYISI,MARKAID) values ('5','16EE','40','4');
Insert into OTOBUSLER (OTOBUSID,PLAKA,KOLTUKSAYISI,MARKAID) values ('6','16FF
','40','3');
Insert into OTOBUSLER (OTOBUSID,PLAKA,KOLTUKSAYISI,MARKAID) values ('7','16GG','40','3');
Insert into OTOBUSLER (OTOBUSID,PLAKA,KOLTUKSAYISI,MARKAID) values ('8','16HH','40','2');
Insert into OTOBUSLER (OTOBUSID,PLAKA,KOLTUKSAYISI,MARKAID) values ('9','16II','40','2');
Insert into OTOBUSLER (OTOBUSID,PLAKA,KOLTUKSAYISI,MARKAID) values ('10','16JJ','40','2');
Insert into OTOBUSLER (OTOBUSID,PLAKA,KOLTUKSAYISI,MARKAID) values ('11','16KK','40','1');
Insert into OTOBUSLER (OTOBUSID,PLAKA,KOLTUKSAYISI,MARKAID) values ('12','34AA','40','2');
Insert into OTOBUSLER (OTOBUSID,PLAKA,KOLTUKSAYISI,MARKAID) values ('13','34LL','40','2');
Insert into OTOBUSLER (OTOBUSID,PLAKA,KOLTUKSAYISI,MARKAID) values ('14','34NN','40','3');
Insert into OTOBUSLER (OTOBUSID,PLAKA,KOLTUKSAYISI,MARKAID) values ('15','34PP','40','1');
Insert into OTOBUSLER (OTOBUSID,PLAKA,KOLTUKSAYISI,MARKAID) values ('16','34RR','40','2');
Insert into OTOBUSLER (OTOBUSID,PLAKA,KOLTUKSAYISI,MARKAID) values ('17','34KK','40','1');
Insert into OTOBUSLER (OTOBUSID,PLAKA,KOLTUKSAYISI,MARKAID) values ('18','34BB','40','1');
Insert into OTOBUSLER (OTOBUSID,PLAKA,KOLTUKSAYISI,MARKAID) values ('19','34ZZ','40','3');
Insert into OTOBUSLER (OTOBUSID,PLAKA,KOLTUKSAYISI,MARKAID) values ('20','34YY','40','2');
Insert into OTOBUSLER (OTOBUSID,PLAKA,KOLTUKSAYISI,MARKAID) values ('21','34SS','40','3');
REM INSERTING into OTOBUSMASRAFLARI
SET DEFINE OFF;
REM INSERTING into PERSONELISLEMLERI
SET DEFINE OFF;
REM INSERTING into PERSONELLER
SET DEFINE OFF;
Insert into PERSONELLER (PERSONELID,AD,SOYAD,EMAIL,SUBEID,EVADRESI,KULLANICIADI,CALISANTIPID,SIFRE) values ('1','Ali','Yýlmaz','ali@hotmail.com','1','Beþiktaþ,Ýstanbul','aliyilmaz','1','ali123');
Insert into PERSONELLER (PERSONELID,AD,SOYAD,EMAIL,SUBEID,EVADRESI,KULLANICIADI,CALISANTIPID,SIFRE) values ('2','Ahmet','Akay','ahmet@hotmail.com','3','Yenimahalle, Ankara','ahmetakay','2','ahmet123');
Insert into PERSONELLER (PERSONELID,AD,SOYAD,EMAIL,SUBEID,EVADRESI,KULLANICIADI,CALISANTIPID,SIFRE) values ('3','Recep','Kahraman','recep@hotmail.com','4','Merkez,Adana','recepkahraman','3','recep123');
Insert into PERSONELLER (PERSONELID,AD,SOYAD,EMAIL,SUBEID,EVADRESI,KULLANICIADI,CALISANTIPID,SIFRE) values ('4','Murat','Yýlmaz','murat@hotmail.com','5','Bornova,Ýzmir','muratyýlmaz','4','murat123');
Insert into PERSONELLER (PERSONELID,AD,SOYAD,EMAIL,SUBEID,EVADRESI,KULLANICIADI,CALISANTIPID,SIFRE) values ('5','Recai','Yýldýz','recai@hotmail.com','6','Merkez,Antalya','recaiyýldýz','5','recai123');
Insert into PERSONELLER (PERSONELID,AD,SOYAD,EMAIL,SUBEID,EVADRESI,KULLANICIADI,CALISANTIPID,SIFRE) values ('6','Murat','Kahraman','murat2@hotmail.com','7','Merkez,Aydýn','muratkahraman','2','murat2123');
Insert into PERSONELLER (PERSONELID,AD,SOYAD,EMAIL,SUBEID,EVADRESI,KULLANICIADI,CALISANTIPID,SIFRE) values ('7','Cemal','Yýldýz','cemal@hotmail.com','8','Merkez,Manisa','cemalyýldýz','3','cemal123');
Insert into PERSONELLER (PERSONELID,AD,SOYAD,EMAIL,SUBEID,EVADRESI,KULLANICIADI,CALISANTIPID,SIFRE) values ('8','Mustafa','Yýlmaz','mustafa@hotmail.com','9','Merkez,Kocaeli','mustafayýlmaz','1','mustafa123');
Insert into PERSONELLER (PERSONELID,AD,SOYAD,EMAIL,SUBEID,EVADRESI,KULLANICIADI,CALISANTIPID,SIFRE) values ('9','Ecevit','Yýldýzhan','ecevit@hotmail.com','2','Ýnegöl,Bursa','ecevityýldýzhan','4','ecevit123');
Insert into PERSONELLER (PERSONELID,AD,SOYAD,EMAIL,SUBEID,EVADRESI,KULLANICIADI,CALISANTIPID,SIFRE) values ('10','Ýhsan','Kaðan','ihsan@hotmail.com','10','Merkez,Mardin','ihsankagan','5','ihsan123');
Insert into PERSONELLER (PERSONELID,AD,SOYAD,EMAIL,SUBEID,EVADRESI,KULLANICIADI,CALISANTIPID,SIFRE) values ('11','Kaan','Yýldýrým','kaan@hotmail.com','11','Merkez,Eskiþehir','kaanyýldýrým','1','kaan123');
Insert into PERSONELLER (PERSONELID,AD,SOYAD,EMAIL,SUBEID,EVADRESI,KULLANICIADI,CALISANTIPID,SIFRE) values ('12','Mert','Demiral','mert@hotmail.com','12','Merkez,Kütahya','mertdemiral','2','mert123');
Insert into PERSONELLER (PERSONELID,AD,SOYAD,EMAIL,SUBEID,EVADRESI,KULLANICIADI,CALISANTIPID,SIFRE) values ('13','Orhan','Önder','orhan@hotmail.com','13','Balýkesir','orhanonder','3','orhan123');
Insert into PERSONELLER (PERSONELID,AD,SOYAD,EMAIL,SUBEID,EVADRESI,KULLANICIADI,CALISANTIPID,SIFRE) values ('14','Sedat','Aktan','sedat@hotmail.com','14','Burdur','sedataktan','4','sedat123');
Insert into PERSONELLER (PERSONELID,AD,SOYAD,EMAIL,SUBEID,EVADRESI,KULLANICIADI,CALISANTIPID,SIFRE) values ('15','Serdar','Akay','serdar@hotmail.com','15','Isparta','serdarakay','5','serdar123');
Insert into PERSONELLER (PERSONELID,AD,SOYAD,EMAIL,SUBEID,EVADRESI,KULLANICIADI,CALISANTIPID,SIFRE) values ('16','Yavuz','Yýlmaz','yavuz@hotmail.com','16','Ordu','yavuzyýlmaz','1','yavuz123');
Insert into PERSONELLER (PERSONELID,AD,SOYAD,EMAIL,SUBEID,EVADRESI,KULLANICIADI,CALISANTIPID,SIFRE) values ('17','Volkan','Arslan','volkan@hotmail.com','17','Trabzon','volkanarslan','2','volkan123');
Insert into PERSONELLER (PERSONELID,AD,SOYAD,EMAIL,SUBEID,EVADRESI,KULLANICIADI,CALISANTIPID,SIFRE) values ('18','Alpaslan','Alkan','alpaslan@hotmail.com','18','Rize','alpaslanalkan','3','alpaslan123');
Insert into PERSONELLER (PERSONELID,AD,SOYAD,EMAIL,SUBEID,EVADRESI,KULLANICIADI,CALISANTIPID,SIFRE) values ('19','Aras','Arýkan','aras@hotmail.com','19','Tekirdað','arasarýkan','4','aras123');
Insert into PERSONELLER (PERSONELID,AD,SOYAD,EMAIL,SUBEID,EVADRESI,KULLANICIADI,CALISANTIPID,SIFRE) values ('20','Yýlmaz','Yýldýrým','yýlmaz@hotmail.com','20','Edirne','yýlmazyýldýrým','5','yýlmaz123');
Insert into PERSONELLER (PERSONELID,AD,SOYAD,EMAIL,SUBEID,EVADRESI,KULLANICIADI,CALISANTIPID,SIFRE) values ('21','Emre','Erberk','emre@hotmail.com','21','Zonguldak','emreerberk','2','emre123');
Insert into PERSONELLER (PERSONELID,AD,SOYAD,EMAIL,SUBEID,EVADRESI,KULLANICIADI,CALISANTIPID,SIFRE) values ('22','Hasan','Kaya','hasan@hotmail.com','1','Beþiktaþ,Ýstanbul','hasankaya','3','hasan123');
Insert into PERSONELLER (PERSONELID,AD,SOYAD,EMAIL,SUBEID,EVADRESI,KULLANICIADI,CALISANTIPID,SIFRE) values ('23','Buðra','Tufan','bugra@hotmail.com','2','Ýnegöl,Bursa','bugratufan','3','bugra123');
Insert into PERSONELLER (PERSONELID,AD,SOYAD,EMAIL,SUBEID,EVADRESI,KULLANICIADI,CALISANTIPID,SIFRE) values ('24','Bedirhan','Kaya','bedirhan@hotmail.com','3','Yenimahalle,Ankara','bedirhankaya','3','bedirhan123');
REM INSERTING into SEFERLER
SET DEFINE OFF;
Insert into SEFERLER (SEFERID,KALKISSEHIRID,VARISSEHIRID,OTOBUSID,SOFORID,MUAVINID,KALKISZAMANI,VARISZAMANI,TAHMINISURE,BILETTUTARI) values ('1','1','11','1','1','2',to_date('20/06/2021','DD/MM/RRRR'),to_date('20/06/2021','DD/MM/RRRR'),'7','150');
Insert into SEFERLER (SEFERID,KALKISSEHIRID,VARISSEHIRID,OTOBUSID,SOFORID,MUAVINID,KALKISZAMANI,VARISZAMANI,TAHMINISURE,BILETTUTARI) values ('2','2','12','2','8','6',to_date('21/06/2021','DD/MM/RRRR'),to_date('21/06/2021','DD/MM/RRRR'),'3','50');
Insert into SEFERLER (SEFERID,KALKISSEHIRID,VARISSEHIRID,OTOBUSID,SOFORID,MUAVINID,KALKISZAMANI,VARISZAMANI,TAHMINISURE,BILETTUTARI) values ('3','3','13','3','11','12',to_date('22/06/2021','DD/MM/RRRR'),to_date('22/06/2021','DD/MM/RRRR'),'8','150');
Insert into SEFERLER (SEFERID,KALKISSEHIRID,VARISSEHIRID,OTOBUSID,SOFORID,MUAVINID,KALKISZAMANI,VARISZAMANI,TAHMINISURE,BILETTUTARI) values ('4','4','14','5','16','17',to_date('23/06/2021','DD/MM/RRRR'),to_date('23/06/2021','DD/MM/RRRR'),'6','120');
Insert into SEFERLER (SEFERID,KALKISSEHIRID,VARISSEHIRID,OTOBUSID,SOFORID,MUAVINID,KALKISZAMANI,VARISZAMANI,TAHMINISURE,BILETTUTARI) values ('5','5','15','7','1','21',to_date('24/06/2021','DD/MM/RRRR'),to_date('24/06/2021','DD/MM/RRRR'),'6','120');
Insert into SEFERLER (SEFERID,KALKISSEHIRID,VARISSEHIRID,OTOBUSID,SOFORID,MUAVINID,KALKISZAMANI,VARISZAMANI,TAHMINISURE,BILETTUTARI) values ('6','6','16','9','8','2',to_date('25/06/2021','DD/MM/RRRR'),to_date('26/06/2021','DD/MM/RRRR'),'18','250');
Insert into SEFERLER (SEFERID,KALKISSEHIRID,VARISSEHIRID,OTOBUSID,SOFORID,MUAVINID,KALKISZAMANI,VARISZAMANI,TAHMINISURE,BILETTUTARI) values ('7','7','17','11','11','6',to_date('27/06/2021','DD/MM/RRRR'),to_date('27/06/2021','DD/MM/RRRR'),'8','150');
Insert into SEFERLER (SEFERID,KALKISSEHIRID,VARISSEHIRID,OTOBUSID,SOFORID,MUAVINID,KALKISZAMANI,VARISZAMANI,TAHMINISURE,BILETTUTARI) values ('8','8','18','21','13','12',to_date('28/06/2021','DD/MM/RRRR'),to_date('29/06/2021','DD/MM/RRRR'),'19','260');
Insert into SEFERLER (SEFERID,KALKISSEHIRID,VARISSEHIRID,OTOBUSID,SOFORID,MUAVINID,KALKISZAMANI,VARISZAMANI,TAHMINISURE,BILETTUTARI) values ('9','9','19','16','1','17',to_date('30/06/2021','DD/MM/RRRR'),to_date('30/06/2021','DD/MM/RRRR'),'7','130');
Insert into SEFERLER (SEFERID,KALKISSEHIRID,VARISSEHIRID,OTOBUSID,SOFORID,MUAVINID,KALKISZAMANI,VARISZAMANI,TAHMINISURE,BILETTUTARI) values ('10','10','20','14','8','21',to_date('01/07/2021','DD/MM/RRRR'),to_date('02/07/2021','DD/MM/RRRR'),'20','275');
REM INSERTING into SEHIRLER
SET DEFINE OFF;
Insert into SEHIRLER (SEHIRID,SEHIRADI) values ('1','Ýstanbul');
Insert into SEHIRLER (SEHIRID,SEHIRADI) values ('2','Bursa');
Insert into SEHIRLER (SEHIRID,SEHIRADI) values ('3','Ankara');
Insert into SEHIRLER (SEHIRID,SEHIRADI) values ('4','Adana');
Insert into SEHIRLER (SEHIRID,SEHIRADI) values ('5','Ýzmir');
Insert into SEHIRLER (SEHIRID,SEHIRADI) values ('6','Antalya');
Insert into SEHIRLER (SEHIRID,SEHIRADI) values ('7','Aydýn');
Insert into SEHIRLER (SEHIRID,SEHIRADI) values ('8','Manisa');
Insert into SEHIRLER (SEHIRID,SEHIRADI) values ('9','Kocaeli');
Insert into SEHIRLER (SEHIRID,SEHIRADI) values ('10','Mardin');
Insert into SEHIRLER (SEHIRID,SEHIRADI) values ('11','Eskiþehir');
Insert into SEHIRLER (SEHIRID,SEHIRADI) values ('12','Kütahya');
Insert into SEHIRLER (SEHIRID,SEHIRADI) values ('13','Balýkesir');
Insert into SEHIRLER (SEHIRID,SEHIRADI) values ('14','Burdur');
Insert into SEHIRLER (SEHIRID,SEHIRADI) values ('15','Isparta');
Insert into SEHIRLER (SEHIRID,SEHIRADI) values ('16','Ordu');
Insert into SEHIRLER (SEHIRID,SEHIRADI) values ('17','Trabzon');
Insert into SEHIRLER (SEHIRID,SEHIRADI) values ('18','Rize');
Insert into SEHIRLER (SEHIRID,SEHIRADI) values ('19','Tekirdað');
Insert into SEHIRLER (SEHIRID,SEHIRADI) values ('20','Edirne');
Insert into SEHIRLER (SEHIRID,SEHIRADI) values ('21','Zonguldak');
REM INSERTING into SUBELER
SET DEFINE OFF;
Insert into SUBELER (SUBEID,"SEHÝRID",SUBEADI) values ('1','1','Ýstanbul Þubesi');
Insert into SUBELER (SUBEID,"SEHÝRID",SUBEADI) values ('2','2','Bursa Þubesi');
Insert into SUBELER (SUBEID,"SEHÝRID",SUBEADI) values ('3','3','Ankara Þubesi');
Insert into SUBELER (SUBEID,"SEHÝRID",SUBEADI) values ('4','4','Adana Þubesi');
Insert into SUBELER (SUBEID,"SEHÝRID",SUBEADI) values ('5','5','Ýzmir Þubesi');
Insert into SUBELER (SUBEID,"SEHÝRID",SUBEADI) values ('6','6','Antalya Þubesi');
Insert into SUBELER (SUBEID,"SEHÝRID",SUBEADI) values ('7','7','Aydýn Þubesi');
Insert into SUBELER (SUBEID,"SEHÝRID",SUBEADI) values ('8','8','Manisa Þubesi');
Insert into SUBELER (SUBEID,"SEHÝRID",SUBEADI) values ('9','9','Kocaeli Þubesi');
Insert into SUBELER (SUBEID,"SEHÝRID",SUBEADI) values ('10','10','Mardin Þubesi');
Insert into SUBELER (SUBEID,"SEHÝRID",SUBEADI) values ('11','11','Eskiþehir Þubesi');
Insert into SUBELER (SUBEID,"SEHÝRID",SUBEADI) values ('12','12','Kütahya Þubesi');
Insert into SUBELER (SUBEID,"SEHÝRID",SUBEADI) values ('13','13','Balýkesir Þubesi');
Insert into SUBELER (SUBEID,"SEHÝRID",SUBEADI) values ('14','14','Burdur Þubesi');
Insert into SUBELER (SUBEID,"SEHÝRID",SUBEADI) values ('15','15','Isparta Þubesi');
Insert into SUBELER (SUBEID,"SEHÝRID",SUBEADI) values ('16','16','Ordu Þubesi');
Insert into SUBELER (SUBEID,"SEHÝRID",SUBEADI) values ('17','17','Trabzon Þubesi');
Insert into SUBELER (SUBEID,"SEHÝRID",SUBEADI) values ('18','18','Rize Þubesi');
Insert into SUBELER (SUBEID,"SEHÝRID",SUBEADI) values ('19','19','Tekirdað Þubesi');
Insert into SUBELER (SUBEID,"SEHÝRID",SUBEADI) values ('20','20','Edirne Þubesi');
Insert into SUBELER (SUBEID,"SEHÝRID",SUBEADI) values ('21','21','Zonguldak Þubesi');
REM INSERTING into BILV
SET DEFINE OFF;
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','1','4','11','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','2','4','11','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','3','4','11','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','4','4','11','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','5','4','11','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','6','4','11','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','7','4','11','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','8','4','11','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','9','4','11','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','10','4','11','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','11','4','11','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','1','1','1','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','2','1','1','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','3','1','1','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','4','1','1','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','5','1','1','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','6','1','1','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','7','1','1','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','8','1','1','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','9','1','1','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','10','1','1','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','11','1','1','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','1','2','2','50');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','2','2','2','50');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','3','2','2','50');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','4','2','2','50');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','5','2','2','50');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','6','2','2','50');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','7','2','2','50');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','8','2','2','50');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','9','2','2','50');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','10','2','2','50');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','11','2','2','50');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','1','3','3','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','2','3','3','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','3','3','3','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','4','3','3','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','5','3','3','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','6','3','3','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','7','3','3','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','8','3','3','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','9','3','3','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','10','3','3','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','11','3','3','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','1','4','4','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','2','4','4','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','3','4','4','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','4','4','4','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','5','4','4','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','6','4','4','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','7','4','4','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','8','4','4','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','9','4','4','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','10','4','4','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','11','4','4','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','1','4','5','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','2','4','5','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','3','4','5','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','4','4','5','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','5','4','5','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','6','4','5','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','7','4','5','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','8','4','5','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','9','4','5','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','10','4','5','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','11','4','5','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','1','4','6','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','2','4','6','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','3','4','6','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','4','4','6','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','5','4','6','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','6','4','6','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','7','4','6','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','8','4','6','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','9','4','6','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','10','4','6','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','11','4','6','120');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','1','7','7','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','2','7','7','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','3','7','7','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','4','7','7','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','5','7','7','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','6','7','7','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','7','7','7','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','8','7','7','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','9','7','7','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','10','7','7','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('22','11','7','7','150');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('24','1','8','8','260');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('24','2','8','8','260');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('24','3','8','8','260');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('24','4','8','8','260');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('24','5','8','8','260');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('24','6','8','8','260');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('24','7','8','8','260');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('24','8','8','8','260');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('24','9','8','8','260');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('24','10','8','8','260');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('24','11','8','8','260');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('24','1','9','9','130');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('24','2','9','9','130');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('24','3','9','9','130');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('24','4','9','9','130');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('24','5','9','9','130');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('24','6','9','9','130');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('24','7','9','9','130');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('24','8','9','9','130');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('24','9','9','9','130');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('24','10','9','9','130');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('24','11','9','9','130');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','1','10','10','275');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','2','10','10','275');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','3','10','10','275');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','4','10','10','275');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','5','10','10','275');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','6','10','10','275');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','7','10','10','275');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','8','10','10','275');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','9','10','10','275');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','10','10','10','275');
Insert into BILV (PERSONELID,MUSTERIID,SEFERID,KOLTUKNO,UCRET) values ('23','11','10','10','275');
REM INSERTING into MADRESLERV
SET DEFINE OFF;
Insert into MADRESLERV (ADRESID,ILCE,SEHIRID) values ('11','Karacabey','2');
Insert into MADRESLERV (ADRESID,ILCE,SEHIRID) values ('1','Beþiktaþ','1');
Insert into MADRESLERV (ADRESID,ILCE,SEHIRID) values ('2','Beþiktaþ','1');
Insert into MADRESLERV (ADRESID,ILCE,SEHIRID) values ('3','Nilüfer','2');
Insert into MADRESLERV (ADRESID,ILCE,SEHIRID) values ('4','Ýnegöl','2');
Insert into MADRESLERV (ADRESID,ILCE,SEHIRID) values ('5','Ýnegöl','2');
Insert into MADRESLERV (ADRESID,ILCE,SEHIRID) values ('6','Ýnegöl','2');
Insert into MADRESLERV (ADRESID,ILCE,SEHIRID) values ('7','Beþiktaþ','1');
Insert into MADRESLERV (ADRESID,ILCE,SEHIRID) values ('8','Yenimahalle','3');
Insert into MADRESLERV (ADRESID,ILCE,SEHIRID) values ('9','Etimesgut','3');
Insert into MADRESLERV (ADRESID,ILCE,SEHIRID) values ('10','Yýldýrým','2');
REM INSERTING into MUSTERIV
SET DEFINE OFF;
Insert into MUSTERIV (M,ADSOYAD,ADRESID) values ('11','Veli Doðan','11');
Insert into MUSTERIV (M,ADSOYAD,ADRESID) values ('1','Ali Arslan','1');
Insert into MUSTERIV (M,ADSOYAD,ADRESID) values ('2','Ahmet Arslan','2');
Insert into MUSTERIV (M,ADSOYAD,ADRESID) values ('3','Yýlmaz Eren','3');
Insert into MUSTERIV (M,ADSOYAD,ADRESID) values ('4','Ebru Aktaþ','4');
Insert into MUSTERIV (M,ADSOYAD,ADRESID) values ('5','Elif Aktaþ','5');
Insert into MUSTERIV (M,ADSOYAD,ADRESID) values ('6','Erdem Aktaþ','6');
Insert into MUSTERIV (M,ADSOYAD,ADRESID) values ('7','Esra Ekinci','7');
Insert into MUSTERIV (M,ADSOYAD,ADRESID) values ('8','Kadir Yýlmaz','8');
Insert into MUSTERIV (M,ADSOYAD,ADRESID) values ('9','Mert Yýldýrým','9');
Insert into MUSTERIV (M,ADSOYAD,ADRESID) values ('10','Volkan Atýcý','10');
--------------------------------------------------------
--  DDL for Index BILETLER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BILETLER_PK" ON "BILETLER" ("BILETID") 
  ;
--------------------------------------------------------
--  DDL for Index CALISANTIPLERI_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CALISANTIPLERI_PK" ON "CALISANTIPLERI" ("CALISANTIPID") 
  ;
--------------------------------------------------------
--  DDL for Index MARKALAR_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MARKALAR_PK" ON "MARKALAR" ("MARKAID") 
  ;
--------------------------------------------------------
--  DDL for Index MASRAFTIPLERI_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MASRAFTIPLERI_PK" ON "MASRAFTIPLERI" ("MASRAFTIPID") 
  ;
--------------------------------------------------------
--  DDL for Index MUSTERIADRESLERI_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MUSTERIADRESLERI_PK" ON "MUSTERIADRESLERI" ("ADRESID") 
  ;
--------------------------------------------------------
--  DDL for Index MUSTERILER_KARTNUMARASI_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "MUSTERILER_KARTNUMARASI_UK1" ON "MUSTERILER" ("KARTNUMARASI") 
  ;
--------------------------------------------------------
--  DDL for Index MUSTERILER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MUSTERILER_PK" ON "MUSTERILER" ("MUSTERIID") 
  ;
--------------------------------------------------------
--  DDL for Index MUSTERILER_TELEFON_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "MUSTERILER_TELEFON_UK1" ON "MUSTERILER" ("TELEFON") 
  ;
--------------------------------------------------------
--  DDL for Index OTOBUSLER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "OTOBUSLER_PK" ON "OTOBUSLER" ("OTOBUSID") 
  ;
--------------------------------------------------------
--  DDL for Index OTOBUSLER_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "OTOBUSLER_UK1" ON "OTOBUSLER" ("PLAKA") 
  ;
--------------------------------------------------------
--  DDL for Index OTOBUSMASRAFLARI_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "OTOBUSMASRAFLARI_PK" ON "OTOBUSMASRAFLARI" ("OTOBUSMASRAFID") 
  ;
--------------------------------------------------------
--  DDL for Index PERSONELGIRISCIKIS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PERSONELGIRISCIKIS_PK" ON "PERSONELISLEMLERI" ("PERSONELISLEMID") 
  ;
--------------------------------------------------------
--  DDL for Index PERSONELLER_EMAIL_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "PERSONELLER_EMAIL_UK1" ON "PERSONELLER" ("EMAIL") 
  ;
--------------------------------------------------------
--  DDL for Index PERSONELLER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PERSONELLER_PK" ON "PERSONELLER" ("PERSONELID") 
  ;
--------------------------------------------------------
--  DDL for Index PERSONELLER_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "PERSONELLER_UK1" ON "PERSONELLER" ("KULLANICIADI") 
  ;
--------------------------------------------------------
--  DDL for Index SEFERLER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SEFERLER_PK" ON "SEFERLER" ("SEFERID") 
  ;
--------------------------------------------------------
--  DDL for Index SEHIRLER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SEHIRLER_PK" ON "SEHIRLER" ("SEHIRID") 
  ;
--------------------------------------------------------
--  DDL for Index SUBELER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SUBELER_PK" ON "SUBELER" ("SUBEID") 
  ;
--------------------------------------------------------
--  DDL for Index SUBELER_SUBEADI_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SUBELER_SUBEADI_UK1" ON "SUBELER" ("SUBEADI") 
  ;
--------------------------------------------------------
--  DDL for Index BILETLER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BILETLER_PK" ON "BILETLER" ("BILETID") 
  ;
--------------------------------------------------------
--  DDL for Index CALISANTIPLERI_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CALISANTIPLERI_PK" ON "CALISANTIPLERI" ("CALISANTIPID") 
  ;
--------------------------------------------------------
--  DDL for Index MARKALAR_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MARKALAR_PK" ON "MARKALAR" ("MARKAID") 
  ;
--------------------------------------------------------
--  DDL for Index MASRAFTIPLERI_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MASRAFTIPLERI_PK" ON "MASRAFTIPLERI" ("MASRAFTIPID") 
  ;
--------------------------------------------------------
--  DDL for Index MUSTERIADRESLERI_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MUSTERIADRESLERI_PK" ON "MUSTERIADRESLERI" ("ADRESID") 
  ;
--------------------------------------------------------
--  DDL for Index MUSTERILER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MUSTERILER_PK" ON "MUSTERILER" ("MUSTERIID") 
  ;
--------------------------------------------------------
--  DDL for Index MUSTERILER_TELEFON_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "MUSTERILER_TELEFON_UK1" ON "MUSTERILER" ("TELEFON") 
  ;
--------------------------------------------------------
--  DDL for Index MUSTERILER_KARTNUMARASI_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "MUSTERILER_KARTNUMARASI_UK1" ON "MUSTERILER" ("KARTNUMARASI") 
  ;
--------------------------------------------------------
--  DDL for Index OTOBUSLER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "OTOBUSLER_PK" ON "OTOBUSLER" ("OTOBUSID") 
  ;
--------------------------------------------------------
--  DDL for Index OTOBUSLER_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "OTOBUSLER_UK1" ON "OTOBUSLER" ("PLAKA") 
  ;
--------------------------------------------------------
--  DDL for Index OTOBUSMASRAFLARI_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "OTOBUSMASRAFLARI_PK" ON "OTOBUSMASRAFLARI" ("OTOBUSMASRAFID") 
  ;
--------------------------------------------------------
--  DDL for Index PERSONELGIRISCIKIS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PERSONELGIRISCIKIS_PK" ON "PERSONELISLEMLERI" ("PERSONELISLEMID") 
  ;
--------------------------------------------------------
--  DDL for Index PERSONELLER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PERSONELLER_PK" ON "PERSONELLER" ("PERSONELID") 
  ;
--------------------------------------------------------
--  DDL for Index PERSONELLER_EMAIL_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "PERSONELLER_EMAIL_UK1" ON "PERSONELLER" ("EMAIL") 
  ;
--------------------------------------------------------
--  DDL for Index PERSONELLER_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "PERSONELLER_UK1" ON "PERSONELLER" ("KULLANICIADI") 
  ;
--------------------------------------------------------
--  DDL for Index SEFERLER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SEFERLER_PK" ON "SEFERLER" ("SEFERID") 
  ;
--------------------------------------------------------
--  DDL for Index SEHIRLER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SEHIRLER_PK" ON "SEHIRLER" ("SEHIRID") 
  ;
--------------------------------------------------------
--  DDL for Index SUBELER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SUBELER_PK" ON "SUBELER" ("SUBEID") 
  ;
--------------------------------------------------------
--  DDL for Index SUBELER_SUBEADI_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SUBELER_SUBEADI_UK1" ON "SUBELER" ("SUBEADI") 
  ;
--------------------------------------------------------
--  DDL for Trigger BILETTRIG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "BILETTRIG" 
   before insert on "BILETLER" 
   for each row 
begin  
   if inserting then 
      if :NEW."BILETID" is null then 
         select BILETLER_BILETID_SEQ.nextval into :NEW."BILETID" from dual; 
      end if; 
   end if; 
end;

/
ALTER TRIGGER "BILETTRIG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CALISANBOLUMDEGISTIR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CALISANBOLUMDEGISTIR" 
BEFORE UPDATE ON PERSONELLER 
FOR EACH ROW 
BEGIN
 
 dbms_output.put_line('Eski Bölüm:' ||  :OLD.CALISANTIPID ||'Yeni Bölüm: ' || :NEW.CALISANTIPID);
END;
/
ALTER TRIGGER "CALISANBOLUMDEGISTIR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger INSERMUSTERITRIG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "INSERMUSTERITRIG" 
BEFORE INSERT ON MUSTERILER 
FOR EACH ROW 


BEGIN
 
 
 IF :NEW.MUSTERIID is NULL THEN
 SELECT SEQMUSTERI.NEXTVAL INTO :NEW.MUSTERIID FROM DUAL;
 END IF;
 
   :NEW.KAYITTARIH:=SYSDATE;

END;
/
ALTER TRIGGER "INSERMUSTERITRIG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger INSERTBILET
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "INSERTBILET" 
BEFORE INSERT ON BILETLER 
FOR EACH ROW 


BEGIN
 
 
 IF :NEW.BILETID is NULL THEN
 SELECT SEQMUSTERI.NEXTVAL INTO :NEW.MUSTERIID FROM DUAL;
 END IF;
 
   :NEW.KAYITTARIH := SYSDATE;

END;
/
ALTER TRIGGER "INSERTBILET" ENABLE;
--------------------------------------------------------
--  DDL for Trigger INSERTMUSTERITRIG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "INSERTMUSTERITRIG" 
BEFORE INSERT ON MUSTERILER
FOR EACH ROW 


BEGIN
 
 
 IF :NEW.MUSTERIID is NULL THEN
 SELECT SEQMUSTERI.NEXTVAL INTO :NEW.MUSTERIID FROM DUAL;
 END IF;
 
   :NEW.KAYITTARIH := SYSDATE;

END;
/
ALTER TRIGGER "INSERTMUSTERITRIG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SEFERTRIG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SEFERTRIG" 
  BEFORE
    INSERT OR
    UPDATE OF BILETTUTARI, SEFERID OR
    DELETE
  ON SEFERLER
BEGIN
  CASE
    WHEN INSERTING THEN
      DBMS_OUTPUT.PUT_LINE('Ekleniyor.');
    WHEN UPDATING('BILETTUTARI') THEN
      DBMS_OUTPUT.PUT_LINE('Bilet tutarý güncelleniyor.');
    WHEN UPDATING('SEFERID') THEN
      DBMS_OUTPUT.PUT_LINE('SEFERID güncelleniyor.');
    WHEN DELETING THEN
      DBMS_OUTPUT.PUT_LINE('Siliniyor.');
  END CASE;
END;
/
ALTER TRIGGER "SEFERTRIG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger BILETTRIG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "BILETTRIG" 
   before insert on "BILETLER" 
   for each row 
begin  
   if inserting then 
      if :NEW."BILETID" is null then 
         select BILETLER_BILETID_SEQ.nextval into :NEW."BILETID" from dual; 
      end if; 
   end if; 
end;

/
ALTER TRIGGER "BILETTRIG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger INSERTBILET
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "INSERTBILET" 
BEFORE INSERT ON BILETLER 
FOR EACH ROW 


BEGIN
 
 
 IF :NEW.BILETID is NULL THEN
 SELECT SEQMUSTERI.NEXTVAL INTO :NEW.MUSTERIID FROM DUAL;
 END IF;
 
   :NEW.KAYITTARIH := SYSDATE;

END;
/
ALTER TRIGGER "INSERTBILET" ENABLE;
--------------------------------------------------------
--  DDL for Trigger INSERMUSTERITRIG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "INSERMUSTERITRIG" 
BEFORE INSERT ON MUSTERILER 
FOR EACH ROW 


BEGIN
 
 
 IF :NEW.MUSTERIID is NULL THEN
 SELECT SEQMUSTERI.NEXTVAL INTO :NEW.MUSTERIID FROM DUAL;
 END IF;
 
   :NEW.KAYITTARIH:=SYSDATE;

END;
/
ALTER TRIGGER "INSERMUSTERITRIG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger INSERTMUSTERITRIG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "INSERTMUSTERITRIG" 
BEFORE INSERT ON MUSTERILER
FOR EACH ROW 


BEGIN
 
 
 IF :NEW.MUSTERIID is NULL THEN
 SELECT SEQMUSTERI.NEXTVAL INTO :NEW.MUSTERIID FROM DUAL;
 END IF;
 
   :NEW.KAYITTARIH := SYSDATE;

END;
/
ALTER TRIGGER "INSERTMUSTERITRIG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CALISANBOLUMDEGISTIR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "CALISANBOLUMDEGISTIR" 
BEFORE UPDATE ON PERSONELLER 
FOR EACH ROW 
BEGIN
 
 dbms_output.put_line('Eski Bölüm:' ||  :OLD.CALISANTIPID ||'Yeni Bölüm: ' || :NEW.CALISANTIPID);
END;
/
ALTER TRIGGER "CALISANBOLUMDEGISTIR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger SEFERTRIG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SEFERTRIG" 
  BEFORE
    INSERT OR
    UPDATE OF BILETTUTARI, SEFERID OR
    DELETE
  ON SEFERLER
BEGIN
  CASE
    WHEN INSERTING THEN
      DBMS_OUTPUT.PUT_LINE('Ekleniyor.');
    WHEN UPDATING('BILETTUTARI') THEN
      DBMS_OUTPUT.PUT_LINE('Bilet tutarý güncelleniyor.');
    WHEN UPDATING('SEFERID') THEN
      DBMS_OUTPUT.PUT_LINE('SEFERID güncelleniyor.');
    WHEN DELETING THEN
      DBMS_OUTPUT.PUT_LINE('Siliniyor.');
  END CASE;
END;
/
ALTER TRIGGER "SEFERTRIG" ENABLE;
--------------------------------------------------------
--  DDL for Procedure PERSEKLE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "PERSEKLE" 
(
  PPERSONELID IN NUMBER 
, PAD IN NVARCHAR2 
, PSOYAD IN NVARCHAR2 
, PEMAIL IN NVARCHAR2 
, PSUBEID IN NUMBER 
, PEVADRESI IN NVARCHAR2 
, PKULLANICIADI IN NVARCHAR2 
, PCALISANTIPID IN NUMBER 
, PSIFRE IN NVARCHAR2 
) AS 
BEGIN
  INSERT INTO PERSONELLER(PERSONELID,AD,SOYAD,EMAIL,SUBEID,EVADRESI,KULLANICIADI,CALISANTIPID,SIFRE)
    
    values(PPERSONELID,PAD,PSOYAD,PEMAIL,PSUBEID,PEVADRESI,PKULLANICIADI,PCALISANTIPID,PSIFRE);
END PERSEKLE;

/
--------------------------------------------------------
--  DDL for Procedure SEHIREKLE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SEHIREKLE" 
(
  PSEHIRID IN NUMBER 
, PSEHIRAD IN VARCHAR2 
) AS 
BEGIN
  INSERT INTO SEHIRLER(SEHIRID,SEHIRADI)
  VALUES(PSEHIRID,PSEHIRAD);
END SEHIREKLE;

/
--------------------------------------------------------
--  DDL for Function TOPLAMSEFERUCRETI
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "TOPLAMSEFERUCRETI" 
(
  PSEFERID IN NUMBER 
) RETURN NUMBER AS
RETVAL NUMBER;

BEGIN
SELECT SUM(UCRET) INTO RETVAL FROM BILETLER bl WHERE bl.SEFERID=PSEFERID;
  RETURN RETVAL;
END TOPLAMSEFERUCRETI;

/
--------------------------------------------------------
--  Constraints for Table BILETLER
--------------------------------------------------------

  ALTER TABLE "BILETLER" ADD CONSTRAINT "BILETLER_PK" PRIMARY KEY ("BILETID") ENABLE;
  ALTER TABLE "BILETLER" MODIFY ("UCRET" NOT NULL ENABLE);
  ALTER TABLE "BILETLER" MODIFY ("KOLTUKNO" NOT NULL ENABLE);
  ALTER TABLE "BILETLER" MODIFY ("ISLEMZAMANI" NOT NULL ENABLE);
  ALTER TABLE "BILETLER" MODIFY ("SEFERID" NOT NULL ENABLE);
  ALTER TABLE "BILETLER" MODIFY ("MUSTERIID" NOT NULL ENABLE);
  ALTER TABLE "BILETLER" MODIFY ("BILETID" NOT NULL ENABLE);
  ALTER TABLE "BILETLER" MODIFY ("ISLEMYAPANPERSONELID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CALISANTIPLERI
--------------------------------------------------------

  ALTER TABLE "CALISANTIPLERI" ADD CONSTRAINT "CALISANTIPLERI_PK" PRIMARY KEY ("CALISANTIPID") ENABLE;
  ALTER TABLE "CALISANTIPLERI" MODIFY ("CALISANTIPADI" NOT NULL ENABLE);
  ALTER TABLE "CALISANTIPLERI" MODIFY ("CALISANTIPID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MARKALAR
--------------------------------------------------------

  ALTER TABLE "MARKALAR" ADD CONSTRAINT "MARKALAR_PK" PRIMARY KEY ("MARKAID") ENABLE;
  ALTER TABLE "MARKALAR" MODIFY ("MARKAADI" NOT NULL ENABLE);
  ALTER TABLE "MARKALAR" MODIFY ("MARKAID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MASRAFTIPLERI
--------------------------------------------------------

  ALTER TABLE "MASRAFTIPLERI" ADD CONSTRAINT "MASRAFTIPLERI_PK" PRIMARY KEY ("MASRAFTIPID") ENABLE;
  ALTER TABLE "MASRAFTIPLERI" MODIFY ("MASRAFTIPADI" NOT NULL ENABLE);
  ALTER TABLE "MASRAFTIPLERI" MODIFY ("MASRAFTIPID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MUSTERIADRESLERI
--------------------------------------------------------

  ALTER TABLE "MUSTERIADRESLERI" MODIFY ("DIÞKAPI" NOT NULL ENABLE);
  ALTER TABLE "MUSTERIADRESLERI" ADD CONSTRAINT "MUSTERIADRESLERI_PK" PRIMARY KEY ("ADRESID") ENABLE;
  ALTER TABLE "MUSTERIADRESLERI" MODIFY ("SOKAK" NOT NULL ENABLE);
  ALTER TABLE "MUSTERIADRESLERI" MODIFY ("MAHALLE" NOT NULL ENABLE);
  ALTER TABLE "MUSTERIADRESLERI" MODIFY ("SEHIRID" NOT NULL ENABLE);
  ALTER TABLE "MUSTERIADRESLERI" MODIFY ("ILCE" NOT NULL ENABLE);
  ALTER TABLE "MUSTERIADRESLERI" MODIFY ("ADRESID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MUSTERILER
--------------------------------------------------------

  ALTER TABLE "MUSTERILER" ADD CONSTRAINT "MUSTERILER_KARTNUMARASI_UK1" UNIQUE ("KARTNUMARASI") ENABLE;
  ALTER TABLE "MUSTERILER" ADD CONSTRAINT "MUSTERILER_TELEFON_UK1" UNIQUE ("TELEFON") ENABLE;
  ALTER TABLE "MUSTERILER" ADD CONSTRAINT "MUSTERILER_PK" PRIMARY KEY ("MUSTERIID") ENABLE;
  ALTER TABLE "MUSTERILER" MODIFY ("KARTNUMARASI" NOT NULL ENABLE);
  ALTER TABLE "MUSTERILER" MODIFY ("ADRESID" NOT NULL ENABLE);
  ALTER TABLE "MUSTERILER" MODIFY ("DOGUMTARIHI" NOT NULL ENABLE);
  ALTER TABLE "MUSTERILER" MODIFY ("TELEFON" NOT NULL ENABLE);
  ALTER TABLE "MUSTERILER" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "MUSTERILER" MODIFY ("SOYAD" NOT NULL ENABLE);
  ALTER TABLE "MUSTERILER" MODIFY ("AD" NOT NULL ENABLE);
  ALTER TABLE "MUSTERILER" MODIFY ("MUSTERIID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table OTOBUSLER
--------------------------------------------------------

  ALTER TABLE "OTOBUSLER" ADD CONSTRAINT "OTOBUSLER_UK1" UNIQUE ("PLAKA") ENABLE;
  ALTER TABLE "OTOBUSLER" ADD CONSTRAINT "OTOBUSLER_PK" PRIMARY KEY ("OTOBUSID") ENABLE;
  ALTER TABLE "OTOBUSLER" MODIFY ("MARKAID" NOT NULL ENABLE);
  ALTER TABLE "OTOBUSLER" MODIFY ("KOLTUKSAYISI" NOT NULL ENABLE);
  ALTER TABLE "OTOBUSLER" MODIFY ("PLAKA" NOT NULL ENABLE);
  ALTER TABLE "OTOBUSLER" MODIFY ("OTOBUSID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table OTOBUSMASRAFLARI
--------------------------------------------------------

  ALTER TABLE "OTOBUSMASRAFLARI" ADD CONSTRAINT "OTOBUSMASRAFLARI_PK" PRIMARY KEY ("OTOBUSMASRAFID") ENABLE;
  ALTER TABLE "OTOBUSMASRAFLARI" MODIFY ("SEFERID" NOT NULL ENABLE);
  ALTER TABLE "OTOBUSMASRAFLARI" MODIFY ("TUTAR" NOT NULL ENABLE);
  ALTER TABLE "OTOBUSMASRAFLARI" MODIFY ("MASRAFTIPID" NOT NULL ENABLE);
  ALTER TABLE "OTOBUSMASRAFLARI" MODIFY ("OTOBUSID" NOT NULL ENABLE);
  ALTER TABLE "OTOBUSMASRAFLARI" MODIFY ("OTOBUSMASRAFID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PERSONELISLEMLERI
--------------------------------------------------------

  ALTER TABLE "PERSONELISLEMLERI" ADD CONSTRAINT "PERSONELGIRISCIKIS_PK" PRIMARY KEY ("PERSONELISLEMID") ENABLE;
  ALTER TABLE "PERSONELISLEMLERI" MODIFY ("ISLEMZAMANI" NOT NULL ENABLE);
  ALTER TABLE "PERSONELISLEMLERI" MODIFY ("PERSONELID" NOT NULL ENABLE);
  ALTER TABLE "PERSONELISLEMLERI" MODIFY ("PERSONELISLEMID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PERSONELLER
--------------------------------------------------------

  ALTER TABLE "PERSONELLER" ADD CONSTRAINT "PERSONELLER_UK1" UNIQUE ("KULLANICIADI") ENABLE;
  ALTER TABLE "PERSONELLER" ADD CONSTRAINT "PERSONELLER_EMAIL_UK1" UNIQUE ("EMAIL") ENABLE;
  ALTER TABLE "PERSONELLER" ADD CONSTRAINT "PERSONELLER_PK" PRIMARY KEY ("PERSONELID") ENABLE;
  ALTER TABLE "PERSONELLER" MODIFY ("SIFRE" NOT NULL ENABLE);
  ALTER TABLE "PERSONELLER" MODIFY ("CALISANTIPID" NOT NULL ENABLE);
  ALTER TABLE "PERSONELLER" MODIFY ("KULLANICIADI" NOT NULL ENABLE);
  ALTER TABLE "PERSONELLER" MODIFY ("EVADRESI" NOT NULL ENABLE);
  ALTER TABLE "PERSONELLER" MODIFY ("SUBEID" NOT NULL ENABLE);
  ALTER TABLE "PERSONELLER" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "PERSONELLER" MODIFY ("SOYAD" NOT NULL ENABLE);
  ALTER TABLE "PERSONELLER" MODIFY ("AD" NOT NULL ENABLE);
  ALTER TABLE "PERSONELLER" MODIFY ("PERSONELID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SEFERLER
--------------------------------------------------------

  ALTER TABLE "SEFERLER" ADD CONSTRAINT "SEFERLER_PK" PRIMARY KEY ("SEFERID") ENABLE;
  ALTER TABLE "SEFERLER" MODIFY ("BILETTUTARI" NOT NULL ENABLE);
  ALTER TABLE "SEFERLER" MODIFY ("TAHMINISURE" NOT NULL ENABLE);
  ALTER TABLE "SEFERLER" MODIFY ("VARISZAMANI" NOT NULL ENABLE);
  ALTER TABLE "SEFERLER" MODIFY ("KALKISZAMANI" NOT NULL ENABLE);
  ALTER TABLE "SEFERLER" MODIFY ("MUAVINID" NOT NULL ENABLE);
  ALTER TABLE "SEFERLER" MODIFY ("SOFORID" NOT NULL ENABLE);
  ALTER TABLE "SEFERLER" MODIFY ("OTOBUSID" NOT NULL ENABLE);
  ALTER TABLE "SEFERLER" MODIFY ("VARISSEHIRID" NOT NULL ENABLE);
  ALTER TABLE "SEFERLER" MODIFY ("KALKISSEHIRID" NOT NULL ENABLE);
  ALTER TABLE "SEFERLER" MODIFY ("SEFERID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SEHIRLER
--------------------------------------------------------

  ALTER TABLE "SEHIRLER" ADD CONSTRAINT "SEHIRLER_PK" PRIMARY KEY ("SEHIRID") ENABLE;
  ALTER TABLE "SEHIRLER" MODIFY ("SEHIRADI" NOT NULL ENABLE);
  ALTER TABLE "SEHIRLER" MODIFY ("SEHIRID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SUBELER
--------------------------------------------------------

  ALTER TABLE "SUBELER" ADD CONSTRAINT "SUBELER_SUBEADI_UK1" UNIQUE ("SUBEADI") ENABLE;
  ALTER TABLE "SUBELER" ADD CONSTRAINT "SUBELER_PK" PRIMARY KEY ("SUBEID") ENABLE;
  ALTER TABLE "SUBELER" MODIFY ("SUBEADI" NOT NULL ENABLE);
  ALTER TABLE "SUBELER" MODIFY ("SEHÝRID" NOT NULL ENABLE);
  ALTER TABLE "SUBELER" MODIFY ("SUBEID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table BILETLER
--------------------------------------------------------

  ALTER TABLE "BILETLER" ADD CONSTRAINT "BILETLER_FK1" FOREIGN KEY ("SEFERID")
	  REFERENCES "SEFERLER" ("SEFERID") ON DELETE SET NULL ENABLE;
  ALTER TABLE "BILETLER" ADD CONSTRAINT "BILETLER_MUSTERI_FK1" FOREIGN KEY ("MUSTERIID")
	  REFERENCES "MUSTERILER" ("MUSTERIID") ON DELETE SET NULL ENABLE;
  ALTER TABLE "BILETLER" ADD CONSTRAINT "BILETLER_PERSONEL_FK1" FOREIGN KEY ("ISLEMYAPANPERSONELID")
	  REFERENCES "PERSONELLER" ("PERSONELID") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MUSTERIADRESLERI
--------------------------------------------------------

  ALTER TABLE "MUSTERIADRESLERI" ADD CONSTRAINT "MUSTERIADRESLERI_FK1" FOREIGN KEY ("SEHIRID")
	  REFERENCES "SEHIRLER" ("SEHIRID") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MUSTERILER
--------------------------------------------------------

  ALTER TABLE "MUSTERILER" ADD CONSTRAINT "MUSTERILER_ADRES_FK1" FOREIGN KEY ("ADRESID")
	  REFERENCES "MUSTERIADRESLERI" ("ADRESID") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table OTOBUSLER
--------------------------------------------------------

  ALTER TABLE "OTOBUSLER" ADD CONSTRAINT "OTOBUSLER_MARKAID_FK1" FOREIGN KEY ("MARKAID")
	  REFERENCES "MARKALAR" ("MARKAID") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table OTOBUSMASRAFLARI
--------------------------------------------------------

  ALTER TABLE "OTOBUSMASRAFLARI" ADD CONSTRAINT "OTOBUSMASRAFLARI_MASRAFTIP_FK1" FOREIGN KEY ("MASRAFTIPID")
	  REFERENCES "MASRAFTIPLERI" ("MASRAFTIPID") ON DELETE SET NULL ENABLE;
  ALTER TABLE "OTOBUSMASRAFLARI" ADD CONSTRAINT "OTOBUSMASRAFLARI_OTOBUSID_FK1" FOREIGN KEY ("OTOBUSID")
	  REFERENCES "OTOBUSLER" ("OTOBUSID") ON DELETE SET NULL ENABLE;
  ALTER TABLE "OTOBUSMASRAFLARI" ADD CONSTRAINT "OTOBUSMASRAFLARI_SEFERID_FK1" FOREIGN KEY ("SEFERID")
	  REFERENCES "SEFERLER" ("SEFERID") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PERSONELISLEMLERI
--------------------------------------------------------

  ALTER TABLE "PERSONELISLEMLERI" ADD CONSTRAINT "PERSONELGIRISCIKIS_PERS_FK1" FOREIGN KEY ("PERSONELID")
	  REFERENCES "PERSONELLER" ("PERSONELID") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PERSONELLER
--------------------------------------------------------

  ALTER TABLE "PERSONELLER" ADD CONSTRAINT "PERSONELLER_SUBELER_FK1" FOREIGN KEY ("SUBEID")
	  REFERENCES "SUBELER" ("SUBEID") ON DELETE SET NULL ENABLE;
  ALTER TABLE "PERSONELLER" ADD CONSTRAINT "PERSONELLER_TIP_FK1" FOREIGN KEY ("CALISANTIPID")
	  REFERENCES "CALISANTIPLERI" ("CALISANTIPID") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SEFERLER
--------------------------------------------------------

  ALTER TABLE "SEFERLER" ADD CONSTRAINT "SEFERLER_FK1" FOREIGN KEY ("MUAVINID")
	  REFERENCES "PERSONELLER" ("PERSONELID") ON DELETE SET NULL ENABLE;
  ALTER TABLE "SEFERLER" ADD CONSTRAINT "SEFERLER_KALKISID_FK1" FOREIGN KEY ("KALKISSEHIRID")
	  REFERENCES "SEHIRLER" ("SEHIRID") ON DELETE SET NULL ENABLE;
  ALTER TABLE "SEFERLER" ADD CONSTRAINT "SEFERLER_OTOBUSID_FK1" FOREIGN KEY ("OTOBUSID")
	  REFERENCES "OTOBUSLER" ("OTOBUSID") ON DELETE SET NULL ENABLE;
  ALTER TABLE "SEFERLER" ADD CONSTRAINT "SEFERLER_SOFOR_FK1" FOREIGN KEY ("SOFORID")
	  REFERENCES "PERSONELLER" ("PERSONELID") ENABLE;
  ALTER TABLE "SEFERLER" ADD CONSTRAINT "SEFERLER_VARISID_FK1" FOREIGN KEY ("VARISSEHIRID")
	  REFERENCES "SEHIRLER" ("SEHIRID") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SUBELER
--------------------------------------------------------

  ALTER TABLE "SUBELER" ADD CONSTRAINT "SUBELER_SEHIRLER_FK1" FOREIGN KEY ("SEHÝRID")
	  REFERENCES "SEHIRLER" ("SEHIRID") ON DELETE SET NULL ENABLE;
