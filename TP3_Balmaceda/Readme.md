# 🩺 Neo4j Medical Records System

Este repositorio contiene el diseño y la implementación de una base de datos médica modelada con **Neo4j**. El proyecto busca representar de manera integral las entidades y relaciones involucradas en un sistema de historias clínicas electrónicas.

---

## 📌 Objetivo

El objetivo es representar relaciones clínicas complejas entre pacientes, profesionales de salud, consultas, diagnósticos, estudios, medicamentos y centros médicos, utilizando un modelo de grafos altamente legible y visualmente optimizado para el análisis médico.

---

## 🧱 Estructura de Datos

Las principales entidades del modelo son:

- `Paciente`
- `Profesional`
- `Consulta`
- `Diagnóstico`
- `Tratamiento`
- `Medicamento`
- `Estudio`
- `Resultado`
- `Documento`
- `CentroMedico`
- `Laboratorio`
- `Especialidad`
- `SeguroMedico`

Entre ellas se definen relaciones como:

- `ASISTE_A`
- `ATIENDE`
- `DIAGNOSTICA`
- `PRESCRIBE`
- `TRATADO_CON`
- `INCLUYE_MEDICAMENTO`
- `SOLICITA_ESTUDIO`
- `TIENE_RESULTADO`
- `GENERA_DOCUMENTO`
- `SIGUE_TRATAMIENTO`
- `USA_MEDICAMENTO`
- `TIENE_HISTORIAL`
- `TRABAJA_EN`
- `TIENE_COBERTURA`

---

## 📦 Requisitos

- Neo4j Desktop o Neo4j Aura
- Cypher como lenguaje de consulta
- Browser o Bloom para visualización

---

## ⚙️ Ejecución

Podés importar los datos ejecutando el contenido del archivo `.cypher` incluido en este repositorio desde Neo4j Browser o una herramienta compatible.

---

## 🔄 Operaciones CRUD (Entidad: `Paciente`)

### ✅ CREATE
```cypher
CREATE (p:Paciente {
  id: 'PAC006',
  nombre: 'Valeria',
  apellido: 'Martínez',
  dni: '40123456',
  fechaNacimiento: date('1992-08-15'),
  genero: 'Femenino',
  direccion: 'Av. Libertador 3456, CABA',
  telefono: '+54911555444555',
  email: 'valeria.martinez@email.com',
  grupoSanguineo: 'A-',
  factorRH: 'Negativo',
  estado: 'Activo'
})
```

### 📖 READ (Obtener todos los pacientes activos)
```cypher
MATCH (p:Paciente)
WHERE p.estado = 'Activo'
RETURN p.id, p.nombre, p.apellido, p.dni, p.email
```

### 📖 READ (Buscar paciente por DNI)
```cypher
MATCH (p:Paciente {dni: '40123456'})
RETURN p
```

### ✏️ UPDATE (Modificar datos de contacto)
```cypher
MATCH (p:Paciente {id: 'PAC006'})
SET p.telefono = '+54911666777888',
    p.email = 'valeria.martinez.actualizado@email.com',
    p.direccion = 'Av. Santa Fe 999, CABA'
```

### 🗑️ DELETE (Eliminar paciente por ID)
```cypher
MATCH (p:Paciente {id: 'PAC006'})
DETACH DELETE p
```

---

## 📊 Visualización

Para ver la red médica de forma clara:

- Usá Neo4j Browser con consultas `MATCH` amplias (por ejemplo: `MATCH (n)-[r]->(m) RETURN n,r,m`).
- Aplicá estilos en los nodos (`Paciente` en azul, `Profesional` en verde, `Consulta` en amarillo, etc.) desde la pestaña de **style** de Neo4j.

---

## 📈 Extensiones Futuras

- Auditoría de accesos y ediciones.
- Integración con estándares FHIR.
- Soporte para multi-idioma.
- Visualización avanzada con Bloom y alertas clínicas automáticas.

---

## ✍️ Autor

Proyecto realizado por Ariel para uso académico y/o profesional en entornos médicos simulados.

---

## 📄 Licencia

Este repositorio está bajo licencia MIT. Podés usarlo, modificarlo y distribuirlo con fines educativos o profesionales.

