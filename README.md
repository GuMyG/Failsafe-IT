\# FailSafe IT



Inlämningsuppgift 1, Databashantering SQL.



\## ER-diagram



!\[ER-diagram](er-diagram.png)



\## Normalisering



\- \*\*1NF:\*\* Ett värde per kolumn och en primärnyckel (Id) i varje tabell.

\- \*\*2NF:\*\* Alla tabeller har en enkel primärnyckel, så inget beror på bara en del av nyckeln.

\- \*\*3NF:\*\* Varje tabell beskriver bara sig själv. Kund- och konsultuppgifter finns bara i sina egna tabeller, och Assignments har bara id:n.



\## DevSecOps



\- \*\*Sec:\*\* Parametriserade frågor (SqlParameter), så att inmatning behandlas som data och inte som SQL. Applikationens databasanvändare får minsta möjliga behörighet.

\- \*\*Ops:\*\* UNIQUE på OrganizationNumber skapar ett index, så sökningen blir en Index Seek i stället för en Table Scan.



\## Köra skriptet



Anslut till `(localdb)\\mssqllocaldb` i SSMS, öppna `FailSafeIT.sql` och tryck F5.n eller timpris. Då ändrar man varje uppgift på ett enda ställe.

