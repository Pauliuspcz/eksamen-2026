## Eksamensbesvarelse PGR301

### Oppgave 1A:
#### Bygg imaget fra rotmappen:

```
docker build -t wishifai .
```
#### Start containeren på localhost:9999:
```
docker run -p 9999:8080 -e AWS_ACCESS_KEY_ID=<access-key> -e AWS_SECRET_ACCESS_KEY=<secret-key> -e S3_BUCKET=bucket wishifai
```
#### Test at denne kjører:
```
curl http://localhost:9999/api/health
```
Dockerfilen er multistage: Maven, JDK og kildekode brukes bare i build-steget, og det endelige imaget inneholder bare jar-filen og en JRE.