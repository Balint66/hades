# Belépés

A belépéshez egy endpoint tartozik csupán, amit az alábbi módon lehet elérni.

## Request

```http
POST <szerver>/GetTrainings
```

body:

```json
{
    "UserLogin":"Felhasználónév",
    "Password":"Jelszó",
    "OnlyLogin": true
}
```

- `UserLogin`: A szerveren található felhasználó felhasználóneve
- `Password`: A felhasználóhoz tartozó jelszó
- `OnlyLogin`: A felhasználó csak bejelentkezést akar végrehajtani? Azaz, ha ez true-ra van állítva, a felhasználó csak bejelentkezik, és semmi mást nem tehet ez után. Vagyis, teszteljük, hogy be tudunk-e lépni, esetleg tele van-e a szerver.

## Response

```http
Status: 200 OK
```

body:

```json
{
    "TrainingList":{
        "Code": "IFOBNH12",
        "Description": "Ipari termék- és formatervező mernök (Bsc) - alapképzés (BA/BSc/BProf)[Nappali]",
        "Id": 10
    }
}
```

- `TrainingList`: A felhasználó képzési listája. Lehetséges, hogy a felhasználó egyszerre több képzésben részt vesz, vagy 10 évvel ez előtt egy képzésben részt vett, majd most egy másikat kezdett el az adott intézményben. E miatt több képzés is megjelenhet.
- `Code`: A képzés kódja. Ez a képzés nevéből, szintjéből, fajtájából, illetve 3 egyedi karakterből áll.
- `Description`: A képzés teljes megnevezése.
- `Id`: A képzés azonosítója. Ebben az implementációban a képzések statikusak, így ez az azonosító több felhasználóhoz is rendelhető, azonban egyes rendszerek ezt használhatják egy "összetett kulcsként" a felhasználó ÉS annak képzésének, így akár ez változhat(na) egyénenként is.

Ezek után a lekérdezésekben az `Id`-t használjuk `StudentTrainingID`-ként, ezzel a felhasználó egyértelműen azonosíthatóvá válik.

## Fontos megjegyzés

Mivel minden jogi helyzetre is fel kell készülni, így a GDPR sem maradhat ki a képből. Valós implementáció esetén tesztelni kell, hogy a felhasználó elfogadta-e a szerződési feltételeket, és ha nem, akkor a kliens oldalra visszaküldeni egy hibát, és hogy jelezze ki, el kell fogadni, különben nem használhatja a rendszert. Ezeknek az endpoint-oknak a neve például lehet `GetGDPRInfo` illetve `SetGDPRAcceptence` ahol az utóbbi bekéri, hogy a felhasználó elfogadta a feltételeket (`Accepted`), illetve a feltételekhez tartozó azonosítót (`GDPRStatementID`).
