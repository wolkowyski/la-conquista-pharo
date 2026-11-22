Class {
	#name : #Casilla,
	#superclass : #Object,
	#instVars : [
		'jugador',
		'posx',
		'posy'
	],
	#category : #'A-TRABAJOPARADIGMAS'
}

{ #category : #public }
Casilla >> darJugador: arg1 [
	jugador := arg1
]

{ #category : #initialize }
Casilla >> initialize [
	jugador := nil.
	posx := nil.
	posy := nil
]

{ #category : #public }
Casilla >> jugador [
	^ jugador
]

{ #category : #public }
Casilla >> mostrar [
	| tmp1 |
	tmp1 := Array new: 2.
	tmp1
		at: 1 put: self posx;
		at: 2 put: self posy.
	^ tmp1
]

{ #category : #public }
Casilla >> posx [
	^ posx
]

{ #category : #public }
Casilla >> posx: arg1 [

	posx := arg1
]

{ #category : #public }
Casilla >> posy [

	^ posy
]

{ #category : #public }
Casilla >> posy: arg1 [

	posy := arg1
]
