# Hibák és Hibaüzenetek

## Hibaüzenetek

Tisztázásként egyszerűbb az üzenetekkel kezdeni, ugyanis nem minden hibához tartozik hibaüzenet! Illetve egyes rosszabbik esetekben szerver nem ad ki hibát, de küld ki hiba üzenetet. Mindegyik esetben érdemes megvizsgálni, létezik-e hiba üzenet, ugyanis annak tartalma sokat segíthet nekünk és a felhasználónak is. Éppen e miatt helyes megoldás a kapott üzenet kijelzése a felhasználó számára.

## Hibák

A hibákat a rendszer fix "hibakódokkal" jelzi a kliens számára. Az alábbi hozzárendeléseket tehetjük a kódok és tartalmuk között:

 - 0 : Nincs hiba. A rendszer működése során nem volt hiba.
 - 1 : Felhasználó nem található. A rendszer nem találja a kért felhasználót. Ez nem azt jelenti, hogy a felhasználó név hibás lenne, hanem a felhasználónév VAGY a jelszó nem megfelelő!
 - 2 : Jelszó túl régi. A rendszergazda beállíthatja, hogy bizonyos idő után új jelszót legyen szükséges beállítani, vagy ha kiderült egy felhasználóról, hogy a jelszava nem megfelelő már (például változtak a jelszó erősségére vonatkozó kritériumok), akkor a rendszer ezt a hiba üzenetet adja vissza, ami után a felhasználónak fel kell ajánlani az új jelszó beállításának lehetőségét!
 - 3 : Nem lekezeld hiba. A szerveren olyan hiba történt, amit nem tudott, vagy nem akart lekezelni. Ekkor ajánlott a lekérdezés tartalmát ellenőrizni, nem valami kártékony kifejezés került-e bele, ami miatt nem megfelelően futhat a szerver oldali program. Ha kapunk vissza adatot, ezeknek ismeretében kezelheti a kliens a hibát, ám az nem ajánlott, és implementációk nagy részében nem is lehetséges.
 - 4 : Időtúllépés. A kért végponton a kért művelet túl lépte a megengedett időkorlátot. Ezen úgy lehet segíteni, hogy kevesebb értéket kérünk le a `TotalRowCount` érték beállításával.
 - 5 : Fejlesztő által generált. ~~Easteregg :)~~ Vagy Debug üzenetbe futottunk, ami véletlen bent maradt, vagy olyan dolgot csináltunk, amit nem szabad. Minden esetre, ilyen üzenettel nem kéne találkozni.
 - 6 : A szerver tele van. Az adott szerver, amire szeretnénk bejelentkezni, vagy esetleg használni, sajnos tele van.
 - 7 : A szolgáltatás nem található. Ebben az esetben az a fajta szolgáltatás vagy le van tiltva, vagy pedig egyáltalán nem létezik ilyen szolgáltatás, csak a szerver reagál a végpontra.
 - 8 : Túl magas verziószám. A kliensünknek túl magas a verziószáma ahhoz, hogy a szerverrel kommunikáljon. Vagy a szervert kell frissíteni, vagy pedig kompatibilis módban kell futtatni a klienst.
 - 9 : Túl alacsony a verziószám. A szerver már nem fogad el ilyen alacsony verziószámú klienseket. Tehát vagy frissíteni kell az alkalmazást, vagy egy kompatibilitási proxy-t beállítani, ami át konvertálja a kliensünk lekérdezéseit.
 - 10 : Nincsen kapcsolat. Sajnos a szerver nem tudja elérni a hálózatot, egyáltalán honnan szerezted ezt a hibát? >:O
 - 11 : GDPR. Ez a hiba jelzi, hogy a felhasználó nem fogadta el a GDPR nyilatkozatot. Ekkor az [alábbiakat lehet tenni.](./login.md#fontos-megjegyzés)

## Fontos megjegyzés

A szervernek a klienstől kapott hibaüzeneteket **FIGYELMEN KÍVÜL KELL HAGYNIA!** Ha ez nem így történne, és valamilyen oknál fogva visszaküldené a hibát, lehetséges, hogy a kliens és a szerver egyfajta végtelen játszmába keveredne, ahol egymásnak passzolják a hibákat, erőforrásokat emésztve fel, a rendszergazda és felhasználók számára semmilyen hasznos dolgot nem művel. Ennek elkerülése érdekében a kliensnek NEM KÉNE küldenie ilyen üzeneteket, a szervertől kapott hibát visszaküldenie, a szervernek pedig NEM SZABAD a klienstől kapott hibákat értelmeznie, feldolgoznia, visszaküldenie.
