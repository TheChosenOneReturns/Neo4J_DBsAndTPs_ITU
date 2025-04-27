# 📚 Trabajo Práctico N°2 - Neo4J

Sistema de Gestión de Noticias para un Periódico

---

# 1. 📖 Análisis de un periódico

Al analizar un periódico digital como *La Nación* o *The Guardian*, observamos que:

- Existen **secciones** como Economía, Deportes, Sociedad, Internacionales, etc.
- Muchas noticias se publican en **varios idiomas**.
- Hay **categorías** temáticas (ej. Política, Salud, Tecnología).
- Permiten **comentarios de usuarios** en las noticias.
- Cada noticia tiene:
  - **Título**, **contenido**, **fecha de publicación**.
  - **Autores** y a veces **editores**.
  - **Etiquetas** o **tags**.
  - **Imágenes** o **videos** asociados.

---

# 2. 📝 Lista de Aspectos Relevantes

| Aspecto              | Detalle |
|----------------------|---------|
| Secciones            | Sí, hay secciones por tema. |
| Idiomas              | Sí, múltiples idiomas (ES, EN, etc.). |
| Categorías           | Sí, clasifican noticias temáticamente. |
| Usuarios             | Sí, lectores que comentan artículos. |
| Roles                | Usuarios comunes, autores, editores. |
| Multimedia           | Asociaciones a imágenes y videos. |
| Comentarios          | Se permiten comentarios en artículos.|

---

# 3. 🏷️ Etiquetas (Tipos de nodos)

| Nodo        | Descripción |
|-------------|-------------|
| `Idioma`    | Idiomas de los artículos (ES, EN, CH). |
| `Post`      | Artículos publicados. |
| `Categoria` | Categorías o secciones temáticas. |
| `Autor`     | Persona que escribe artículos. |
| `Usuario`   | Persona que comenta artículos. |
| `Editor`    | Persona que edita artículos. |
| `Media`     | Imágenes o videos asociados. |
| `Comentario`| Comentarios hechos por usuarios.|

---

# 4. 🔗 Relaciones entre Nodos

| Relación            | Explicación |
|---------------------|-------------|
| `TIENE_CATEGORIA`   | Un idioma tiene categorías. |
| `TIENE_TAG`         | Un idioma tiene etiquetas. |
| `TIENE_POST`        | Un idioma tiene posts/artículos. |
| `PERTENECE_A`       | Un artículo pertenece a una categoría. |
| `ETIQUETADO_COMO`   | Un artículo tiene etiquetas. |
| `ESCRITO_POR`       | Un artículo es escrito por un autor. |
| `EDITADO_POR`       | Un artículo es editado por un editor. |
| `TIENE_MEDIA`       | Un artículo tiene medios (imágenes/videos). |
| `CREADO_POR`        | Un comentario es creado por un usuario. |
| `COMENTA`           | Un usuario comenta un post. |
| `RESPONDE_A`        | Un comentario responde a otro comentario.|

---

# 5. 🛠️ Propiedades de los Nodos

| Nodo         | Propiedades |
|--------------|-------------|
| `Idioma`     | nombre, url, abreviación, bandera (flag). |
| `Post`       | contenido, título, descripción, sumario, fecha publicación, fecha actualización, lugar. |
| `Categoria`  | nombre, url, descripción. |
| `Autor`      | nombre, apellido, nombreUsuario, url, usuarioX. |
| `Editor`     | nombre, apellido, nombreUsuario, url. |
| `Usuario`    | nombreUsuario, nombre, apellido, email. |
| `Media`      | fechaSubida, tipo (imagen/video), url, título, descripción. |
| `Comentario` | fechaCreacion, contenido.|

---

# 6. 🖼️ Imágenes en Neo4J: ¿Cómo asociarlas?

Neo4J **no almacena archivos binarios** directamente, pero podemos **guardar la URL** o el **path** al archivo.

### 📌 Cómo modelarlo:

1. Crear un nodo `:Media` para cada imagen o video.
2. Guardar propiedades como `url`, `tipo`, `titulo`, `descripcion`, `fechaSubida`.

### 🧬 Ejemplo Cypher:

```cypher
CREATE (img:Media {
  url: "https://miservidor.com/imagenes/noticia1.jpg",
  tipo: "imagen",
  titulo: "Manifestación en Buenos Aires",
  descripcion: "Foto de la manifestación en Plaza de Mayo",
  fechaSubida: date("2025-04-25")
})
```

Y luego asociarlo al post:

```cypher
MATCH (post:Post {titulo: "Protestas en la ciudad"}), (img:Media {titulo: "Manifestación en Buenos Aires"})
CREATE (post)-[:TIENE_MEDIA]->(img);
```


