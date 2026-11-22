Class {
	#name : #MyProgressBarMorph,
	#superclass : #Morph,
	#instVars : [
		'progressBar',
		'progressValue'
	],
	#category : #'A-TRABAJOPARADIGMAS'
}

{ #category : #initialization }
MyProgressBarMorph >> initialize [
    super initialize.
    progressValue := 0. 
    
    self color: Color gray. "Establece el color del fondo de la barra"

    "Crea la barra interna de progreso"
    progressBar := Morph new.
    progressBar color: (Color orange).
    self addMorph: progressBar. "Añade la barra interna"
]

{ #category : #removing }
MyProgressBarMorph >> removeProgressBar [
    self delete. 
]

{ #category : #'as yet unclassified' }
MyProgressBarMorph >> updateProgress: aValue [
    progressValue := aValue. 
    progressBar bounds: (self bounds origin extent: ((self bounds width * progressValue // 100) @ self bounds height)). 
    progressBar changed. 
]
