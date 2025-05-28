CREATE CONSTRAINT paciente_id IF NOT EXISTS FOR (p:Paciente) REQUIRE p.id IS UNIQUE;
CREATE CONSTRAINT paciente_dni IF NOT EXISTS FOR (p:Paciente) REQUIRE p.dni IS UNIQUE;
CREATE CONSTRAINT profesional_id IF NOT EXISTS FOR (p:Profesional) REQUIRE p.id IS UNIQUE;
CREATE CONSTRAINT profesional_matricula IF NOT EXISTS FOR (p:Profesional) REQUIRE p.matricula IS UNIQUE;
CREATE CONSTRAINT consulta_id IF NOT EXISTS FOR (c:Consulta) REQUIRE c.id IS UNIQUE;
CREATE CONSTRAINT diagnostico_id IF NOT EXISTS FOR (d:Diagnostico) REQUIRE d.id IS UNIQUE;
CREATE CONSTRAINT tratamiento_id IF NOT EXISTS FOR (t:Tratamiento) REQUIRE t.id IS UNIQUE;
CREATE CONSTRAINT estudio_id IF NOT EXISTS FOR (e:Estudio) REQUIRE e.id IS UNIQUE;
CREATE CONSTRAINT resultado_id IF NOT EXISTS FOR (r:Resultado) REQUIRE r.id IS UNIQUE;
CREATE CONSTRAINT documento_id IF NOT EXISTS FOR (d:Documento) REQUIRE d.id IS UNIQUE;
CREATE CONSTRAINT medicamento_id IF NOT EXISTS FOR (m:Medicamento) REQUIRE m.id IS UNIQUE;
CREATE CONSTRAINT especialidad_id IF NOT EXISTS FOR (e:Especialidad) REQUIRE e.id IS UNIQUE;
CREATE CONSTRAINT centro_medico_id IF NOT EXISTS FOR (c:CentroMedico) REQUIRE c.id IS UNIQUE;
CREATE CONSTRAINT seguro_id IF NOT EXISTS FOR (s:SeguroMedico) REQUIRE s.id IS UNIQUE;
CREATE CONSTRAINT laboratorio_id IF NOT EXISTS FOR (l:Laboratorio) REQUIRE l.id IS UNIQUE;

CREATE INDEX idx_paciente_apellido IF NOT EXISTS FOR (p:Paciente) ON (p.apellido);
CREATE INDEX idx_consulta_fecha IF NOT EXISTS FOR (c:Consulta) ON (c.fecha);
CREATE INDEX idx_profesional_apellido IF NOT EXISTS FOR (p:Profesional) ON (p.apellido);
CREATE INDEX idx_diagnostico_codigo IF NOT EXISTS FOR (d:Diagnostico) ON (d.codigoCIE10);

CREATE (e1:Especialidad {
  id: 'ESP001',
  nombre: 'Cardiología',
  descripcion: 'Especialidad médica dedicada al diagnóstico y tratamiento de enfermedades del corazón y sistema circulatorio',
  areaConocimiento: 'Medicina Interna',
  requiereResidencia: true,
  duracionFormacion: 4
});

CREATE (e2:Especialidad {
  id: 'ESP002',
  nombre: 'Dermatología',
  descripcion: 'Especialidad médica dedicada al estudio de la estructura, función y enfermedades de la piel',
  areaConocimiento: 'Medicina Clínica',
  requiereResidencia: true,
  duracionFormacion: 4
});

CREATE (e3:Especialidad {
  id: 'ESP003',
  nombre: 'Pediatría',
  descripcion: 'Especialidad médica dedicada a la salud y enfermedades de niños, adolescentes y jóvenes',
  areaConocimiento: 'Medicina Clínica',
  requiereResidencia: true,
  duracionFormacion: 3
});

CREATE (e4:Especialidad {
  id: 'ESP004',
  nombre: 'Traumatología y Ortopedia',
  descripcion: 'Especialidad quirúrgica dedicada al tratamiento de lesiones del aparato locomotor',
  areaConocimiento: 'Cirugía',
  requiereResidencia: true,
  duracionFormacion: 5
});

CREATE (e5:Especialidad {
  id: 'ESP005',
  nombre: 'Medicina General',
  descripcion: 'Atención médica integral y continuada del individuo y la familia',
  areaConocimiento: 'Medicina Familiar',
  requiereResidencia: false,
  duracionFormacion: 0
});

CREATE (cm1:CentroMedico {
  id: 'CM001',
  nombre: 'Hospital General San Martín',
  direccion: 'Av. Las Heras 2670, CABA',
  telefono: '+541143723456',
  email: 'info@hospitalsanmartin.gov.ar',
  tipo: 'Hospital Público',
  nivelComplejidad: 'Alta',
  camas: 350,
  fechaInauguracion: date('1952-10-17'),
  serviciosDisponibles: ['Emergencias', 'Cirugía', 'Terapia Intensiva', 'Maternidad', 'Pediatría']
});

CREATE (cm2:CentroMedico {
  id: 'CM002',
  nombre: 'Clínica Privada Del Sol',
  direccion: 'Av. Córdoba 1890, CABA',
  telefono: '+541148765432',
  email: 'contacto@clinicadelsol.com.ar',
  tipo: 'Clínica Privada',
  nivelComplejidad: 'Media',
  camas: 120,
  fechaInauguracion: date('1985-06-15'),
  serviciosDisponibles: ['Consultorios Externos', 'Cirugía Ambulatoria', 'Diagnóstico por Imágenes']
});

