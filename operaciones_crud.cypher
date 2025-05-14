
// READ - Mostrar todos los estudiantes y qué materias cursan
MATCH (e:Estudiante)-[r:CURSA]->(m:Materia)
RETURN e.nombre AS estudiante, m.nombre AS materia, r.nota

// CREATE - Agregar un nuevo estudiante y una nueva relación
CREATE (marcos:Estudiante {nombre: 'Marcos', edad: 20, legajo: 1004})
MATCH (m:Materia {nombre: 'Metodología'})
CREATE (marcos)-[:CURSA {nota: 10}]->(m)

// UPDATE - Subirle la nota a Juan en Sistemas Operativos
MATCH (e:Estudiante {nombre: 'Juan'})-[r:CURSA]->(m:Materia {nombre: 'Sistemas Operativos'})
SET r.nota = 9

// DELETE - Eliminar la relación entre Ana y Luis
MATCH (:Estudiante {nombre: 'Ana'})-[r:CONOCE]->(:Estudiante {nombre: 'Luis'})
DELETE r

// DELETE con relaciones - Eliminar al estudiante Luis y todo lo relacionado
MATCH (e:Estudiante {nombre: 'Luis'})
DETACH DELETE e
