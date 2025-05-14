
// Crear estudiantes
CREATE (juan:Estudiante {nombre: 'Juan', edad: 21, legajo: 1001})
CREATE (ana:Estudiante {nombre: 'Ana', edad: 22, legajo: 1002})
CREATE (luis:Estudiante {nombre: 'Luis', edad: 23, legajo: 1003})

// Crear materias
CREATE (bd:Materia {nombre: 'Bases de Datos', año: 2})
CREATE (so:Materia {nombre: 'Sistemas Operativos', año: 3})
CREATE (metod:Materia {nombre: 'Metodología', año: 1})

// Crear relaciones de cursada
CREATE (juan)-[:CURSA {nota: 8}]->(bd)
CREATE (juan)-[:CURSA {nota: 7}]->(so)
CREATE (ana)-[:CURSA {nota: 9}]->(bd)
CREATE (luis)-[:CURSA {nota: 6}]->(metod)

// Crear relaciones entre estudiantes
CREATE (juan)-[:CONOCE]->(ana)
CREATE (ana)-[:CONOCE]->(luis)
CREATE (luis)-[:CONOCE]->(juan)
