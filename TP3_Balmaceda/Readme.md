# 🩺 Sistema de Gestión de Historias Clínicas - Neo4j

Este proyecto implementa un modelo de grafo para gestionar historias clínicas usando Neo4j. Permite representar de forma relacional la información de pacientes, médicos, diagnósticos, tratamientos y más.

---

## 🌐 Descripción

El sistema modela entidades como:

- 👤 **Paciente**
- 🩺 **Historia Clínica**
- 👨‍⚕️ **Médico**
- 🧪 **Diagnóstico**
- 💊 **Tratamiento**

Y las relaciones entre ellos, tales como:

- `TIENE_HISTORIA`
- `ES_ATENDIDO_POR`
- `DIAGNOSTICADO_CON`
- `RECIBE_TRATAMIENTO`

---

## 🧪 Tecnologías Utilizadas

- **Base de Datos:** [Neo4j](https://neo4j.com/)
- **Lenguaje de consultas:** Cypher (`.cyp`)
- **Visualización:** Neo4j Browser / Desktop

---

## ⚙️ Instalación y Ejecución

1. Instalar Neo4j Desktop o utilizar Neo4j Aura.
2. Crear un nuevo proyecto y base de datos.
3. Cargar el archivo `.cyp` con el siguiente procedimiento:

   ### Desde Neo4j Browser:

   - Abrir la consola de comandos.
   - Copiar y pegar el contenido del archivo `.cyp`.
   - Ejecutar los comandos (`Ctrl + Enter`).

   ### Desde línea de comandos:

   ```bash
   cypher-shell -u neo4j -p <password> < documentacion.cyp
   ```

4. Verificar que se han creado los nodos y relaciones correctamente con:

   ```cypher
   MATCH (n) RETURN n LIMIT 25;
   ```

---

## 🧩 Modelo de Datos

Ejemplo de nodos y relaciones:

```cypher
(:Paciente {nombre: "Juan Pérez", dni: "12345678"})
-[:TIENE_HISTORIA]->
(:Historia {fecha: "2024-10-01", observaciones: "Control general"})
-[:ES_ATENDIDO_POR]->
(:Medico {nombre: "Dra. Gómez", especialidad: "Clínica"})
```

---

## 🔍 Consultas Útiles

- **Obtener todas las historias clínicas de un paciente:**

  ```cypher
  MATCH (p:Paciente {dni: "12345678"})-[:TIENE_HISTORIA]->(h:Historia)
  RETURN h;
  ```

- **Ver pacientes atendidos por un médico específico:**

  ```cypher
  MATCH (m:Medico {nombre: "Dra. Gómez"})<-[:ES_ATENDIDO_POR]-(h:Historia)<-[:TIENE_HISTORIA]-(p:Paciente)
  RETURN p.nombre, h.fecha;
  ```

- **Buscar diagnósticos y tratamientos relacionados:**

  ```cypher
  MATCH (h:Historia)-[:DIAGNOSTICADO_CON]->(d:Diagnostico)-[:TRATADO_CON]->(t:Tratamiento)
  RETURN d.nombre, t.nombre;
  ```

---

## 👨‍💻 Autor

- Ariel

---

## 📁 Archivo .cyp

El archivo `documentacion.cyp` contiene los comandos para poblar la base de datos con nodos y relaciones iniciales del sistema.