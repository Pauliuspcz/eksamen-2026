# Eksamensbesvarelse PGR301: Kandidat 16

## Oppgave 1:

### Oppgave 1A:
#### Bygg imaget fra rotmappen:

```
docker build -t wishifai .
```
#### Start containeren på localhost:9999:
```
docker run -p 9999:8080 -e AWS_ACCESS_KEY_ID=<access-key> -e AWS_SECRET_ACCESS_KEY=<secret-key> -e S3_BUCKET=<bucket-navn> wishifai
```
AWS-nøklene og bucket-navnet sendes med "-e" når containeren starter, og bygges ikke inn i imaget
#### Test at denne kjører:
```
curl http://localhost:9999/api/health
```
Dockerfilen er multistage: Maven, JDK og kildekode brukes bare i build-steget, og det endelige imaget inneholder bare jar-filen og en JRE.

### Oppgave 1B:

Lenke til grønn kjøring: [Github Actions-kjøring](https://github.com/Pauliuspcz/eksamen-2026/actions/runs/41134588964)

Imaget pushes til ECR-repoet "wishifai-16" ved hver push til main

**Tagging-strategi:** Imaget tagges med full commit-SHA (`github.sha`), se `.github/workflows/deploy.yaml` linje 37

Begrunnelse: Hver commit gir en unik tag, så jeg kan se nøyaktig hvilken commit som ligger bak imaget som kjører, for eksempel i ECR. `latest` blir overskrevet ved hvert bygg og sier ikke hvilken versjon som faktisk kjører.

AWS-nøklene ligger som Github Secrets, ikke i workflow filen.