CREATE (lab1:Laboratorio {
  id: 'LAB001',
  nombre: 'Laboratorio Central de Análisis Clínicos',
  direccion: 'Av. Rivadavia 1234, CABA',
  telefono: '+541143456789',
  email: 'info@labcentral.com.ar',
  especialidades: ['Hematología', 'Bioquímica', 'Microbiología', 'Inmunología'],
  certificaciones: ['ISO 9001', 'ISO 15189'],
  horarioAtencion: '6:00-18:00'
});

CREATE (seg1:SeguroMedico {
  id: 'SEG001',
  nombre: 'OSDE',
  tipo: 'Obra Social',
  cobertura: 'Nacional',
  planBasico: 'Plan 210',
  costoMensual: 45000.00,
  coberturaPorcentaje: 80
});

CREATE (seg2:SeguroMedico {
  id: 'SEG002',
  nombre: 'Swiss Medical',
  tipo: 'Prepaga',
  cobertura: 'Nacional',
  planBasico: 'SMG1',
  costoMensual: 65000.00,
  coberturaPorcentaje: 90
});

CREATE (p1:Profesional {
  id: 'PRO001',
  nombre: 'María Elena',
  apellido: 'González Fernández',
  matricula: 'MN12345',
  email: 'maria.gonzalez@clinica.com',
  telefono: '+54911555123456',
  dni: '25678901',
  fechaNacimiento: date('1975-08-20'),
  genero: 'Femenino',
  direccion: 'Av. Callao 1856, CABA',
  fechaGraduacion: date('2000-12-15'),
  universidad: 'Universidad de Buenos Aires',
  añosExperiencia: 24,
  idiomas: ['Español', 'Inglés', 'Portugués'],
  consultorioParticular: true,
  horarioAtencion: 'Lunes a Viernes 9:00-17:00',
  valorConsulta: 25000.00,
  estado: 'Activo'
});

CREATE (p2:Profesional {
  id: 'PRO002',
  nombre: 'Carlos Alberto',
  apellido: 'Rodríguez Silva',
  matricula: 'MN23456',
  email: 'carlos.rodriguez@clinica.com',
  telefono: '+54911555234567',
  dni: '22345678',
  fechaNacimiento: date('1968-03-12'),
  genero: 'Masculino',
  direccion: 'Juncal 2847, CABA',
  fechaGraduacion: date('1995-07-20'),
  universidad: 'Universidad del Salvador',
  añosExperiencia: 29,
  idiomas: ['Español', 'Inglés'],
  consultorioParticular: true,
  horarioAtencion: 'Martes y Jueves 14:00-19:00',
  valorConsulta: 30000.00,
  estado: 'Activo'
});

CREATE (p3:Profesional {
  id: 'PRO003',
  nombre: 'Laura Beatriz',
  apellido: 'Martínez López',
  matricula: 'MN34567',
  email: 'laura.martinez@clinica.com',
  telefono: '+54911555345678',
  dni: '28456789',
  fechaNacimiento: date('1980-11-05'),
  genero: 'Femenino',
  direccion: 'Av. Santa Fe 2456, CABA',
  fechaGraduacion: date('2005-03-10'),
  universidad: 'Universidad Católica Argentina',
  añosExperiencia: 19,
  idiomas: ['Español', 'Francés'],
  consultorioParticular: false,
  horarioAtencion: 'Lunes a Miércoles 8:00-16:00',
  valorConsulta: 22000.00,
  estado: 'Activo'
});

CREATE (pac1:Paciente {
  id: 'PAC001',
  nombre: 'Juan Carlos',
  apellido: 'Pérez Morales',
  dni: '20345678',
  fechaNacimiento: date('1980-05-15'),
  genero: 'Masculino',
  direccion: 'Av. Corrientes 1234, CABA',
  telefono: '+54911555111222',
  email: 'juan.perez@email.com',
  celular: '+54911555111333',
  grupoSanguineo: 'A+',
  factorRH: 'Positivo',
  alergias: ['Penicilina', 'Mariscos'],
  enfermedadesCronicas: ['Hipertensión Arterial'],
  medicacionHabitual: ['Enalapril 10mg'],
  contactoEmergencia: 'Ana Pérez - Esposa - +54911555444555',
  ocupacion: 'Contador Público',
  nivelEducativo: 'Universitario',
  estadoCivil: 'Casado',
  numeroHijos: 2,
  fechaRegistro: datetime('2023-01-15T10:30:00'),
  estado: 'Activo'
});

CREATE (pac2:Paciente {
  id: 'PAC002',
  nombre: 'Ana María',
  apellido: 'López Vega',
  dni: '25678901',
  fechaNacimiento: date('1990-10-20'),
  genero: 'Femenino',
  direccion: 'Av. Rivadavia 5678, CABA',
  telefono: '+54911555222333',
  email: 'ana.lopez@email.com',
  celular: '+54911555222444',
  grupoSanguineo: 'O-',
  factorRH: 'Negativo',
  alergias: [],
  enfermedadesCronicas: [],
  medicacionHabitual: [],
  contactoEmergencia: 'Pedro López - Padre - +54911555666777',
  ocupacion: 'Diseñadora Gráfica',
  nivelEducativo: 'Universitario',
  estadoCivil: 'Soltera',
  numeroHijos: 0,
  fechaRegistro: datetime('2023-02-20T14:15:00'),
  estado: 'Activo'
});

