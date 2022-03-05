# Belépés

A belépéshez egy endpoint tartozik csupán, amit az alábbi módon lehet elérni.

## Request

```http
GET <szerver>/GetTrainings
```

body:

```json
{
    "UserLogin":"Felhasználónév",
    "Password":"Jelszó",
    "OnlyLogin: true
}
```

- UserLogin: A szerveren található felhasználó felhasználóneve
- Password: A felhasználóhoz tartozó jelszó
- OnlyLogin: A felhasználó csak bejelentkezést akar végrehajtani? Azaz, ha ez true-ra van állítva, a felhasználó csak bejelentkezik, és semmi mást nem tehet ez után. Vagyis, teszteljük, hogy be tudunk-e lépni, esetleg tele van-e a szerver.

## Response

```http
Status: 200 OK
```

body:

```json
{
    
}
