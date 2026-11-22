Class {
	#name : #Tablero,
	#superclass : #Object,
	#instVars : [
		'grilla',
		'listaJugadores',
		'cantJugadores',
		'contadorDuelos'
	],
	#category : #'A-TRABAJOPARADIGMAS'
}

{ #category : #public }
Tablero >> asignarJugadores: arg1 [

	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 tmp8 |
	tmp1 := 1.
	tmp2 := grilla size.
	tmp6 := tmp2.
	1 to: tmp6 do: [ :tmp7 | 
		tmp3 := (grilla at: tmp7) size.
		tmp8 := tmp3.
		1 to: tmp8 do: [ :tmp9 | 
			tmp4 := nil.
			tmp5 := nil.
			tmp4 := (grilla at: tmp7) at: tmp9.
			tmp4
				posx: tmp7;
				posy: tmp9.
			tmp5 := arg1 at: tmp1.
			tmp4 darJugador: tmp5.
			tmp5 asignarTerritorio: tmp4.
			tmp1 := tmp1 + 1.
			tmp1 > arg1 size ifTrue: [ tmp1 := 1 ] ] ]
]

{ #category : #public }
Tablero >> buscarJugador: arg1 [

	^ listaJugadores
		  detect: [ :arg2 | arg2 idjugador = arg1 ]
		  ifNone: [  ]
]

{ #category : #public }
Tablero >> casillaEn: arg1 columna: arg2 [

	[ ^ grilla at: arg1 - 1 * 3 + arg2 ]
]

{ #category : #public }
Tablero >> contadorDuelos [
^contadorDuelos
]

{ #category : #public }
Tablero >> contarDuelo [
contadorDuelos:= contadorDuelos + 1.
Transcript show: 'Duelo número: ', contadorDuelos printString; cr.

]

{ #category : #public }
Tablero >> esPosicionValida: arg1 [

	^ (arg1 first > 0 and: [ arg1 first <= grilla size ]) and: [ 
		  arg1 second > 0 and: [ arg1 second <= (grilla at: 1) size ] ]
]

{ #category : #public }
Tablero >> grilla [

	^ grilla
]

{ #category : #public }
Tablero >> inicializarContador [
contadorDuelos := 0.
]

{ #category : #public }
Tablero >> iniciarDuelo [
    | atacante posiblesDefensores defensor temaDefensor turno jugadorActual pregunta respuestaUsuario respuestaCorrecta tiempoConsumido inicioTurno finTurno tmp ganador seguirJugando |

    atacante := listaJugadores atRandom.
    seguirJugando := true.
    [seguirJugando] whileTrue: [
        "Obtiene los jugadores cercanos al atacante actual"
        self contarDuelo.
        (contadorDuelos = 10) ifTrue: [
            Transcript show: '¡Este es el duelo número 10! El ganador obtendrá una ventaja especial.'; cr.
        ].
        posiblesDefensores := self jugadoresCercanosPara: atacante.
        posiblesDefensores isEmpty ifTrue: [ 
            Transcript show: 'No hay jugadores cercanos para desafiar.'; cr.
            seguirJugando := false.
            ^ self 
        ].

        "Muestra las opciones de jugadores cercanos"
        Transcript show: 'El jugador ', atacante idjugador printString, ' puede desafiar a:'; cr.
        posiblesDefensores withIndexDo: [:jugador :index |
            Transcript show: index printString, ') Jugador ', jugador idjugador printString; cr.
        ].

        "Permite que el atacante elija a quien desafiar"
        tmp := (UIManager default request: 'Ingresa el número del jugador a desafiar') asInteger.
        (tmp between: 1 and: posiblesDefensores size) ifFalse: [
            Transcript show: 'Selección inválida. Turno terminado.'; cr.
            seguirJugando := false.
            ^ self
        ].
        Transcript clear.
        defensor := posiblesDefensores at: tmp.
        Transcript show: 'Duelo iniciado entre el jugador ', atacante idjugador printString, ' y el jugador ', defensor idjugador printString; cr.

        "Obtiene el tema del defensor"
        temaDefensor := defensor tema.
        "Inicia el duelo por turnos"
        Transcript show: 'El tema a defender es: ', temaDefensor nombre; cr.
        turno := 1.
        jugadorActual := atacante. "El atacante comienza"
        [atacante tiempoRestante > 0 and: [defensor tiempoRestante > 0]] whileTrue: [
            "Selecciona una pregunta del tema del defensor"
            pregunta := temaDefensor preguntas atRandom.
            "Muestra la pregunta y las opciones"
            Transcript show: 'Turno del jugador ', jugadorActual idjugador printString, ': '; cr.
            Transcript show: 'Pregunta: ', pregunta enunciado; cr.
            1 to: pregunta opciones size do: [:indice |
                | opcion |
                opcion := pregunta opciones at: indice.
                Transcript show: indice printString, ') ', opcion asString; cr.
            ].

            "Controla el tiempo de respuesta"
            inicioTurno := Time millisecondClockValue.
            respuestaUsuario := (UIManager default request: 'Ingresa el número de la respuesta') asInteger.
            finTurno := Time millisecondClockValue.
            tiempoConsumido := (finTurno - inicioTurno) // 1000. "Tiempo en segundos"
            jugadorActual asignarTiempo: (jugadorActual tiempoRestante - tiempoConsumido).

            "Verifica si la respuesta es correcta"
            respuestaCorrecta := pregunta correcta.
            (respuestaUsuario = respuestaCorrecta) ifTrue: [
                Transcript show: '¡Correcto!'; cr.
            ] ifFalse: [
                (jugadorActual tieneDueloExtra) ifTrue: [
                    jugadorActual reducirDueloExtra.
                    Transcript show: '¡Incorrecto! Pero el jugador tiene ventaja y no pierde tiempo. Errores restantes: ', jugadorActual ganoDueloextra printString; cr.
                ] ifFalse: [
                    jugadorActual asignarTiempo: (jugadorActual tiempoRestante - 5).
                    Transcript show: '¡Incorrecto! La respuesta correcta era: ', respuestaCorrecta printString; cr.
                    Transcript show: 'Se restan 5 segundos al jugador ', jugadorActual idjugador printString; cr.
                ].
            ].

            "Muestra el tiempo restante del jugador actual"
            Transcript show: 'Tiempo restante del jugador ', jugadorActual idjugador printString, ': ', jugadorActual tiempoRestante printString, ' segundos'; cr.
            Transcript cr.
            "Cambia el turno al otro jugador"
            jugadorActual := (jugadorActual = atacante) ifTrue: [defensor] ifFalse: [atacante].
            turno := turno + 1.
        ].
        Transcript clear.
        "Determina el perdedor con el tiempo"
        (atacante tiempoRestante <= 0)
            ifTrue: [
                Transcript show: 'El jugador ', atacante idjugador printString, ' se quedó sin tiempo. El jugador ', defensor idjugador printString, ' gana el duelo.'; cr.
                self realizarDueloEntre: defensor y: atacante.
                ganador := defensor.
            ]
            ifFalse: [
                Transcript show: 'El jugador ', defensor idjugador printString, ' se quedó sin tiempo. El jugador ', atacante idjugador printString, ' gana el duelo.'; cr.
                self realizarDueloEntre: atacante y: defensor.
                ganador := atacante.
            ].

        "Restaura el tiempo de ambos jugadores a 45 segundos"
        atacante asignarTiempo: 45.
        defensor asignarTiempo: 45.
		  ganador darTema: defensor tema.
        "Aplica la ventaja del duelo numero 10"
        (contadorDuelos = 10) ifTrue: [
            ganador activarDueloExtra.
            Transcript show: 'El jugador ', ganador idjugador printString, ' ha ganado el duelo número 10 y puede equivocarse 3 veces sin perder tiempo.'; cr.
		  self inicializarContador
        ].

        "Opciones para el ganador"
        Transcript show: 'El jugador ', ganador idjugador printString, ' puede:'; cr.
        Transcript show: '1) Retar a otro jugador cercano'; cr.
        Transcript show: '2) Pasar el turno'; cr.
        tmp := (UIManager default request: 'Ingresa tu elección') asInteger.
        (tmp = 1) ifTrue: [
            "Si el ganador sigue jugando"
            atacante := ganador.
            seguirJugando := true.
        ] ifFalse: [
            "Pasa el turno a un jugador aleatorio"
            atacante := listaJugadores atRandom.
            seguirJugando := true.
        ].
    ].

]

{ #category : #initialize }
Tablero >> initialize [

	| tmp1 tmp2 tmp4 tmp5 |
	listaJugadores := OrderedCollection new.
	1 to: 16 do: [ :tmp3 | listaJugadores add: (Jugador new darid: tmp3) ].
	grilla := (1 to: 4) collect: [ :arg1 | 
		          (1 to: 4) collect: [ :arg2 | Casilla new ] ].
	cantJugadores := 16.
	tmp1 := OrderedCollection new.
	1 to: 16 do: [ :tmp3 | 
		tmp4 := nil.
		tmp5 := nil.
		tmp4 := Tema new.
		tmp4
			id: tmp3;
			nombre: 'Tema ' , tmp3 printString.
		tmp5 := FileLocator imageDirectory / 'temas'
		        / ('tema' , tmp3 printString , '.txt').
		tmp4 cargarPreguntasDesdeArchivo: tmp5 fullName.
		tmp1 add: tmp4 ].
	tmp2 := listaJugadores shuffled.
	tmp2 withIndexDo: [ :arg3 :arg4 | arg3 darTema: (tmp1 at: arg4) ].
	contadorDuelos:=0.
	self asignarJugadores: listaJugadores
]

{ #category : #public }
Tablero >> jugadoresCercanosPara: arg1 [

	| tmp1 tmp3 |
	tmp1 := OrderedCollection new.
	arg1 territorio do: [ :arg2 | 
		| tmp4 tmp5 |
		tmp4 := arg2 posx.
		tmp5 := arg2 posy.
		tmp3 := { 
			        { 
				        (tmp4 - 1).
				        tmp5 }.
			        { 
				        (tmp4 + 1).
				        tmp5 }.
			        { 
				        tmp4.
				        (tmp5 - 1) }.
			        { 
				        tmp4.
				        (tmp5 + 1) } }.
		tmp3 do: [ :arg3 | 
			| tmp6 |
			(self esPosicionValida: arg3) ifTrue: [ 
				tmp6 := (grilla at: arg3 first) at: arg3 second.
				(tmp6 jugador notNil and: [ tmp6 jugador ~= arg1 ]) ifTrue: [ 
					(tmp1 includes: tmp6 jugador) ifFalse: [ tmp1 add: tmp6 jugador ] ] ] ] ].
	arg1 jugadoresCerca: tmp1.
	^ tmp1
]

{ #category : #public }
Tablero >> listaJugadores [

	^ listaJugadores
]

{ #category : #public }
Tablero >> realizarDueloEntre: ganador y: perdedor [
    ganador ganarTerritorio: perdedor.
    listaJugadores := listaJugadores reject: [:jugador | jugador estado = 'ELIMINADO'].

    Transcript show: 'El jugador ', ganador idjugador printString, ' ganó el duelo y tomó el territorio del jugador ', perdedor idjugador printString; cr.
    Transcript show: 'Territorio actual del jugador ', ganador idjugador printString, ': ', ganador verTerritorio printString; cr.

    ganador darTema: perdedor tema.

    Transcript show: 'El jugador ', ganador idjugador printString, ' ahora posee el tema: ', (ganador tema nombre); cr.
]
