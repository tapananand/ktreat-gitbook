# JWT

Can be used to identify users - like session Management. Created and sent by the server and then used for further communication by adding it in the Authentication Header

Has three parts: `xxxxx.yyyyy.zzzzz`

```text
xxxxx = base64Encoded Header
yyyyy = base64Encoded Data
zzzzz = Hash of xxxxx.yyyyy with a secret string used to sign this hash
```

For example,

eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.XbPfbIHMI6arZ3Y922BhjWgQzWXcXNrz0ogtVhfEd2o

The above has:

```javascript
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

The algorithm specified in the Header is used for the Signature part. Signature makes sure that data hasn't been modified. The server uses the same algo to recalculate the Signature part and if it doesn't match the one received the data is deemed as modified. 

So if an attacker wants to tamper the data, he will have to guess the secret to send the valid Signature. If RS256 signature is used, he will need both Private and Public keys.

Really useful debugging tool at: [https://jwt.io/\#debugger](https://jwt.io/#debugger)

Don't keep any sensitive info here, only enough to identify the user. No anything like isAdmin, password, etc

## Benefits over cookies?

1. Enables CORS
2. No need to maintain session state on a single server. All servers that use same secret can use JWT and identify the user.
3. Prevents CSRF
4. Performance is better since don't have to go to DB and deserialise the session.

