# Üzenetek

Az üzenetekhez egy endpoint tartozik csupán, amit az alábbi módon lehet elérni.

## Request

```http
POST <szerver>/GetMessages
```

body:

```json
{
    "UserLogin":"Felhasználónév",
    "Password":"Jelszó"
}
```

- `UserLogin`: A szerveren található felhasználó felhasználóneve
- `Password`: A felhasználóhoz tartozó jelszó

## Response

```http
Status: 200 OK
```

body:

```json
{
    "MessageList": [
        {
            "Details": "Kedves Hallgatók\nA mai naptól kezdve egy egész héten át (vagyis a társgfelvételi időszak maradékában) felvehetőek a szabadon választható tárgyak. Elnézésüket kárjük, hogy egy rendszer hiba miatt a rendszer sajnos nem jelezteki az eddigi társgakat!\n\nÜdvözlettel: Ilona",
            "Id": 1,
            "IsNew": true,
            "Name": "Illan Ilona",
            "UserCode": "ILLON",
            "PersonMessageId": 1,
            "SendDate": "/Date(0)/",
            "Subject": "Szabadon választható tárgyak."
        }
    ],
    "NewMessagesNumber": 1,
    "RequireToReadMessagesList": []
}
```

- `NewMessagesNumber`: A felhasználóhoz tartozó, eddig olvasatlan üzenetek száma. Erre nem vonatkozik az, hogy az üzenetet kötelező-e elolvasni, avagy sem.
- `RequireToReadMessagesList`: A kötelezően elolvasandó üzenetek. Ezt a kliensnek belépésenként meg kell jelenítenie, és addig nem engedheti tovább a felhasználót, amíg el nem olvasta! Pontosabban, ez lenne az ajánlott implementáció. Ennek tagjai a következő pontban lesznek tárgyalva.
- `MessageList`: Az üzenetek listája. Minden egyes elem egy üzenetet reprezentál.
  - `Details`: Az üzenet tartalma. Tartalmazhat egyszerű szöveget, vagy HTML formátumú üzeneteket.
  - `Id`: Az adatbázisban használt kulcs érték.
  - `IsNew`: Jelzi, hogy olvasatlan-e az üzenet.
  - `Name`: A küldő teljes neve, vagy előre beállított beceneve.
  - `UserCode`: Ember által is könnyen megjegyezhető felhasználói azonosító. Általában megegyezik a felhasználónévvel.
  - `PersonMessageId`: A felhasználóhoz tartozó üzenet hozzárendelés kulcs értéke. Megegyezhet a fentebb említett `Id`-val, implementációtól függően.
  - `SendDate`: Az elküldés ideje. [Formátuma jól ismert.](#az-idő-formázása-és-értelmezés)

Ezek után a lekérdezésekben az `Id`-t használjuk `StudentTrainingID`-ként, ezzel a felhasználó egyértelműen azonosíthatóvá válik.

## Fontos megjegyzés

### Az üzenet tartalma

Az üzenet lekérdezéshez NEM szükséges a `StudentTrainingID` mivel nem a képzéshez csatoljuk az üzeneteket, hanem a felhasználófiókhoz! Így ideális esetben nem kell elküldeni ezt az adatot, vagy esetleg más haszontalan adatokat.

### Az idő formázása és értelmezés

A rendszer ASP.NET által hasznosított formátumot használja, ugyanis JSON-ban nincsen szabványos leírási módja egy dátumnak, vagy idő intervallumnak. A formázást így kell értelmezni: `/Date(<epoch óta eltelt miliszekundumok száma>)/`. Innentől minden bárhol ahol idő fordul elő a dokumentációban, így kell értelmezni.