CREATE (pac3:Paciente {
  id: 'PAC003',
  nombre: 'Miguel Ángel',
  apellido: 'Torres Ruiz',
  dni: '18234567',
  fechaNacimiento: date('1975-03-08'),
  genero: 'Masculino',
  direccion: 'Av. Santa Fe 9012, CABA',
  telefono: '+54911555333444',
  email: 'miguel.torres@email.com',
  celular: '+54911555333555',
  grupoSanguineo: 'B+',
  factorRH: 'Positivo',
  alergias: ['Sulfas', 'Látex'],
  enfermedadesCronicas: ['Diabetes Tipo 2', 'Dislipidemia'],
  medicacionHabitual: ['Metformina 850mg', 'Atorvastatina 20mg'],
  contactoEmergencia: 'Carmen Torres - Esposa - +54911555777888',
  ocupacion: 'Ingeniero Civil',
  nivelEducativo: 'Universitario',
  estadoCivil: 'Casado',
  numeroHijos: 3,
  fechaRegistro: datetime('2022-11-10T09:45:00'),
  estado: 'Activo'
});

CREATE (med1:Medicamento {
  id: 'MED001',
  nombre: 'Atenolol',
  nombreComercial: 'Tenormin',
  presentacion: 'Comprimidos 50mg',
  principioActivo: 'Atenolol',
  laboratorioFabricante: 'Roemmers',
  codigoATC: 'C07AB03',
  grupoTerapeutico: 'Beta-bloqueantes selectivos',
  viaAdministracion: 'Oral',
  requiereReceta: true,
  precio: 1200.00,
  contraindicaciones: ['Asma bronquial', 'Bradicardia severa'],
  efectosAdversos: ['Fatiga', 'Bradicardia', 'Hipotensión']
});

CREATE (med2:Medicamento {
  id: 'MED002',
  nombre: 'Ibuprofeno',
  nombreComercial: 'Advil',
  presentacion: 'Comprimidos 400mg',
  principioActivo: 'Ibuprofeno',
  laboratorioFabricante: 'Pfizer',
  codigoATC: 'M01AE01',
  grupoTerapeutico: 'Antiinflamatorios no esteroideos',
  viaAdministracion: 'Oral',
  requiereReceta: false,
  precio: 800.00,
  contraindicaciones: ['Úlcera péptica activa', 'Insuficiencia renal severa'],
  efectosAdversos: ['Molestias gastrointestinales', 'Cefalea']
});

CREATE (med3:Medicamento {
  id: 'MED003',
  nombre: 'Amoxicilina',
  nombreComercial: 'Amoxidal',
  presentacion: 'Cápsulas 500mg',
  principioActivo: 'Amoxicilina',
  laboratorioFabricante: 'Bago',
  codigoATC: 'J01CA04',
  grupoTerapeutico: 'Penicilinas de amplio espectro',
  viaAdministracion: 'Oral',
  requiereReceta: true,
  precio: 1500.00,
  contraindicaciones: ['Alergia a penicilinas'],
  efectosAdversos: ['Diarrea', 'Náuseas', 'Erupciones cutáneas']
});

CREATE (c1:Consulta {
  id: 'CON001',
  fecha: date('2025-04-10'),
  hora: time('09:30:00'),
  motivoConsulta: 'Dolor precordial de características opresivas',
  anamnesis: 'Paciente masculino de 44 años que consulta por dolor en región precordial de 2 horas de evolución, de tipo opresivo, irradiado a brazo izquierdo, acompañado de sudoración profusa y náuseas. Antecedentes de HTA en tratamiento.',
  examenFisico: 'Paciente consciente, orientado, sudoroso. PA: 160/95 mmHg, FC: 95 lpm, FR: 20 rpm, Sat O2: 98%. Auscultación cardíaca: ruidos cardíacos rítmicos, soplo sistólico grado II/VI. Resto del examen físico sin particularidades.',
  impresionDiagnostica: 'Síndrome coronario agudo a descartar',
  planTerapeutico: 'Solicitud de estudios complementarios urgentes, medicación sintomática y derivación a cardiología',
  tipoConsulta: 'Presencial',
  duracionMinutos: 45,
  estadoConsulta: 'Finalizada',
  costoConsulta: 25000.00,
  fechaCreacion: datetime('2025-04-10T09:30:00'),
  observaciones: 'Paciente derivado a guardia para evaluación cardiológica urgente'
});

