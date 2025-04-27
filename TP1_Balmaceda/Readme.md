# 📚 Trabajo Práctico N°1 - Neo4J

Bases de Datos Orientadas a Grafos

Profesor: Luis A. Chiaramonte

---

# 1. Reconocimiento de Neo4J

**Proyecto vs Base de Datos en Neo4J**

- **Proyecto**: Es una carpeta organizadora donde podés tener varias bases de datos, scripts, y configuraciones.
- **Base de datos**: Es donde viven tus nodos, relaciones y propiedades. Es la "información real" que vas a trabajar.

Un proyecto puede contener varias bases de datos.

---

# 2. Comandos Básicos - Cypher

## 🔸 MATCH

Busca nodos o relaciones en la base de datos.

```cypher
MATCH (n)
RETURN n;
```

Buscar un nodo específico:

```cypher
MATCH (p:Persona {nombre: "Juan"})
RETURN p;
```

## 🔸 CREATE

Crear un nodo:

```cypher
CREATE (:Persona {nombre: "Juan", edad: 30});
```

Crear dos nodos y una relación:

```cypher
CREATE (juan:Persona {nombre: "Juan"})
CREATE (maria:Persona {nombre: "María"})
CREATE (juan)-[:ES_PADRE_DE]->(maria);
```

Crear una relación entre nodos existentes:

```cypher
MATCH (juan:Persona {nombre: "Juan"}), (maria:Persona {nombre: "María"})
CREATE (juan)-[:ES_PADRE_DE]->(maria);
```

---

# 3. Creación de Base de Datos - Familia González

## 🌲 Nodos

```cypher
CREATE (juan:Persona {nombre: "Juan González", edad: 78});
CREATE (marta:Persona {nombre: "Marta González", edad: 75});
CREATE (pedro:Persona {nombre: "Pedro González", edad: 50});
CREATE (ana:Persona {nombre: "Ana González", edad: 48});
CREATE (luis:Persona {nombre: "Luis González", edad: 25});
CREATE (carla:Persona {nombre: "Carla González", edad: 22});
CREATE (sofia:Persona {nombre: "Sofía González", edad: 20});
CREATE (tomas:Persona {nombre: "Tomás González", edad: 18});
CREATE (elena:Persona {nombre: "Elena González", edad: 48});
CREATE (roberto:Persona {nombre: "Roberto González", edad: 50});
```

## 🛠️ Relaciones

```cypher
// Padres e hijos
MATCH (pedro:Persona {nombre:"Pedro González", edad:50}), (luis:Persona {nombre:"Luis González", edad:25})
CREATE (pedro)-[:ES_PADRE_DE]->(luis);

MATCH (pedro:Persona {nombre:"Pedro González", edad:50}), (carla:Persona {nombre:"Carla González", edad:22})
CREATE (pedro)-[:ES_PADRE_DE]->(carla);

MATCH (ana:Persona {nombre:"Ana González", edad:48}), (sofia:Persona {nombre:"Sofía González", edad:20})
CREATE (ana)-[:ES_MADRE_DE]->(sofia);

MATCH (ana:Persona {nombre:"Ana González", edad:48}), (tomas:Persona {nombre:"Tomás González", edad:18})
CREATE (ana)-[:ES_MADRE_DE]->(tomas);

// Parejas
MATCH (pedro:Persona {nombre:"Pedro González", edad:50}), (elena:Persona {nombre:"Elena González", edad:48})
CREATE (pedro)-[:ESPOSO_DE]->(elena);

MATCH (ana:Persona {nombre:"Ana González", edad:48}), (roberto:Persona {nombre:"Roberto González", edad:50})
CREATE (ana)-[:ESPOSA_DE]->(roberto);
```

---

# 4. Comandos para Borrar Nodos y Relaciones

## 🔥 Borrar una relación específica

```cypher
MATCH (a:Persona {nombre:"Pedro González"})-[r:ES_PADRE_DE]->(b:Persona {nombre:"Luis González"})
DELETE r;
```

## 🔥 Borrar un nodo sin relaciones

```cypher
MATCH (p:Persona {nombre:"Tomás González"})
DELETE p;
```

## 🔥 Borrar un nodo con todas sus relaciones

```cypher
MATCH (p:Persona {nombre:"Ana González"})
DETACH DELETE p;
```

## 💡 Resumen rápido

| Acción | Comando |
|--------|---------|
| Borrar relación | `MATCH (...) -[r:RELACION]-> (...) DELETE r;` |
| Borrar nodo sin relaciones | `MATCH (n:Nodo {propiedades}) DELETE n;` |
| Borrar nodo y sus relaciones | `MATCH (n:Nodo {propiedades}) DETACH DELETE n;` |

---

# 5. NEO4J Browser y NEO4J Bloom

## 🚀 NEO4J Browser

**Definición:** Interfaz principal para interactuar con Neo4J. Permite ejecutar consultas Cypher y visualizar resultados.

**Características:**
- Ejecución de comandos Cypher.
- Visualización de grafos.
- Historial de consultas.
- Personalización de vistas.

**Ideal para:** Programadores y analistas técnicos.

[Guía oficial](https://neo4j.com/docs/browser-manual/current/about-browser/)

## 🌸 NEO4J Bloom

**Definición:** Herramienta de visualización amigable para usuarios no técnicos.

**Características:**
- Búsqueda en lenguaje natural.
- Exploración visual intuitiva.
- Estilos gráficos personalizables.

**Ideal para:** Analistas de negocio y presentaciones de datos.

[Guía oficial](https://neo4j.com/docs/bloom-user-guide/current/about-bloom/)

## 🌟 Diferencias Rápidas

| Característica | Neo4J Browser | Neo4J Bloom |
|----------------|----------------|-------------|
| Para programadores | ✅ | ⚠️ |
| Para analistas | ⚠️ | ✅ |
| Escribir Cypher | ✅ | ❌ |
| Visualización elegante | ✅ | ✅ |

---

# 💥 Trabajo Finalizado

✨ ¡Trabajo práctico completo y listo para ser entregado! ✨
