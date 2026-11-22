Class {
	#name : #Pregunta,
	#superclass : #Object,
	#instVars : [
		'enunciado',
		'opciones',
		'correcta'
	],
	#category : #'A-TRABAJOPARADIGMAS'
}

{ #category : #public }
Pregunta >> agregarOpcion: arg1 [

	opciones add: arg1
]

{ #category : #public }
Pregunta >> correcta [

	^ correcta
]

{ #category : #public }
Pregunta >> correcta: arg1 [

	correcta := arg1
]

{ #category : #public }
Pregunta >> enunciado [

	^ enunciado
]

{ #category : #public }
Pregunta >> enunciado: arg1 [

	enunciado := arg1
]

{ #category : #initialize }
Pregunta >> initialize [

	enunciado := ''.
	opciones := OrderedCollection new.
	correcta := 0.
]

{ #category : #public }
Pregunta >> opciones [
^opciones
]
