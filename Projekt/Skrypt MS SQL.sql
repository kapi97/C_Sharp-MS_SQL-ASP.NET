/*
Wypożyczalnia oraz sklep internetowy z filmami. Możliwość wypożyczenia filmu na pewien okres czasu lub jej kupna, rejestracja użytkownika, 
szukanie filmu po nazwie, gatunku, średniej ocenie, cenie, dostępności itd.
Primary Key będzie zawarty w ID każdej tabeli.

Tabele:
Baza_filmów:
•	ID_film
•	Tytul_filmu
•	Gatunek
•	Średnia_ocena --???
•	Cena_kupna
•	Cena_wypozyczenia

Użytkownicy:
•	ID_uzytkownika
•	Imie_nazwisko
•	Email
•	Telefon
•	Adres

Zamówienia:
•	ID_zamowienia
•	Zamowiony_produkt
•	ID_klient --zamiast tego poniżej
-----------------
•	Imie_nazwisko
•	Adres
•	Email
•	Telefon
-----------------
 
Wypożyczenia:
•	ID_wypozyczenia
•	Wypozyczony_produkt
•	Okres_wypozyczenia
•	ID_klient
*/

create table filmy(
id_film int not null identity, --LUB identity(1,1)
tytul varchar(50),
gatunek varchar(20),
rok int,
cena_kupna float,
cena_wypozyczenia float,

constraint PK_film primary key(id_film),
/*
id_klient int,
constraint FK_klient
foreign key (id_klient) 
references filmy(id_film)
*/
--LUB
--???
constraint FK_film --FK_klient
foreign key (id_film) 
references filmy(id_film)

)

create table klienci(
id_klient int not null identity,
imie varchar(20),
nazwisko varchar(30),
adres varchar(50),
miasto varchar(20),
email varchar(30),
telefon varchar(20),

constraint PK_klient primary key(id_klient),
/*
id_film int,
constraint FK_film
foreign key (id_film) 
references klienci(id_klient)
*/
--LUB
--???
constraint FK_klient --FK_film
foreign key (id_klient) 
references klienci(id_klient)
)

create table zamowienia(
id_zamowienie int not null identity,
zamowiony_film int,
id_klient int,

constraint PK_zamowienie primary key(id_zamowienie),
/*
constraint FK_zamowienie
foreign key (id_klient) --LUB foreign key (zamowiony_film)
--references filmy(id_film)
references klienci(id_klient)
*/
constraint FK_z_klient
foreign key (id_klient) --LUB foreign key (zamowiony_film)
--references filmy(id_film)
references klienci(id_klient),

constraint FK_z_film
foreign key (zamowiony_film) --LUB foreign key (zamowiony_film)
--references filmy(id_film)
references filmy(id_film)
)

create table wypozyczenia(
id_wypozyczenie int not null identity,
wypozyczony_film int,
okres_wypozyczenia varchar(10),
id_klient int,

constraint PK_wypozyczenie primary key(id_wypozyczenie),
/*
constraint FK_wypozyczenie
foreign key (id_klient) --LUB foreign key (wypozyczony_film)
--references filmy(id_film)
references klienci(id_klient)
*/
constraint FK_w_klient
foreign key (id_klient) --LUB foreign key (wypozyczony_film)
--references filmy(id_film)
references klienci(id_klient),

constraint FK_w_film
foreign key (wypozyczony_film) --LUB foreign key (wypozyczony_film)
--references filmy(id_film)
references filmy(id_film)
)

SET IDENTITY_INSERT filmy ON
insert into filmy (id_film, tytul, gatunek, rok, cena_kupna, cena_wypozyczenia) values (1, 'Toy Story', 'Animowany', '1995', 20, 0)--zamiast null miały być wartości liczbowe, np. 0 lub 10
insert into filmy (id_film, tytul, gatunek, rok, cena_kupna, cena_wypozyczenia) values (2, 'Toy Story 2', 'Animowany', '1999', 0, 14)--ale nie wychodziły mi osobne zapytania ZAMÓWIENIE i WYPOŻYCZENIE
insert into filmy (id_film, tytul, gatunek, rok, cena_kupna, cena_wypozyczenia) values (3, 'Toy Story 3', 'Animowany', '2010', 30, 0)
insert into filmy (id_film, tytul, gatunek, rok, cena_kupna, cena_wypozyczenia) values (4, 'Toy Story 4', 'Animowany', '2019', 0, 15)
SET IDENTITY_INSERT filmy OFF

