\# FailSafe IT – databasdesign



Inlämningsuppgift 1 i kursen Databashantering SQL (Systemutvecklare DevSecOps).



FailSafe IT är ett konsultbolag som hittills har hanterat kunder, konsulter och uppdrag i Excel-filer. Uppgiften är att strukturera upp datan i en relationsdatabas i tredje normalformen (3NF) i Microsoft SQL Server och visa att strukturen fungerar med SQL-frågor.



\## 1. Kravanalys



Verksamhetens tre krav ger tre entiteter:



| Entitet | Attribut som ska lagras |

|---|---|

| Kund (Customers) | organisationsnummer, företagsnamn, e-post, telefonnummer |

| Konsult (Consultants) | personnummer, namn, timpris, huvudsaklig specialitet |

| Uppdrag (Assignments) | startdatum, slutdatum, rollbeskrivning, vilken kund och vilken konsult |



Relationer:



\- En kund kan ha många uppdrag (1:M).

\- En konsult kan ha många uppdrag (1:M).

\- Ett uppdrag kopplar ihop en kund med en konsult. Därför behövs tabellen Assignments i mitten.



Specialiteten är konsultens \*huvudsakliga\* specialitet och lagras därför som en kolumn i Consultants.



\## 2. ER-diagram



Jag har ritat ER-diagrammet i Lucidchart. Bilden ligger i repot: `er-diagram.png`.



!\[ER-diagram](er-diagram.png)



Det finns tre tabeller: Customers, Consultants och Assignments. En kund kan ha flera uppdrag, och en konsult kan ha flera uppdrag. Därför finns Assignments i mitten och kopplar ihop dem.



\## 3. Normalisering



\*\*1NF:\*\* Varje kolumn innehåller ett enda värde per rad, och varje tabell har en primärnyckel (Id). Det finns inga listor eller upprepade kolumner.



\*\*2NF:\*\* Alla tabeller har en enkel primärnyckel, så ingen kolumn kan bero på bara en del av nyckeln. Därför har Assignments ett eget Id i stället för en sammansatt nyckel.



\*\*3NF:\*\* Kolumnerna beskriver bara sin egen tabell. Kundens uppgifter finns bara i Customers och konsultens uppgifter bara i Consultants. Assignments har bara kund-id och konsult-id, inte namn eller timpris. Då ändrar man varje uppgift på ett enda ställe.