CREATE (c2:Consulta {
  id: 'CON002',
  fecha: date('2025-04-15'),
  hora: time('14:00:00'),
  motivoConsulta: 'Control y seguimiento de psoriasis',
  anamnesis: 'Paciente femenina de 34 años en seguimiento por psoriasis vulgar diagnosticada hace 2 años. Consulta para control evolutivo. Refiere mejoría parcial de las lesiones con el tratamiento tópico indicado.',
  examenFisico: 'Placas eritematodescamativas en codos y rodillas de menor tamaño que en consulta previa. Índice PASI: 8 (previo: 12). Sin lesiones nuevas. Uñas sin compromiso.',
  impresionDiagnostica: 'Psoriasis vulgar en tratamiento, evolución favorable',
  planTerapeutico: 'Continuar con tratamiento tópico actual, control en 3 meses',
  tipoConsulta: 'Presencial',
  duracionMinutos: 30,
  estadoConsulta: 'Finalizada',
  costoConsulta: 30000.00,
  fechaCreacion: datetime('2025-04-15T14:00:00'),
  observaciones: 'Buena adherencia al tratamiento, paciente satisfecha con evolución'
});

CREATE (c3:Consulta {
  id: 'CON003',
  fecha: date('2025-04-20'),
  hora: time('10:15:00'),
  motivoConsulta: 'Lumbalgia mecánica post-ejercicio',
  anamnesis: 'Paciente masculino de 50 años, sedentario, que presenta dolor lumbar de inicio súbito luego de actividad física (mudanza). Dolor de tipo mecánico, aumenta con movimientos, mejora con reposo. EVA: 7/10.',
  examenFisico: 'Paciente con actitud antiálgica. Contractura paravertebral L4-L5. Lasègue negativo bilateral. Reflejos osteotendinosos conservados. Fuerza muscular conservada en MMII.',
  impresionDiagnostica: 'Lumbalgia mecánica aguda',
  planTerapeutico: 'Reposo relativo, calor local, antiinflamatorios, fisioterapia',
  tipoConsulta: 'Telemedicina',
  duracionMinutos: 25,
  estadoConsulta: 'Finalizada',
  costoConsulta: 22000.00,
  fechaCreacion: datetime('2025-04-20T10:15:00'),
  observaciones: 'Paciente instruido sobre ejercicios de fortalecimiento lumbar'
});

CREATE (d1:Diagnostico {
  id: 'DIA001',
  codigoCIE10: 'I20.9',
  descripcion: 'Angina de pecho no especificada',
  tipodiagnostico: 'Principal',
  fechaDiagnostico: date('2025-04-10'),
  gravedad: 'Moderada',
  estadoEvolucion: 'Estable',
  certezaDiagnostica: 'Probable',
  metodoDiagnostico: 'Clínico + Complementarios',
  observaciones: 'Diagnóstico presuntivo basado en clínica y alteraciones electrocardiográficas',
  requiereSeguimiento: true,
  fechaRevision: date('2025-05-10')
});

CREATE (d2:Diagnostico {
  id: 'DIA002',
  codigoCIE10: 'L40.0',
  descripcion: 'Psoriasis vulgar',
  tipodiagnostico: 'Principal',
  fechaDiagnostico: date('2023-03-15'),
  gravedad: 'Leve',
  estadoEvolucion: 'Mejoría',
  certezaDiagnostica: 'Confirmado',
  metodoDiagnostico: 'Clínico + Histopatológico',
  observaciones: 'Psoriasis de distribución típica, respuesta favorable a tratamiento tópico',
  requiereSeguimiento: true,
  fechaRevision: date('2025-07-15')
});

CREATE (d3:Diagnostico {
  id: 'DIA003',
  codigoCIE10: 'M54.5',
  descripcion: 'Lumbalgia no especificada',
  tipodiagnostico: 'Principal',
  fechaDiagnostico: date('2025-04-20'),
  gravedad: 'Leve',
  estadoEvolucion: 'Agudo',
  certezaDiagnostica: 'Confirmado',
  metodoDiagnostico: 'Clínico',
  observaciones: 'Lumbalgia mecánica de probable origen muscular',
  requiereSeguimiento: true,
  fechaRevision: date('2025-05-05')
});

CREATE (t1:Tratamiento {
  id: 'TRA001',
  descripcion: 'Tratamiento médico para síndrome coronario agudo',
  tipoTratamiento: 'Farmacológico',
  fechaInicio: date('2025-04-10'),
  fechaFinPrevista: date('2025-07-10'),
  estadoTratamiento: 'Activo',
  objetivoTerapeutico: 'Control de síntomas anginosos y prevención de eventos cardiovasculares',
  instrucciones: 'Tomar medicación según indicación médica, dieta hiposódica, actividad física gradual bajo supervisión médica',
  controles: 'Control cardiológico mensual, laboratorio cada 3 meses',
  observaciones: 'Paciente educado sobre signos de alarma',
  costoTratamiento: 15000.00
});

CREATE (t2:Tratamiento {
  id: 'TRA002',
  descripcion: 'Tratamiento tópico para psoriasis',
  tipoTratamiento: 'Tópico',
  fechaInicio: date('2023-03-15'),
  fechaFinPrevista: date('2025-12-31'),
  estadoTratamiento: 'Activo',
  objetivoTerapeutico: 'Control de lesiones psoriásicas y prevención de brotes',
  instrucciones: 'Aplicar crema en lesiones dos veces al día después del baño, evitar traumatismos en la piel',
  controles: 'Control dermatológico cada 3 meses',
  observaciones: 'Buena tolerancia al tratamiento, mejoría progresiva',
  costoTratamiento: 8000.00
});

