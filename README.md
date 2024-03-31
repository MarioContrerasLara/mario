# Mario Contreras Lara
---
### Primero creamos la carpeta y después con git init creamos el 
### repositorio local.
### En github creamos un repositoprio público llamado mario
### (del mismo nombre que el repositorio local).
### Añadimos el repositorio en la nube al repositorio local con
### git remote add origin https://github.com/MarioContrerasLara/mario.git

### Creamos un archivo vacío y lo añadimos alrepositorio local.
### Guardamos los cambios añadiendo un comentario con
### git commit -m "Primer commit."
### Como en github hemos indicado que usaremos cómo rama principal main
### en vez de master tenemos que inidcarlo también en el local con
### git branch -m master main.
### Después de esto sincronizamos los cambios con github con
### git push origin main.
### Obtenemos este error: fatal: unable to access 
### 'https://github.com/MarioContrerasLara/mario.git/': SSL certificate
### problem: unable to get local issuer certificate
### Arreglamos este problema de certificado ssl con
### git config --global http.sslVerify false
### Después hacemos git push origin main para subir los cambios y nos
### encontramos con otro problema de sincronización.
### Lo solucionamos con git pull origin main --allow-unrelated-histories
### Después de esto sincronizamos los cambios con git push origin main.

### Con git branch development creamos la rama y con
### git checkout development nos movemos a ella.
### Realizamos cambios en el archivo que creamos y lo añadimos con
### git add mario.txt a la rama en la que estamos.
### Guardamos cambios añadiendo descripción con git commit -m 
### "Cambios realizados en mario.txt desde la rama development."
### Subimos los cambios a github indicando la rama con
### git push origin development

### Con git checkout main volvemos a la rama main.
### Y con git merge development unificamos las dos ramas.
### Por último hacemos git push origin main para subir los cambios.

