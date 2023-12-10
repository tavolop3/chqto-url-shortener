# Chq.to - Un acortador de links en Rails

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
# Dependencias
* Devise: Autenticación
* Devise i18n: Traducciones para devise
* Simple form: Simplifica la creación de formularios
* Rails i18n: Soporte para i18n
* Chartkick y groupdate: Creación de gráficos y estadísticas
* Will paginate: Paginación de consultas (para las tabla de accesos).  

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