CREATE (t3:Tratamiento {
  id: 'TRA003',
  descripcion: 'Tratamiento conservador para lumbalgia',
  tipoTratamiento: 'Multimodal',
  fechaInicio: date('2025-04-20'),
  fechaFinPrevista: date('2025-05-20'),
  estadoTratamiento: 'Activo',
  objetivoTerapeutico: 'Alivio del dolor y recuperación funcional',
  instrucciones: 'Reposo relativo 48hs, luego actividad gradual. Aplicar calor local 20 min 3 veces/día. Evitar cargas pesadas',
  controles: 'Reevaluación en 1 semana, fisioterapia según evolución',
  observaciones: 'Evolución esperada 7-14 días',
  costoTratamiento: 5000.00
});

CREATE (est1:Estudio {
  id: 'EST001',
  tipo: 'Electrocardiograma',
  descripcion: 'ECG de 12 derivaciones en reposo',
  fechaSolicitud: date('2025-04-10'),
  fechaRealizacion: date('2025-04-10'),
  estadoEstudio: 'Realizado',
  prioridad: 'Urgente',
  centroRealizacion: 'Hospital General San Martín',
  profesionalSolicitante: 'Dra. María Elena González',
  costoEstudio: 3000.00,
  requierePreparacion: false,
  observacionesPrevias: 'Paciente con dolor precordial activo'
});

CREATE (est2:Estudio {
  id: 'EST002',
  tipo: 'Laboratorio',
  descripcion: 'Hemograma completo, glucemia, perfil lipídico, enzimas cardíacas',
  fechaSolicitud: date('2025-04-10'),
  fechaRealizacion: date('2025-04-11'),
  estadoEstudio: 'Realizado',
  prioridad: 'Urgente',
  centroRealizacion: 'Laboratorio Central',
  profesionalSolicitante: 'Dra. María Elena González',
  costoEstudio: 8500.00,
  requierePreparacion: true,
  observacionesPrevias: 'Ayuno de 12 horas'
});

CREATE (est3:Estudio {
  id: 'EST003',
  tipo: 'Radiografía',
  descripcion: 'Radiografía de columna lumbosacra frente y perfil',
  fechaSolicitud: date('2025-04-20'),
  fechaRealizacion: date('2025-04-21'),
  estadoEstudio: 'Realizado',
  prioridad: 'Normal',
  centroRealizacion: 'Clínica Privada Del Sol',
  profesionalSolicitante: 'Dra. Laura Beatriz Martínez',
  costoEstudio: 5500.00,
  requierePreparacion: false,
  observacionesPrevias: 'Paciente con lumbalgia mecánica'
});

CREATE (res1:Resultado {
  id: 'RES001',
  parametro: 'Interpretación ECG',
  valor: 'Alteraciones de la repolarización en derivaciones precordiales',
  unidad: 'N/A',
  fechaResultado: datetime('2025-04-10T10:30:00'),
  valorReferencia: 'Trazado normal',
  estadoResultado: 'Anormal',
  observaciones: 'Cambios ST-T sugestivos de isquemia subepicárdica en cara anterior',
  requiereAccion: true,
  criticidad: 'Alta'
});

CREATE (res2:Resultado {
  id: 'RES002',
  parametro: 'Hemoglobina',
  valor: '14.2',
  unidad: 'g/dL',
  fechaResultado: datetime('2025-04-11T08:15:00'),
  valorReferencia: '12.0-16.0',
  estadoResultado: 'Normal',
  observaciones: 'Dentro de parámetros normales para sexo masculino',
  requiereAccion: false,
  criticidad: 'Normal'
});

CREATE (res3:Resultado {
  id: 'RES003',
  parametro: 'Troponina I',
  valor: '0.08',
  unidad: 'ng/mL',
  fechaResultado: datetime('2025-04-11T08:15:00'),
  valorReferencia: '<0.04',
  estadoResultado: 'Elevado',
  observaciones: 'Valor elevado compatible con daño miocárdico',
  requiereAccion: true,
  criticidad: 'Alta'
});

CREATE (res4:Resultado {
  id: 'RES004',
  parametro: 'Interpretación Radiológica',
  valor: 'Rectificación de la lordosis fisiológica lumbar',
  unidad: 'N/A',
  fechaResultado: datetime('2025-04-21T14:20:00'),
  valorReferencia: 'Columna lumbar normal',
  estadoResultado: 'Alteración leve',
  observaciones: 'Sin evidencia de fracturas, luxaciones o lesiones óseas. Espacios discales conservados',
  requiereAccion: false,
  criticidad: 'Baja'
});

CREATE (doc1:Documento {
  id: 'DOC001',
  tipo: 'Informe médico',
  titulo: 'Informe de Evaluación Cardiológica',
  contenido: 'Paciente masculino de 44 años con cuadro clínico compatible con síndrome coronario agudo. ECG con alteraciones de la repolarización. Enzimas cardíacas elevadas. Se indica tratamiento médico y seguimiento estrecho.',
  fechaCreacion: datetime('2025-04-10T16:00:00'),
  autorDocumento: 'Dra. María Elena González Fernández',
  estadoDocumento: 'Firmado',
  confidencialidad: 'Médico-Paciente',
  versionDocumento: '1.0'
});