SET IDENTITY_INSERT klienci ON
insert into klienci (id_klient, imie, nazwisko, adres, miasto, email, telefon) values (1, 'Jan', 'Nowak', 'Krakowska 1', 'Kraków', 'jannowak@mail.com', '555666777')
insert into klienci (id_klient, imie, nazwisko, adres, miasto, email, telefon) values (2, 'Adam', 'Kowalski', 'Warszawska 2', 'Warszawa', 'adkow@mail.com', '555666778')
insert into klienci (id_klient, imie, nazwisko, adres, miasto, email, telefon) values (3, 'Maciej', 'Adamczyk', 'Katowicka 3', 'Katowice', 'macada@mail.com', '555666779')
insert into klienci (id_klient, imie, nazwisko, adres, miasto, email, telefon) values (4, 'Karol', 'Baran', 'Lubelska 4', 'Lublin', 'karobar@mail.com', '555666780')
SET IDENTITY_INSERT klienci OFF

SET IDENTITY_INSERT zamowienia ON												  --Osoby, które tylko zamówiły:
insert into zamowienia (id_zamowienie, zamowiony_film, id_klient) values (1, 2, 3)--nie powinno się wykonywać --albo wpisac null
insert into zamowienia (id_zamowienie, zamowiony_film, id_klient) values (2, 3, 1)--Toy Story 3 -> Jan Nowak
insert into zamowienia (id_zamowienie, zamowiony_film, id_klient) values (3, 1, 2)--Toy Story   -> Adam Kowalski
insert into zamowienia (id_zamowienie, zamowiony_film, id_klient) values (4, 4, 4)--nie powinno się wykonywać
SET IDENTITY_INSERT zamowienia OFF

SET IDENTITY_INSERT wypozyczenia ON																						  --Osoby, które tylko wypożyczyły:
insert into wypozyczenia (id_wypozyczenie, wypozyczony_film, okres_wypozyczenia, id_klient) values (1, 1, '01.01.2019', 1)--nie powinno się wykonywać, najlepiej chyba wykomentować
insert into wypozyczenia (id_wypozyczenie, wypozyczony_film, okres_wypozyczenia, id_klient) values (2, 3, '01.02.2019', 2)--nie powinno się wykonywać
insert into wypozyczenia (id_wypozyczenie, wypozyczony_film, okres_wypozyczenia, id_klient) values (3, 2, '01.03.2019', 3)--Toy Story 2 -> Maciej Adamczyk
insert into wypozyczenia (id_wypozyczenie, wypozyczony_film, okres_wypozyczenia, id_klient) values (4, 4, '01.04.2019', 4)--Toy Story 4 -> Karol Baran
SET IDENTITY_INSERT wypozyczenia OFF

--zrobic tak by id_film i id_klient nie byly null
--lub osobno tabele film_zam i film_wyp

--zapytanie kontrolne
select tytul as Tytuł, YEAR (rok) as Rok, imie as Imię, nazwisko as Nazwisko from filmy
join zamowienia on
zamowienia.zamowiony_film=filmy.id_film
join klienci on
klienci.id_klient=zamowienia.id_klient
order by tytul
--zapytanie kontrolne
select tytul as Tytuł, gatunek as Gatunek, YEAR (rok) as Rok, filmy.cena_kupna as [Cena kupna], filmy.cena_wypozyczenia as [Cena wypożyczenia],
imie as Imię, nazwisko as Nazwisko, adres as Adres, email as [E-mail], telefon as Telefon from filmy

join zamowienia on
zamowienia.zamowiony_film=filmy.id_film

