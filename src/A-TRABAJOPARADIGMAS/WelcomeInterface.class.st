Class {
	#name : #WelcomeInterface,
	#superclass : #Object,
	#classInstVars : [
		'dimension'
	],
	#category : #'A-TRABAJOPARADIGMAS'
}

{ #category : #'as yet unclassified' }
WelcomeInterface class >> configureMatrix [
    dimension := UIManager default request: 'Escribe la dimensión de la matriz (ejemplo: 3 para 3x3):'.
    dimension := dimension asInteger ifNil: [ 3 ]. "Valor por defecto si no ingresa nada"
    (dimension isInteger and: [dimension > 0]) ifTrue: [
        self setMatrixDimension: dimension.
        UIManager default inform: 'Configuración actualizada: ', dimension asString, 'x', dimension asString.
    ] ifFalse: [
        UIManager default inform: 'Por favor, introduce un número válido mayor a 0.'.
    ].
]

{ #category : #'instance creation' }
WelcomeInterface class >> exitGame [
    (UIManager default confirm: '¿Seguro que quieres salir?') ifTrue: [
        Smalltalk quitPrimitive.
    ].
]

{ #category : #'instance creation' }
WelcomeInterface class >> getMatrixDimension [
    ^ Smalltalk at: #MatrixDimension ifAbsent: [ 3 ].
]

{ #category : #'as yet unclassified' }
WelcomeInterface class >> open [
    | window titleMorph welcomeLabel startButton configButton instructionsButton aboutButton exitButton backgroundImage buttonColor borderColor buttonOffset |

    "Define el color naranja, el borde oscuro y el desplazamiento hacia la izquierda"
    buttonColor := Color orange.
    borderColor := Color orange darker.
    buttonOffset := -100. 

    "Crea la ventana principal y aumenta el tamaño de la misma"
    window := SystemWindow new.
    window extent: 800 @ 600.

    window setLabel: '- L A   C O N Q U I S T A -'. "Título de la ventana"
    titleMorph := TextMorph new.
    titleMorph contents: 'Pharo 9.0'.
    titleMorph font: (TextStyle default fontOfSize: 18). " Tamaño de la fuente"
    titleMorph position: (20 @ 10). "Posición ajustada"
    window addMorph: titleMorph.

    "Agrega la imagen de fondo escalada"
    backgroundImage := ImageMorph new.
    backgroundImage image: (Form fromFileNamed: (FileLocator imageDirectory / 'fondo.png') asFileReference).
    backgroundImage bounds: (0 @ 0 corner: window extent).
    window addMorphBack: backgroundImage.

    "Crea una etiqueta de bienvenida"
    welcomeLabel := TextMorph new.
    welcomeLabel contents: '¡Hola! Bienvenido a nuestro juego...' , String cr , 'Made by: Los Imaginadores'.
    welcomeLabel font: (TextStyle default fontOfSize: 18). "Tamaño de fuente ajustado"
    welcomeLabel position: (40 @ 80).
    window addMorph: welcomeLabel.

    "Crea un botón de inicio"
    startButton := SimpleButtonMorph new.
    startButton label: 'Iniciar Juego'.
    startButton target: self.
    startButton actionSelector: #startGame.
    startButton bounds: ((240 + buttonOffset) @ 220 extent: 140 @ 50). 
    startButton color: buttonColor. 
    startButton borderWidth: 2; borderColor: borderColor.
    window addMorph: startButton.

    "Crea un botón de configuración"
    configButton := SimpleButtonMorph new.
    configButton label: 'Configuración'.
    configButton target: self.
    configButton actionSelector: #configureMatrix.
    configButton bounds: ((240 + buttonOffset) @ 290 extent: 140 @ 50).
    configButton color: buttonColor. 
    configButton borderWidth: 2; borderColor: borderColor. 
    window addMorph: configButton.

    "Crea un botón de instrucciones del juego"
    instructionsButton := SimpleButtonMorph new.
    instructionsButton label: 'Instrucciones del Juego'.
    instructionsButton target: self.
    instructionsButton actionSelector: #showInstructions.
    instructionsButton bounds: ((240 + buttonOffset) @ 360 extent: 140 @ 50). 
    instructionsButton color: buttonColor. 
    instructionsButton borderWidth: 2; borderColor: borderColor. 
    window addMorph: instructionsButton.

    "Crea un botón sobre el grupo"
    aboutButton := SimpleButtonMorph new.
    aboutButton label: 'Sobre Nosotros'.
    aboutButton target: self.
    aboutButton actionSelector: #showAbout.
    aboutButton bounds: ((240 + buttonOffset) @ 430 extent: 140 @ 50). 
    aboutButton color: buttonColor. 
    aboutButton borderWidth: 2; borderColor: borderColor. 
    window addMorph: aboutButton.

    "Crea un botón de salida"
    exitButton := SimpleButtonMorph new.
    exitButton label: 'Salir'.
    exitButton target: self.
    exitButton actionSelector: #exitGame.
    exitButton bounds: ((240 + buttonOffset) @ 500 extent: 140 @ 50). 
    exitButton color: buttonColor. 
    exitButton borderWidth: 2; borderColor: borderColor. 
    window addMorph: exitButton.

    " Para abrir la ventana"
    window openInWorld.
]

{ #category : #initialization }
WelcomeInterface class >> setMatrixDimension: aDimension [
    Smalltalk at: #MatrixDimension put: aDimension.
]

{ #category : #'as yet unclassified' }
WelcomeInterface class >> showAbout [
    | window aboutBackground aboutText |

    window := SystemWindow new.
    window extent: 500 @ 400.
    window setLabel: 'Sobre Nosotros'.

    "Agrega la imagen de fondo"
    aboutBackground := ImageMorph new.
    aboutBackground image: (Form fromFileNamed: (FileLocator imageDirectory / 'sobreNosotros.png') asFileReference).
    aboutBackground bounds: (0 @ 0 corner: window extent).
    window addMorphBack: aboutBackground.

    "Agrega un  texto sobre nosotros"
    aboutText := TextMorph new.
    aboutText contents: 'Desarrollado por: Los Imaginadores' , String cr , 'Somos un grupo apasionado por los juegos y la creatividad.' , String cr , '¡Esperamos que disfrutes nuestro juego tanto como nosotros disfrutamos creándolo!'.
    aboutText font: (TextStyle default fontOfSize: 14).
    aboutText position: (20 @ 50).
    aboutText color: Color white.
    window addMorph: aboutText.

    window openInWorld.
]

{ #category : #'instance creation' }
WelcomeInterface class >> showInstructions [
    | window instructionsBackground instructionsText |

    window := SystemWindow new.
    window extent: 500 @ 400.
    window setLabel: 'Instrucciones del Juego'.

    "Agrega la imagen de fondo"
    instructionsBackground := ImageMorph new.
    instructionsBackground image: (Form fromFileNamed: (FileLocator imageDirectory / 'instrucciones.png') asFileReference).
    instructionsBackground bounds: (0 @ 0 corner: window extent).
    window addMorphBack: instructionsBackground.

    "Agrega el texto de instrucciones"
    instructionsText := TextMorph new.
    instructionsText contents: '1. Haz clic en "Iniciar Juego" para comenzar.' , String cr , '2. Usa el menú de configuración para ajustar el tamaño del tablero.' , String cr , '3. ¡Diviértete jugando!'.
    instructionsText font: (TextStyle default fontOfSize: 14).
    instructionsText position: (20 @ 50).
    instructionsText color: Color white.
    window addMorph: instructionsText.

    window openInWorld.
]

{ #category : #'instance creation' }
WelcomeInterface class >> startGame [
    | tablero progressBar progressBounds currentValue loadingText |

    UIManager default inform: 'Iniciando el juego...'.

    "Calcula la posición centrada para la barra de progreso dentro del mundo"
    progressBounds := ((World bounds center - (200 @ 15)) corner: (World bounds center + (200 @ 15))). 

    "Crea y posiciona la barra de progreso"
    progressBar := MyProgressBarMorph new.
    progressBar bounds: progressBounds.
    progressBar openInWorld. "Abre el Morph personalizado en el mundo"

    "Crea y posiciona el texto de carga"
    loadingText := TextMorph new.
    loadingText contents: 'Cargando: 0%'.
    loadingText position: (World bounds center - (60 @ 50)). 
    loadingText font: (TextStyle default fontOfSize: 20). 
    loadingText color: Color white.
    loadingText openInWorld. "Añade el texto al mundo"

    "Inicializa el progreso"
    currentValue := 0.

    [ 1 to: 100 do: [:i |
        (Delay forMilliseconds: 20) wait. "Simula el tiempo de carga"
        progressBar updateProgress: i. "Actualiza el progreso dinámicamente"
        loadingText contents: 'Cargando: ', i asString, '%'. "Actualiza el texto con el progreso"
        loadingText changed. "Fuerza el redibujado del texto"
    ].

    "Finalización: elimina la barra de progreso y el texto"
    progressBar removeProgressBar. "Quita la barra una vez completada"
    loadingText delete. "Elimina el texto de carga"

    "Inicializa el tablero del juego"
    tablero := Tablero new.
    tablero iniciarDuelo.

    UIManager default inform: '¡Juego iniciado!!'. "Mensaje opcional"
] fork. "Ejecutar en un hilo separado para no bloquear la UI"
]