CREATE (doc2:Documento {
  id: 'DOC002',
  tipo: 'Receta médica',
  titulo: 'Prescripción Médica - Tratamiento Cardiológico',
  contenido: 'RP/ Atenolol 50mg - Tomar 1 comprimido cada 12 horas por vía oral. Cantidad: 60 comprimidos. Duración: 30 días.',
  fechaCreacion: datetime('2025-04-10T16:30:00'),
  autorDocumento: 'Dra. María Elena González Fernández',
  estadoDocumento: 'Firmado',
  confidencialidad: 'Médico-Paciente',
  versionDocumento: '1.0'
});

CREATE (doc3:Documento {
  id: 'DOC003',
  tipo: 'Certificado médico',
  titulo: 'Certificado de Reposo Laboral',
  contenido: 'Se certifica que el paciente Miguel Ángel Torres debe guardar reposo laboral por el término de 7 días corridos debido a lumbalgia aguda, a partir del 20/04/2025.',
  fechaCreacion: datetime('2025-04-20T11:00:00'),
  autorDocumento: 'Dra. Laura Beatriz Martínez López',
  estadoDocumento: 'Firmado',
  confidencialidad: 'Médico-Paciente',
  versionDocumento: '1.0'
});

CREATE (doc4:Documento {
  id: 'DOC004',
  tipo: 'Orden de estudios',
  titulo: 'Solicitud de Estudios Complementarios',
  contenido: 'Se solicita: 1) ECG de 12 derivaciones urgente, 2) Laboratorio: hemograma, glucemia, perfil lipídico, enzimas cardíacas. Diagnóstico presuntivo: Síndrome coronario agudo.',
  fechaCreacion: datetime('2025-04-10T09:45:00'),
  autorDocumento: 'Dra. María Elena González Fernández',
  estadoDocumento: 'Firmado',
  confidencialidad: 'Médico-Paciente',
  versionDocumento: '1.0'
});

MATCH (p:Profesional {id: 'PRO001'}), (e:Especialidad {id: 'ESP001'})
CREATE (p)-[:ESPECIALIZADO_EN {fechaCertificacion: date('2004-12-20'), institucionCertificante: 'Sociedad Argentina de Cardiología'}]->(e);

MATCH (p:Profesional {id: 'PRO002'}), (e:Especialidad {id: 'ESP002'})
CREATE (p)-[:ESPECIALIZADO_EN {fechaCertificacion: date('1999-07-15'), institucionCertificante: 'Sociedad Argentina de Dermatología'}]->(e);

MATCH (p:Profesional {id: 'PRO003'}), (e:Especialidad {id: 'ESP004'})
CREATE (p)-[:ESPECIALIZADO_EN {fechaCertificacion: date('2010-03-22'), institucionCertificante: 'Asociación Argentina de Ortopedia y Traumatología'}]->(e);

MATCH (p:Profesional {id: 'PRO001'}), (cm:CentroMedico {id: 'CM001'})
CREATE (p)-[:TRABAJA_EN {cargo: 'Médica de Planta', fechaIngreso: date('2005-03-01'), tipoContrato: 'Planta Permanente', horario: 'Mañana'}]->(cm);

MATCH (p:Profesional {id: 'PRO002'}), (cm:CentroMedico {id: 'CM002'})
CREATE (p)-[:TRABAJA_EN {cargo: 'Jefe de Servicio', fechaIngreso: date('2010-01-15'), tipoContrato: 'Staff Médico', horario: 'Tarde'}]->(cm);

MATCH (p:Profesional {id: 'PRO003'}), (cm:CentroMedico {id: 'CM001'})
CREATE (p)-[:TRABAJA_EN {cargo: 'Médica Residente Senior', fechaIngreso: date('2020-02-01'), tipoContrato: 'Residencia', horario: 'Rotativo'}]->(cm);

MATCH (pac:Paciente {id: 'PAC001'}), (seg:SeguroMedico {id: 'SEG001'})
CREATE (pac)-[:TIENE_COBERTURA {numeroAfiliado: 'OSDE-2034567801', fechaAfiliacion: date('2020-01-01'), planContratado: 'Plan 210', estadoAfiliacion: 'Activo'}]->(seg);

MATCH (pac:Paciente {id: 'PAC002'}), (seg:SeguroMedico {id: 'SEG002'})
CREATE (pac)-[:TIENE_COBERTURA {numeroAfiliado: 'SMG-2567890125', fechaAfiliacion: date('2022-06-15'), planContratado: 'SMG1', estadoAfiliacion: 'Activo'}]->(seg);

MATCH (p:Paciente {id: 'PAC001'}), (c:Consulta {id: 'CON001'})
CREATE (p)-[:ASISTE_A {puntualidad: 'A tiempo', acompañante: 'Ninguno', medioTransporte: 'Automóvil particular'}]->(c);

MATCH (p:Paciente {id: 'PAC002'}), (c:Consulta {id: 'CON002'})
CREATE (p)-[:ASISTE_A {puntualidad: 'A tiempo', acompañante: 'Ninguno', medioTransporte: 'Transporte público'}]->(c);

MATCH (p:Paciente {id: 'PAC003'}), (c:Consulta {id: 'CON003'})
CREATE (p)-[:ASISTE_A {puntualidad: 'A tiempo', acompañante: 'Ninguno', medioTransporte: 'Videollamada'}]->(c);

