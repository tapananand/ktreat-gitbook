# JSON Web Tokens

Can be used to identify users - like session Management.

Has three parts: `xxxxx.yyyyy.zzzzz`

```
    xxxxx = base64Encoded Header
    yyyyy = base64Encoded Data
    zzzzz = Hash of xxxxx.yyyyy with a secret string used to sign this hash
```

For example, 

```
        eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.XbPfbIHMI6arZ3Y922BhjWgQzWXcXNrz0ogtVhfEd2o
```

The above has:
```json
    Header = {
        "alg": "HS256",
        "typ": "JWT"
    }

    Data = {
        "sub": "1234567890",
        "name": "John Doe",
        "iat": 1516239022
    }

    Signature = HMACSHA256(
        base64UrlEncode(header) + "." +
        base64UrlEncode(payload),
        secret) 
```

The algorithm specified in the Header is used for the Signature part.
Signature makes sure that data hasn't been modified.

Really useful debugging tool at: https://jwt.io/#debugger