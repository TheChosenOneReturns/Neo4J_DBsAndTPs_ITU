// Sistema de Gestión de Historias Clínicas - Neo4j
// Creado por: [Nombres de los estudiantes]
// Fecha: 5 de Mayo de 2025

// CREACIÓN DE RESTRICCIONES (CONSTRAINTS) PARA GARANTIZAR UNICIDAD
// Esto asegurará que no haya duplicados para campos clave

// Restricciones para Paciente
CREATE CONSTRAINT paciente_id IF NOT EXISTS
FOR (p:Paciente) REQUIRE p.id IS UNIQUE;

// Restricciones para Profesional
CREATE CONSTRAINT profesional_id IF NOT EXISTS
FOR (p:Profesional) REQUIRE p.id IS UNIQUE;

CREATE CONSTRAINT profesional_matricula IF NOT EXISTS
FOR (p:Profesional) REQUIRE p.matricula IS UNIQUE;

// Restricciones para otras entidades principales
CREATE CONSTRAINT consulta_id IF NOT EXISTS
FOR (c:Consulta) REQUIRE c.id IS UNIQUE;

CREATE CONSTRAINT diagnostico_id IF NOT EXISTS
FOR (d:Diagnostico) REQUIRE d.id IS UNIQUE;

CREATE CONSTRAINT tratamiento_id IF NOT EXISTS
FOR (t:Tratamiento) REQUIRE t.id IS UNIQUE;

CREATE CONSTRAINT estudio_id IF NOT EXISTS
FOR (e:Estudio) REQUIRE e.id IS UNIQUE;

CREATE CONSTRAINT resultado_id IF NOT EXISTS
FOR (r:Resultado) REQUIRE r.id IS UNIQUE;

CREATE CONSTRAINT documento_id IF NOT EXISTS
FOR (d:Documento) REQUIRE d.id IS UNIQUE;

CREATE CONSTRAINT medicamento_id IF NOT EXISTS
FOR (m:Medicamento) REQUIRE m.id IS UNIQUE;

CREATE CONSTRAINT especialidad_id IF NOT EXISTS
FOR (e:Especialidad) REQUIRE e.id IS UNIQUE;

// CREACIÓN DE NODOS DE EJEMPLO

// Creación de especialidades médicas
CREATE (e1:Especialidad {
  id: 'ESP001',
  nombre: 'Cardiología',
  descripcion: 'Especialidad enfocada en diagnóstico y tratamiento de enfermedades del corazón'
})

CREATE (e2:Especialidad {
  id: 'ESP002',
  nombre: 'Dermatología',
  descripcion: 'Especialidad enfocada en diagnóstico y tratamiento de enfermedades de la piel'
})

CREATE (e3:Especialidad {
  id: 'ESP003',
  nombre: 'Pediatría',
  descripcion: 'Especialidad enfocada en la salud de niños y adolescentes'
})

CREATE (e4:Especialidad {
  id: 'ESP004',
  nombre: 'Traumatología',
  descripcion: 'Especialidad enfocada en lesiones del sistema músculo-esquelético'
})

// Creación de profesionales médicos
CREATE (p1:Profesional {
  id: 'PRO001',
  nombre: 'María',
  apellido: 'González',
  matricula: 'MN12345',
  email: 'maria.gonzalez@clinica.com',
  telefono: '+54911555123456'
})

CREATE (p2:Profesional {
  id: 'PRO002',
  nombre: 'Carlos',
  apellido: 'Rodríguez',
  matricula: 'MN23456',
  email: 'carlos.rodriguez@clinica.com',
  telefono: '+54911555234567'
})

CREATE (p3:Profesional {
  id: 'PRO003',
  nombre: 'Laura',
  apellido: 'Martínez',
  matricula: 'MN34567',
  email: 'laura.martinez@clinica.com',
  telefono: '+54911555345678'
})

// Creación de pacientes
CREATE (pac1:Paciente {
  id: 'PAC001',
  nombre: 'Juan',
  apellido: 'Pérez',
  fechaNacimiento: '1980-05-15',
  genero: 'Masculino',
  direccion: 'Av. Corrientes 1234, CABA',
  telefono: '+54911555111222',
  email: 'juan.perez@email.com',
  grupoSanguineo: 'A+',
  alergias: 'Penicilina'
})

CREATE (pac2:Paciente {
  id: 'PAC002',
  nombre: 'Ana',
  apellido: 'López',
  fechaNacimiento: '1990-10-20',
  genero: 'Femenino',
  direccion: 'Av. Rivadavia 5678, CABA',
  telefono: '+54911555222333',
  email: 'ana.lopez@email.com',
  grupoSanguineo: 'O-',
  alergias: 'Ninguna'
})