MATCH (p:Profesional {id: 'PRO001'}), (c:Consulta {id: 'CON001'})
CREATE (p)-[:ATIENDE {modalidad: 'Presencial', satisfaccionPaciente: 9, tiempoEspera: 10}]->(c);

MATCH (p:Profesional {id: 'PRO002'}), (c:Consulta {id: 'CON002'})
CREATE (p)-[:ATIENDE {modalidad: 'Presencial', satisfaccionPaciente: 10, tiempoEspera: 5}]->(c);

MATCH (p:Profesional {id: 'PRO003'}), (c:Consulta {id: 'CON003'})
CREATE (p)-[:ATIENDE {modalidad: 'Telemedicina', satisfaccionPaciente: 8, tiempoEspera: 0}]->(c);

MATCH (c:Consulta {id: 'CON001'}), (d:Diagnostico {id: 'DIA001'})
CREATE (c)-[:DIAGNOSTICA {certezaDiagnostica: 'Probable', metodoDiagnostico: 'Clínico + ECG + Laboratorio'}]->(d);

MATCH (c:Consulta {id: 'CON002'}), (d:Diagnostico {id: 'DIA002'})
CREATE (c)-[:DIAGNOSTICA {certezaDiagnostica: 'Confirmado', metodoDiagnostico: 'Clínico'}]->(d);

MATCH (c:Consulta {id: 'CON003'}), (d:Diagnostico {id: 'DIA003'})
CREATE (c)-[:DIAGNOSTICA {certezaDiagnostica: 'Confirmado', metodoDiagnostico: 'Clínico'}]->(d);

MATCH (c:Consulta {id: 'CON001'}), (t:Tratamiento {id: 'TRA001'})
CREATE (c)-[:PRESCRIBE {adherencia: 'Buena', seguimiento: 'Semanal', costoEstimado: 15000.00}]->(t);

MATCH (c:Consulta {id: 'CON002'}), (t:Tratamiento {id: 'TRA002'})
CREATE (c)-[:PRESCRIBE {adherencia: 'Excelente', seguimiento: 'Mensual', costoEstimado: 8000.00}]->(t);

MATCH (c:Consulta {id: 'CON003'}), (t:Tratamiento {id: 'TRA003'})
CREATE (c)-[:PRESCRIBE {adherencia: 'Buena', seguimiento: 'Semanal', costoEstimado: 5000.00}]->(t);

MATCH (t:Tratamiento {id: 'TRA001'}), (m:Medicamento {id: 'MED001'})
CREATE (t)-[:INCLUYE {dosificacion: '1 comprimido cada 12 horas', duracion: '30 días', viaAdministracion: 'Oral', observaciones: 'Tomar con alimentos'}]->(m);

MATCH (t:Tratamiento {id: 'TRA003'}), (m:Medicamento {id: 'MED002'})
CREATE (t)-[:INCLUYE {dosificacion: '1 comprimido cada 8 horas', duracion: '7 días', viaAdministracion: 'Oral', observaciones: 'Después de las comidas'}]->(m);

MATCH (c:Consulta {id: 'CON001'}), (e:Estudio {id: 'EST001'})
CREATE (c)-[:SOLICITA {urgencia: 'Inmediata', justificacion: 'Dolor precordial agudo', costoCubierto: true}]->(e);

MATCH (c:Consulta {id: 'CON001'}), (e:Estudio {id: 'EST002'})
CREATE (c)-[:SOLICITA {urgencia: 'Inmediata', justificacion: 'Sospecha SCA', costoCubierto: true}]->(e);

MATCH (c:Consulta {id: 'CON003'}), (e:Estudio {id: 'EST003'})
CREATE (c)-[:SOLICITA {urgencia: 'Normal', justificacion: 'Lumbalgia mecánica', costoCubierto: true}]->(e);

MATCH (e:Estudio {id: 'EST001'}), (r:Resultado {id: 'RES001'})
CREATE (e)-[:TIENE_RESULTADO {fechaInforme: datetime('2025-04-10T10:30:00'), profesionalInformante: 'Dr. Roberto Fernández', validadoAutomaticamente: false}]->(r);

MATCH (e:Estudio {id: 'EST002'}), (r:Resultado {id: 'RES002'})
CREATE (e)-[:TIENE_RESULTADO {fechaInforme: datetime('2025-04-11T08:15:00'), profesionalInformante: 'Bioq. Carmen López', validadoAutomaticamente: true}]->(r);

MATCH (e:Estudio {id: 'EST002'}), (r:Resultado {id: 'RES003'})
CREATE (e)-[:TIENE_RESULTADO {fechaInforme: datetime('2025-04-11T08:15:00'), profesionalInformante: 'Bioq. Carmen López', validadoAutomaticamente: true}]->(r);

MATCH (e:Estudio {id: 'EST003'}), (r:Resultado {id: 'RES004'})
CREATE (e)-[:TIENE_RESULTADO {fechaInforme: datetime('2025-04-21T14:20:00'), profesionalInformante: 'Dr. Pedro Ramírez', validadoAutomaticamente: false}]->(r);

