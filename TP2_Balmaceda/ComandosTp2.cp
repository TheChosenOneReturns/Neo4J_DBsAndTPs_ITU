
// Crear nodos de idioma
CREATE (:Idioma {nombre: "Español", abreviacion: "ES", url: "https://periodico.com/es", bandera: "🇪🇸"});
CREATE (:Idioma {nombre: "Inglés", abreviacion: "EN", url: "https://periodico.com/en", bandera: "🇬🇧"});

// Crear categorías
CREATE (:Categoria {nombre: "Política", url: "https://periodico.com/es/politica", descripcion: "Noticias políticas nacionales e internacionales"});
CREATE (:Categoria {nombre: "Deportes", url: "https://periodico.com/es/deportes", descripcion: "Noticias deportivas"});

// Crear autores
CREATE (:Autor {nombre: "Lucía", apellido: "Pérez", nombreUsuario: "lperez", url: "https://periodico.com/autores/lperez"});
CREATE (:Autor {nombre: "Carlos", apellido: "Martínez", nombreUsuario: "cmartinez", url: "https://periodico.com/autores/cmartinez"});

// Crear editores
CREATE (:Editor {nombre: "María", apellido: "Gómez", nombreUsuario: "mgomez", url: "https://periodico.com/editores/mgomez"});

// Crear usuarios
CREATE (:Usuario {nombreUsuario: "usuario123", nombre: "Ana", apellido: "Sánchez", email: "ana@gmail.com"});
CREATE (:Usuario {nombreUsuario: "lector456", nombre: "Juan", apellido: "López", email: "juan@gmail.com"});

// Crear posts
CREATE (:Post {titulo: "Elecciones 2025", contenido: "Resultados preliminares...", descripcion: "Elecciones presidenciales", sumario: "Cobertura especial", fechaPublicacion: date("2025-04-27"), fechaActualizacion: date("2025-04-27"), lugar: "Buenos Aires"});
CREATE (:Post {titulo: "Final de la Copa", contenido: "El partido más esperado...", descripcion: "Final de fútbol", sumario: "Deportes", fechaPublicacion: date("2025-04-26"), fechaActualizacion: date("2025-04-26"), lugar: "Madrid"});

// Crear media
CREATE (:Media {url: "https://periodico.com/media/elecciones.jpg", tipo: "imagen", titulo: "Resultados Electorales", descripcion: "Foto oficial de elecciones", fechaSubida: date("2025-04-27")});
CREATE (:Media {url: "https://periodico.com/media/final-copa.jpg", tipo: "imagen", titulo: "Celebración Final", descripcion: "Equipo campeón", fechaSubida: date("2025-04-26")});

// Crear relaciones

// Asociar posts con idiomas
MATCH (p:Post {titulo: "Elecciones 2025"}), (i:Idioma {nombre: "Español"})
CREATE (i)-[:TIENE_POST]->(p);

MATCH (p:Post {titulo: "Final de la Copa"}), (i:Idioma {nombre: "Español"})
CREATE (i)-[:TIENE_POST]->(p);

// Asociar posts con categorías
MATCH (p:Post {titulo: "Elecciones 2025"}), (c:Categoria {nombre: "Política"})
CREATE (p)-[:PERTENECE_A]->(c);

MATCH (p:Post {titulo: "Final de la Copa"}), (c:Categoria {nombre: "Deportes"})
CREATE (p)-[:PERTENECE_A]->(c);

// Asociar posts con autores
MATCH (p:Post {titulo: "Elecciones 2025"}), (a:Autor {nombreUsuario: "lperez"})
CREATE (p)-[:ESCRITO_POR]->(a);

MATCH (p:Post {titulo: "Final de la Copa"}), (a:Autor {nombreUsuario: "cmartinez"})
CREATE (p)-[:ESCRITO_POR]->(a);

// Asociar posts con editores
MATCH (p:Post {titulo: "Elecciones 2025"}), (e:Editor {nombreUsuario: "mgomez"})
CREATE (p)-[:EDITADO_POR]->(e);

// Asociar posts con media
MATCH (p:Post {titulo: "Elecciones 2025"}), (m:Media {titulo: "Resultados Electorales"})
CREATE (p)-[:TIENE_MEDIA]->(m);

MATCH (p:Post {titulo: "Final de la Copa"}), (m:Media {titulo: "Celebración Final"})
CREATE (p)-[:TIENE_MEDIA]->(m);

// Crear comentarios
CREATE (:Comentario {contenido: "Excelente cobertura", fechaCreacion: datetime("2025-04-27T10:00:00")});
CREATE (:Comentario {contenido: "Gran partido", fechaCreacion: datetime("2025-04-26T21:00:00")});

// Asociar comentarios a posts
MATCH (c:Comentario {contenido: "Excelente cobertura"}), (u:Usuario {nombreUsuario: "usuario123"}), (p:Post {titulo: "Elecciones 2025"})
CREATE (u)-[:CREADO_POR]->(c), (c)-[:COMENTA]->(p);

MATCH (c:Comentario {contenido: "Gran partido"}), (u:Usuario {nombreUsuario: "lector456"}), (p:Post {titulo: "Final de la Copa"})
CREATE (u)-[:CREADO_POR]->(c), (c)-[:COMENTA]->(p);
