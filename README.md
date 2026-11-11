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

\- Ett uppdrag kopplar ihop en kund med en konsult, så mellan kunder och konsulter finns i grunden en M:M-relation. Den löses upp med kopplingstabellen Assignments.



Specialiteten är konsultens \*huvudsakliga\* specialitet och lagras därför som en kolumn i Consultants.S