CREATE (pac3:Paciente {
  id: 'PAC003',
  nombre: 'Miguel',
  apellido: 'Torres',
  fechaNacimiento: '1975-03-08',
  genero: 'Masculino',
  direccion: 'Av. Santa Fe 9012, CABA',
  telefono: '+54911555333444',
  email: 'miguel.torres@email.com',
  grupoSanguineo: 'B+',
  alergias: 'Sulfas, Látex'
})

// Creación de medicamentos
CREATE (med1:Medicamento {
  id: 'MED001',
  nombre: 'Atenolol',
  presentacion: 'Comprimidos 50mg',
  principioActivo: 'Atenolol',
  dosis: '1 comprimido cada 12 horas'
})

CREATE (med2:Medicamento {
  id: 'MED002',
  nombre: 'Ibuprofeno',
  presentacion: 'Comprimidos 400mg',
  principioActivo: 'Ibuprofeno',
  dosis: '1 comprimido cada 8 horas'
})

CREATE (med3:Medicamento {
  id: 'MED003',
  nombre: 'Amoxicilina',
  presentacion: 'Cápsulas 500mg',
  principioActivo: 'Amoxicilina',
  dosis: '1 cápsula cada 8 horas'
})

// Creación de consultas médicas
CREATE (c1:Consulta {
  id: 'CON001',
  fecha: '2025-04-10',
  hora: '09:30:00',
  motivo: 'Dolor en el pecho',
  notas: 'Paciente refiere dolor opresivo en región precordial',
  tipoConsulta: 'Presencial'
})

CREATE (c2:Consulta {
  id: 'CON002',
  fecha: '2025-04-15',
  hora: '14:00:00',
  motivo: 'Control dermatológico',
  notas: 'Seguimiento de tratamiento para psoriasis',
  tipoConsulta: 'Presencial'
})

CREATE (c3:Consulta {
  id: 'CON003',
  fecha: '2025-04-20',
  hora: '10:15:00',
  motivo: 'Dolor lumbar',
  notas: 'Paciente refiere dolor luego de actividad física',
  tipoConsulta: 'Telemedicina'
})

// Creación de diagnósticos
CREATE (d1:Diagnostico {
  id: 'DIA001',
  codigo: 'I20.9',
  descripcion: 'Angina de pecho',
  fechaDiagnostico: '2025-04-10',
  gravedad: 'Moderada'
})

CREATE (d2:Diagnostico {
  id: 'DIA002',
  codigo: 'L40',
  descripcion: 'Psoriasis',
  fechaDiagnostico: '2025-04-15',
  gravedad: 'Leve'
})

CREATE (d3:Diagnostico {
  id: 'DIA003',
  codigo: 'M54.5',
  descripcion: 'Lumbalgia',
  fechaDiagnostico: '2025-04-20',
  gravedad: 'Leve'
})

// Creación de tratamientos
CREATE (t1:Tratamiento {
  id: 'TRA001',
  descripcion: 'Tratamiento para angina de pecho',
  fechaInicio: '2025-04-10',
  fechaFin: '2025-05-10',
  instrucciones: 'Tomar medicación y evitar esfuerzos'
})

CREATE (t2:Tratamiento {
  id: 'TRA002',
  descripcion: 'Tratamiento tópico para psoriasis',
  fechaInicio: '2025-04-15',
  fechaFin: '2025-06-15',
  instrucciones: 'Aplicar crema dos veces al día'
})

CREATE (t3:Tratamiento {
  id: 'TRA003',
  descripcion: 'Tratamiento para lumbalgia',
  fechaInicio: '2025-04-20',
  fechaFin: '2025-05-05',
  instrucciones: 'Reposo, aplicar calor local y tomar medicación'
})

// Creación de estudios médicos
CREATE (est1:Estudio {
  id: 'EST001',
  tipo: 'Electrocardiograma',
  descripcion: 'ECG de 12 derivaciones',
  fechaSolicitud: '2025-04-10'
})

CREATE (est2:Estudio {
  id: 'EST002',
  tipo: 'Análisis de sangre',
  descripcion: 'Hemograma completo',
  fechaSolicitud: '2025-04-10'
})

CREATE (est3:Estudio {
  id: 'EST003',
  tipo: 'Radiografía',
  descripcion: 'Rx de columna lumbar frente y perfil',
  fechaSolicitud: '2025-04-20'
})

