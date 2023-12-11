# Chq.to - Acortador de links en Rails

# Requerimentos
* Versión de Ruby
3.2.2

# Pasos para levantar la aplicación
Instalar las dependencias con:
```
bundle
```
Levantar la base de datos, hacer las migraciones y cargar los datos del seed.rb con:
```
rails db:reset
```
Por último, para levantar el servidor:
```
rails server
```
# Dependencias:
* Devise: Autenticación
* Devise i18n: Traducciones para devise
* Simple form: Simplifica la creación de formularios
* Rails i18n: Soporte para i18n
* Chartkick y groupdate: Creación de gráficos y estadísticas
* Will paginate: Paginación de consultas (para las tabla de accesos).  
* Faker: Generación aleatoria de datos para el seed de la bd.

# Configuración
Se puede probar la aplicación con la url chq.to:3000 si se agrega al archivo /etc/hosts la línea:
```
127.0.0.1 chq.to
```

# Datos de prueba
Hay tres usuarios ya cargados, cada uno con links y accesos para probar, se puede acceder con email o username:

| Email  | Username | Contraseña | 
| ----------------- | ------------- | ------------------- | 
| juancho@gmail.com | juancho       | contra              |
| pepe@gmail.com    | pepito        | contra              |
| tavo@gmail.com    | tavo          | contra              |

# Decisiones de diseño
* Encriptación: Se aprovechó la misma encriptación que provee Rails con las credenciales en credentials.yml.enc y su archivo para desencriptar master.key. Estos archivos se dejaron para simplificar el proceso de creación y carga de los datos, pero si se desarrolla en la aplicación hay que generar nuevas credenciales. Si se quier hacer esto, debe eliminar las credenciales ya incluidas y descomentar en .gitignore el archivo master.key

* Modelado de links: Un usuario puede tener múltiples links, cada link pertenece a solo un usuario y cada link tiene múltiples accesos. Los distintos tipos de links fueron representados en la tabla utilizando STI (Single Table Inheritance) para separar responsabilidades, se eligió esto debido a que se considera que no hay suficientes diferencias entre cada link como para hacer una tabla para cada uno y representar mejor el problema.

* Librería para slugs: No se utlilizó ninguna librería para encargarse de los slugs para cada link, debido a que se consideró que la funcionalidad que se necesita es reducida comparado a lo que puede proveer una librería, además no se encontró una librería que se adecue bien al problema.

* Combinaciones posibles de slugs: Para realizar la generación de slugs aleatoria se utilizo SecureRandom.hex(4). Genera una cadena de 8 caracteres los cuales tienen 16 posibles valores cada uno, con esto se puede generar una cantidad de 16^8 slugs distintos de una forma segura. Esto es 4.294.967.296 combinaciones posibles.