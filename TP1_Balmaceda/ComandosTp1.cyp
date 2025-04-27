CREATE (juan:Persona {nombre: "Juan González", edad: 78})
CREATE (marta:Persona {nombre: "Marta González", edad: 75})
CREATE (pedro:Persona {nombre: "Pedro González", edad: 50})
CREATE (ana:Persona {nombre: "Ana González", edad: 48})
CREATE (luis:Persona {nombre: "Luis González", edad: 25})
CREATE (carla:Persona {nombre: "Carla González", edad: 22})
CREATE (sofia:Persona {nombre: "Sofía González", edad: 20})
CREATE (tomas:Persona {nombre: "Tomás González", edad: 18})
CREATE (elena:Persona {nombre: "Elena González", edad: 48})
CREATE (roberto:Persona {nombre: "Roberto González", edad: 50})


// Relacionar padres con hijos
MATCH (pedro:Persona {nombre:"Pedro González", edad:50}) 
MATCH (luis:Persona {nombre:"Luis González", edad:25}) 
CREATE (pedro)-[:ES_PADRE_DE]->(luis);

MATCH (pedro:Persona {nombre:"Pedro González", edad:50}) 
MATCH (carla:Persona {nombre:"Carla González", edad:22}) 
CREATE (pedro)-[:ES_PADRE_DE]->(carla);

MATCH (ana:Persona {nombre:"Ana González", edad:48}) 
MATCH (sofia:Persona {nombre:"Sofía González", edad:20}) 
CREATE (ana)-[:ES_MADRE_DE]->(sofia);

MATCH (ana:Persona {nombre:"Ana González", edad:48}) 
MATCH (tomas:Persona {nombre:"Tomás González", edad:18}) 
CREATE (ana)-[:ES_MADRE_DE]->(tomas);

// Relacionar parejas
MATCH (pedro:Persona {nombre:"Pedro González", edad:50}) 
MATCH (elena:Persona {nombre:"Elena González", edad:48}) 
CREATE (pedro)-[:ESPOSO_DE]->(elena);

MATCH (ana:Persona {nombre:"Ana González", edad:48}) 
MATCH (roberto:Persona {nombre:"Roberto González", edad:50}) 
CREATE (ana)-[:ESPOSA_DE]->(roberto);

// Opcional: eliminar una relación (ejemplo)
MATCH (n:Persona {nombre:"Pedro González", edad:50})-[r:ES_PADRE_DE]->(luis)
DELETE r;

MATCH (n:Persona {nombre:"Ana González", edad:48})-[r:ES_MADRE_DE]->(sofia)
DELETE r;