// Creación de resultados
CREATE (res1:Resultado {
  id: 'RES001',
  valor: 'Alteraciones ST-T',
  unidad: 'N/A',
  fechaResultado: '2025-04-10',
  observaciones: 'Signos de isquemia'
})

CREATE (res2:Resultado {
  id: 'RES002',
  valor: '14.2',
  unidad: 'g/dL',
  fechaResultado: '2025-04-11',
  observaciones: 'Dentro de parámetros normales'
})

CREATE (res3:Resultado {
  id: 'RES003',
  valor: 'Rectificación lordosis lumbar',
  unidad: 'N/A',
  fechaResultado: '2025-04-20',
  observaciones: 'Sin fracturas visibles'
})

// Creación de documentos
CREATE (doc1:Documento {
  id: 'DOC001',
  tipo: 'Informe médico',
  titulo: 'Informe cardiológico',
  contenido: 'Paciente con cuadro compatible con angina de pecho...',
  fechaCreacion: date('2025-04-10')
})

CREATE (doc2:Documento {
  id: 'DOC002',
  tipo: 'Receta médica',
  titulo: 'Prescripción de medicamentos',
  contenido: 'RP/ Atenolol 50mg #30...',
  fechaCreacion: date('2025-04-16')
})

CREATE (doc3:Documento {
  id: 'DOC003',
  tipo: 'Certificado médico',
  titulo: 'Certificado de reposo',
  contenido: 'Se certifica que el paciente debe guardar reposo por 7 días...',
  fechaCreacion: date('2025-04-20')
})

// CREACIÓN DE RELACIONES ENTRE NODOS

// Relaciones entre profesionales y especialidades
MATCH (p:Profesional {id: 'PRO001'}), (e:Especialidad {id: 'ESP001'})
CREATE (p)-[:ESPECIALIZADO_EN]->(e)

MATCH (p:Profesional {id: 'PRO002'}), (e:Especialidad {id: 'ESP002'})
CREATE (p)-[:ESPECIALIZADO_EN]->(e)

MATCH (p:Profesional {id: 'PRO003'}), (e:Especialidad {id: 'ESP004'})
CREATE (p)-[:ESPECIALIZADO_EN]->(e)

// Relaciones entre pacientes y consultas
MATCH (p:Paciente {id: 'PAC001'}), (c:Consulta {id: 'CON001'})
CREATE (p)-[:ASISTE_A]->(c)

MATCH (p:Paciente {id: 'PAC002'}), (c:Consulta {id: 'CON002'})
CREATE (p)-[:ASISTE_A]->(c)

MATCH (p:Paciente {id: 'PAC003'}), (c:Consulta {id: 'CON003'})
CREATE (p)-[:ASISTE_A]->(c)

// Relaciones entre profesionales y consultas
MATCH (p:Profesional {id: 'PRO001'}), (c:Consulta {id: 'CON001'})
CREATE (p)-[:ATIENDE]->(c)

MATCH (p:Profesional {id: 'PRO002'}), (c:Consulta {id: 'CON002'})
CREATE (p)-[:ATIENDE]->(c)

MATCH (p:Profesional {id: 'PRO003'}), (c:Consulta {id: 'CON003'})
CREATE (p)-[:ATIENDE]->(c)

// Relaciones entre consultas y diagnósticos
MATCH (c:Consulta {id: 'CON001'}), (d:Diagnostico {id: 'DIA001'})
CREATE (c)-[:DIAGNOSTICA]->(d)

MATCH (c:Consulta {id: 'CON002'}), (d:Diagnostico {id: 'DIA002'})
CREATE (c)-[:DIAGNOSTICA]->(d)

MATCH (c:Consulta {id: 'CON003'}), (d:Diagnostico {id: 'DIA003'})
CREATE (c)-[:DIAGNOSTICA]->(d)

// Relaciones entre consultas y tratamientos
MATCH (c:Consulta {id: 'CON001'}), (t:Tratamiento {id: 'TRA001'})
CREATE (c)-[:PRESCRIBE]->(t)

MATCH (c:Consulta {id: 'CON002'}), (t:Tratamiento {id: 'TRA002'})
CREATE (c)-[:PRESCRIBE]->(t)

MATCH (c:Consulta {id: 'CON003'}), (t:Tratamiento {id: 'TRA003'})
CREATE (c)-[:PRESCRIBE]->(t)

// Relaciones entre tratamientos y medicamentos
MATCH (t:Tratamiento {id: 'TRA001'}), (m:Medicamento {id: 'MED001'})
CREATE (t)-[:INCLUYE {dosificacion: '1 comprimido cada 12 horas', duracion: '30 días'}]->(m)