join wypozyczenia on
wypozyczenia.wypozyczony_film=filmy.id_film

join klienci on
klienci.id_klient=zamowienia.id_klient
order by tytul
--

--ZAMÓWIENIE
select tytul as Tytuł, gatunek as Gatunek, YEAR (rok) as Rok, filmy.cena_kupna as [Cena kupna],
imie as Imię, nazwisko as Nazwisko, adres as Adres, email as [E-mail], telefon as Telefon from filmy

join zamowienia on
zamowienia.zamowiony_film=filmy.id_film

join klienci on
klienci.id_klient=zamowienia.id_klient
where filmy.cena_kupna is not null --lub != 0
order by tytul
--

--WYPOŻYCZENIE
select tytul as Tytuł, gatunek as Gatunek, YEAR (rok) as Rok, filmy.cena_wypozyczenia as [Cena wypożyczenia],
okres_wypozyczenia as [Okres wypożyczenia], imie as Imię, nazwisko as Nazwisko, adres as Adres, email as [E-mail], telefon as Telefon from filmy

join wypozyczenia on
wypozyczenia.wypozyczony_film=filmy.id_film

join klienci on
klienci.id_klient=wypozyczenia.id_klient
where filmy.cena_wypozyczenia is not null --lub != 0
order by tytul


--
--Create Procedure [dbo].[sp_UpdateEmployee](@LastName nvarchar(20),@FirstName nvarchar(10),@Address nvarchar(60),@City nvarchar(15),@ID int)
--Druga "tabela" do prawidłowego działania EditEmployee.aspx - sp_UpdateEmployee 
Create Procedure [dbo].[sp_UpdateEmployee](@LastName nvarchar(20),@FirstName nvarchar(10),@Address nvarchar(60),@City nvarchar(15),@ID int)

as
UPDATE [dbo].[Employees]
   SET [LastName] = @LastName,
       [FirstName] = @FirstName,
       [Address] = @Address,
       [City] = @City
    
 WHERE [EmployeeID] = @id
GO

Create Procedure [dbo].[sp_UpdateFilmy](@tytul nvarchar(50),@gatunek nvarchar(20),@rok int,@cena_kupna float,@cena_wypozyczenia float,@id_film int)

as
UPDATE [dbo].[filmy]
   SET [tytul] = @tytul,
       [gatunek] = @gatunek,
       [rok] = @rok,
       [cena_kupna] = @cena_kupna,
	   [cena_wypozyczenia] = @cena_wypozyczenia
    
 WHERE [id_film] = @id_film
 
 GO
 Create Procedure [dbo].[sp_UpdateKlienci](@imie nvarchar(20),@nazwisko nvarchar(30),@adres nvarchar(50),@miasto nvarchar(20),@email nvarchar(30),@telefon nvarchar(20),@id_klient int)

as
UPDATE [dbo].[klienci]
   SET [imie] = @imie,
       [nazwisko] = @nazwisko,
       [adres] = @adres,
       [miasto] = @miasto,
	   [email] = @email,
	   [telefon] = @telefon
    
 WHERE [id_klient] = @id_klient
 GO
 
 Create Procedure [dbo].[sp_UpdateZamowienia](@id_klient int,@zamowiony_film int,@id_zamowienie int)

as
UPDATE [dbo].[zamowienia]
   SET [id_klient] = @id_klient,
       [zamowiony_film] = @zamowiony_film
    
 WHERE [id_zamowienie] = @id_zamowienie
 GO
 
  Create Procedure [dbo].[sp_UpdateWypozyczenia](@id_klient int,@wypozyczony_film int,@id_wypozyczenie int,@okres_wypozyczenia nvarchar(10))

as
UPDATE [dbo].[wypozyczenia]
   SET [id_klient] = @id_klient,
       [wypozyczony_film] = @wypozyczony_film,
	   [okres_wypozyczenia] = @okres_wypozyczenia
    
 WHERE [id_wypozyczenie] = @id_wypozyczenie
 
GO