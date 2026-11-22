Class {
	#name : #Tema,
	#superclass : #Object,
	#instVars : [
		'id',
		'nombre',
		'preguntas'
	],
	#category : #'A-TRABAJOPARADIGMAS'
}

{ #category : #public }
Tema >> añadirPreg: arg1 [

	preguntas add: arg1
]

{ #category : #public }
Tema >> cargarPreguntasDesdeArchivo: arg1 [
    | archivo contenido lineas nombreTema |
    archivo := FileLocator imageDirectory / 'temas' / arg1.
    contenido := archivo readStream.
    lineas := contenido contents lines.

    "Guarda el nombre del tema"
    nombreTema := lineas first.
    self nombre: nombreTema.

    "Procesa las preguntas y las opciones"
    lineas allButFirst do: [:linea |
        | elementos pregunta |
        elementos := linea findTokens: ';'.
        pregunta := Pregunta new.
        pregunta enunciado: (elementos at: 1).
        2 to: 5 do: [:i |
            pregunta agregarOpcion: (elementos at: i).
        ].
        pregunta correcta: ((elementos at: 6) asInteger).
        self añadirPreg: pregunta.
    ].
    contenido close.


]

{ #category : #public }
Tema >> id [
^id
]

{ #category : #public }
Tema >> id: unid [
id:=unid
]

{ #category : #initialize }
Tema >> initialize [
	nombre:=''.
	id:=nil.
	preguntas := OrderedCollection new
]

{ #category : #public }
Tema >> nombre [
^nombre
]

{ #category : #public }
Tema >> nombre:unnom [
nombre:=unnom
]

{ #category : #public }
Tema >> preguntas [

	^ preguntas
]
