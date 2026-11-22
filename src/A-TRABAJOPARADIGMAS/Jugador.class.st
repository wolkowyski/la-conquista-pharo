Class {
	#name : #Jugador,
	#superclass : #Object,
	#instVars : [
		'idjugador',
		'estado',
		'ganoDueloextra',
		'territorio',
		'jugadoresCerca',
		'tema',
		'tiempoRestante'
	],
	#category : #'A-TRABAJOPARADIGMAS'
}

{ #category : #public }
Jugador >> activarDueloExtra [
ganoDueloextra := 3.
]

{ #category : #public }
Jugador >> asignarTerritorio: arg1 [

	territorio add: arg1
]

{ #category : #public }
Jugador >> asignarTiempo: arg1 [

	tiempoRestante := arg1
]

{ #category : #public }
Jugador >> cambiarEstado: arg1 [

	estado := arg1
]

{ #category : #public }
Jugador >> darTema: arg1 [

	tema := arg1
]

{ #category : #public }
Jugador >> darid: arg1 [

	idjugador := arg1
]

{ #category : #public }
Jugador >> desactivarDueloExtra [
ganoDueloextra := 0.
]

{ #category : #public }
Jugador >> eliminarJugador [

	self eliminarTerritorio.
	estado := 'ELIMINADO'
]

{ #category : #public }
Jugador >> eliminarTerritorio [

	territorio := OrderedCollection new
]

{ #category : #accessing }
Jugador >> estado [

	^ estado
]

{ #category : #public }
Jugador >> ganarTerritorio: arg1 [

	arg1 territorio do: [ :arg2 | 
		arg2 darJugador: self.
		territorio add: arg2 ].
	arg1
		eliminarTerritorio;
		eliminarJugador
]

{ #category : #accessing }
Jugador >> ganoDueloextra [

	^ ganoDueloextra
]

{ #category : #public }
Jugador >> ganoDueloextra: arg1 [

	ganoDueloextra := arg1
]

{ #category : #accessing }
Jugador >> idjugador [

	^ idjugador
]

{ #category : #initialize }
Jugador >> initialize [

	idjugador := nil.
	jugadoresCerca := OrderedCollection new.
	territorio := OrderedCollection new.
	tiempoRestante := 45.
	estado := 'JUGANDO'.
	ganoDueloextra := 0.
	tema := nil
]

{ #category : #accessing }
Jugador >> jugadoresCerca [

	^ jugadoresCerca
]

{ #category : #accessing }
Jugador >> jugadoresCerca: arg1 [

	jugadoresCerca := arg1
]

{ #category : #public }
Jugador >> reducirDueloExtra [
ganoDueloextra := ganoDueloextra - 1.
]

{ #category : #public }
Jugador >> tema [

	^ tema
]

{ #category : #accessing }
Jugador >> territorio [

	^ territorio
]

{ #category : #accessing }
Jugador >> tiempoRestante [

	^ tiempoRestante
]

{ #category : #accessing }
Jugador >> tiempoRestante:tiempo [
tiempoRestante:= tiempo
]

{ #category : #public }
Jugador >> tieneDueloExtra [
^(ganoDueloextra > 0).
]

{ #category : #public }
Jugador >> verTerritorio [

	^ territorio collect: [ :arg1 | arg1 mostrar ]
]
