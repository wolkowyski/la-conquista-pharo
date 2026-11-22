Class {
	#name : #Duelo,
	#superclass : #Object,
	#instVars : [
		'atacante',
		'defensor',
		'nro'
	],
	#category : #'A-TRABAJOPARADIGMAS'
}

{ #category : #public }
Duelo >> inicio: arg1 contra: arg2 [

	atacante := arg1.
	defensor := arg2
]

{ #category : #initialize }
Duelo >> initialize [

	atacante := nil.
	defensor := nil.
	nro := nil
]