MATCH (t:Tratamiento {id: 'TRA003'}), (m:Medicamento {id: 'MED002'})
CREATE (t)-[:INCLUYE {dosificacion: '1 comprimido cada 8 horas', duracion: '7 días'}]->(m)

// Relaciones entre consultas y estudios
MATCH (c:Consulta {id: 'CON001'}), (e:Estudio {id: 'EST001'})
CREATE (c)-[:SOLICITA]->(e)

MATCH (c:Consulta {id: 'CON001'}), (e:Estudio {id: 'EST002'})
CREATE (c)-[:SOLICITA]->(e)

MATCH (c:Consulta {id: 'CON003'}), (e:Estudio {id: 'EST003'})
CREATE (c)-[:SOLICITA]->(e)

// Relaciones entre estudios y resultados
MATCH (e:Estudio {id: 'EST001'}), (r:Resultado {id: 'RES001'})
CREATE (e)-[:TIENE_RESULTADO]->(r)

MATCH (e:Estudio {id: 'EST002'}), (r:Resultado {id: 'RES002'})
CREATE (e)-[:TIENE_RESULTADO]->(r)

MATCH (e:Estudio {id: 'EST003'}), (r:Resultado {id: 'RES003'})
CREATE (e)-[:TIENE_RESULTADO]->(r)

// Relaciones entre consultas y documentos
MATCH (c:Consulta {id: 'CON001'}), (d:Documento {id: 'DOC001'})
CREATE (c)-[:TIENE_DOCUMENTO]->(d)

MATCH (c:Consulta {id: 'CON001'}), (d:Documento {id: 'DOC002'})
CREATE (c)-[:TIENE_DOCUMENTO]->(d)

MATCH (c:Consulta {id: 'CON003'}), (d:Documento {id: 'DOC003'})
CREATE (c)-[:TIENE_DOCUMENTO]->(d)

// Relaciones entre pacientes e historiales médicos (diagnósticos previos)
MATCH (p:Paciente {id: 'PAC001'}), (d:Diagnostico {id: 'DIA001'})
CREATE (p)-[:TIENE_HISTORIAL {desde: '2025-04-10'}]->(d)

MATCH (p:Paciente {id: 'PAC002'}), (d:Diagnostico {id: 'DIA002'})
CREATE (p)-[:TIENE_HISTORIAL {desde: '2024-10-15'}]->(d)

// Relaciones entre diagnósticos relacionados
MATCH (d1:Diagnostico {id: 'DIA001'}), (d2:Diagnostico {codigo: 'I25.9'})
CREATE (d1)-[:RELACIONADO_CON {tipo: 'complicación'}]->(d2)

// EJEMPLOS DE CONSULTAS ÚTILES PARA EL SISTEMA

// 1. Obtener el historial médico completo de un paciente
// MATCH (p:Paciente {id: 'PAC001'})-[:ASISTE_A]->(c:Consulta)-[:DIAGNOSTICA]->(d:Diagnostico)
// RETURN p.nombre, p.apellido, c.fecha, d.descripcion ORDER BY c.fecha DESC

// 2. Encontrar todos los medicamentos prescritos a un paciente
// MATCH (p:Paciente {id: 'PAC001'})-[:ASISTE_A]->(c:Consulta)-[:PRESCRIBE]->(t:Tratamiento)-[:INCLUYE]->(m:Medicamento)
// RETURN p.nombre, p.apellido, m.nombre, m.dosis

// 3. Encontrar todos los pacientes atendidos por un médico específico
// MATCH (pr:Profesional {id: 'PRO001'})-[:ATIENDE]->(c:Consulta)<-[:ASISTE_A]-(p:Paciente)
// RETURN DISTINCT p.nombre, p.apellido, p.id

// 4. Encontrar todos los diagnósticos y sus tratamientos asociados para un paciente
// MATCH (p:Paciente {id: 'PAC001'})-[:ASISTE_A]->(c:Consulta)-[:DIAGNOSTICA]->(d:Diagnostico),
//       (c)-[:PRESCRIBE]->(t:Tratamiento)
// RETURN p.nombre, p.apellido, d.descripcion, t.descripcion

// 5. Encontrar todos los estudios y resultados de un paciente
// MATCH (p:Paciente {id: 'PAC001'})-[:ASISTE_A]->(c:Consulta)-[:SOLICITA]->(e:Estudio)-[:TIENE_RESULTADO]->(r:Resultado)
// RETURN p.nombre, p.apellido, e.tipo, r.valor, r.fechaResultado ORDER BY r.fechaResultado DESC