MATCH (c:Consulta {id: 'CON001'}), (d:Documento {id: 'DOC001'})
CREATE (c)-[:GENERA_DOCUMENTO {tipoAutorizacion: 'Médico tratante', accesoPermitido: ['Paciente', 'Médicos'], fechaVencimiento: date('2030-04-10')}]->(d);

MATCH (c:Consulta {id: 'CON001'}), (d:Documento {id: 'DOC002'})
CREATE (c)-[:GENERA_DOCUMENTO {tipoAutorizacion: 'Médico tratante', accesoPermitido: ['Paciente', 'Farmacia'], fechaVencimiento: date('2025-05-10')}]->(d);

MATCH (c:Consulta {id: 'CON001'}), (d:Documento {id: 'DOC004'})
CREATE (c)-[:GENERA_DOCUMENTO {tipoAutorizacion: 'Médico tratante', accesoPermitido: ['Laboratorio', 'Servicios auxiliares'], fechaVencimiento: date('2025-05-10')}]->(d);

MATCH (c:Consulta {id: 'CON003'}), (d:Documento {id: 'DOC003'})
CREATE (c)-[:GENERA_DOCUMENTO {tipoAutorizacion: 'Médico tratante', accesoPermitido: ['Paciente', 'Empleador'], fechaVencimiento: date('2025-05-20')}]->(d);

MATCH (p:Paciente {id: 'PAC001'}), (d:Diagnostico {id: 'DIA001'})
CREATE (p)-[:TIENE_HISTORIAL {fechaInicio: date('2025-04-10'), estadoActual: 'En tratamiento', impactoCalidadVida: 'Moderado'}]->(d);

MATCH (p:Paciente {id: 'PAC002'}), (d:Diagnostico {id: 'DIA002'})
CREATE (p)-[:TIENE_HISTORIAL {fechaInicio: date('2023-03-15'), estadoActual: 'Controlado', impactoCalidadVida: 'Leve'}]->(d);

MATCH (p:Paciente {id: 'PAC003'}), (d:Diagnostico {id: 'DIA003'})
CREATE (p)-[:TIENE_HISTORIAL {fechaInicio: date('2025-04-20'), estadoActual: 'En tratamiento', impactoCalidadVida: 'Moderado'}]->(d);

MATCH (lab:Laboratorio {id: 'LAB001'}), (est:Estudio {id: 'EST002'})
CREATE (lab)-[:PROCESA_ESTUDIO {fechaProcesamiento: date('2025-04-11'), tiempoProcesamientoHoras: 12, tecnicoResponsable: 'Téc. Ana Rodríguez'}]->(est);

MATCH (cm:CentroMedico {id: 'CM001'}), (est:Estudio {id: 'EST001'})
CREATE (cm)-[:REALIZA_ESTUDIO {fechaRealizacion: date('2025-04-10'), equipoUtilizado: 'Electrocardiografo Phillips', operadorEquipo: 'Téc. José García'}]->(est);

MATCH (d1:Diagnostico {id: 'DIA001'}), (d2:Diagnostico {codigo: 'I25.9'})
CREATE (d1)-[:RELACIONADO_CON {tipoRelacion: 'Evolución natural', probabilidadProgresion: 'Media', tiempoEstimado: '2-5 años'}]->(d2);

CREATE (pac4:Paciente {
  id: 'PAC004',
  nombre: 'Sofía Elena',
  apellido: 'Ramírez Castro',
  dni: '30456789',
  fechaNacimiento: date('1995-07-12'),
  genero: 'Femenino',
  direccion: 'Thames 1850, Palermo, CABA',
  telefono: '+54911555999888',
  email: 'sofia.ramirez@email.com',
  celular: '+54911555999777',
  grupoSanguineo: 'AB+',
  factorRH: 'Positivo',
  alergias: ['Aspirina'],
  enfermedadesCronicas: [],
  medicacionHabitual: ['Anticonceptivos orales'],
  contactoEmergencia: 'Elena Castro - Madre - +54911555666555',
  ocupacion: 'Abogada',
  nivelEducativo: 'Universitario',
  estadoCivil: 'Soltera',
  numeroHijos: 0,
  fechaRegistro: datetime('2025-01-10T11:20:00'),
  estado: 'Activo'
});

CREATE (pac5:Paciente {
  id: 'PAC005',
  nombre: 'Roberto Carlos',
  apellido: 'Mendoza Silva',
  dni: '16789012',
  fechaNacimiento: date('1965-12-03'),
  genero: 'Masculino',
  direccion: 'Av. Cabildo 2890, Belgrano, CABA',
  telefono: '+54911555777666',
  email: 'roberto.mendoza@email.com',
  celular: '+54911555777555',
  grupoSanguineo: 'O+',
  factorRH: 'Positivo',
  alergias: ['Contraste yodado'],
  enfermedadesCronicas: ['Hipertensión Arterial', 'Diabetes Tipo 2', 'Dislipidemia'],
  medicacionHabitual: ['Losartán 50mg', 'Metformina 850mg', 'Atorvastatina 40mg'],
  contactoEmergencia: 'María Mendoza - Esposa - +54911555888999',
  ocupacion: 'Jubilado (Ex-Docente)',
  nivelEducativo: 'Universitario',
  estadoCivil: 'Casado',
  numeroHijos: 2,
  fechaRegistro: datetime('2022-05-18T15:30:00'),
  estado: 'Activo'
});
