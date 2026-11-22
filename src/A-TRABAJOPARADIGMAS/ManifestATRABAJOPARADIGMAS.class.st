"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestATRABAJOPARADIGMAS,
	#superclass : #PackageManifest,
	#category : #'A-TRABAJOPARADIGMAS-Manifest'
}

{ #category : #'code-critics' }
ManifestATRABAJOPARADIGMAS class >> ruleCascadedNextPutAllsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Tablero #contarDuelo #false)) #'2024-11-24T16:48:15.297-03:00') #(#(#RGMethodDefinition #(#Tablero #iniciarDuelo #false)) #'2024-11-24T16:48:32.349-03:00') #(#(#RGMethodDefinition #(#Tablero #realizarDueloEntre:y: #false)) #'2024-11-24T16:56:00.056-03:00') )
]

{ #category : #'code-critics' }
ManifestATRABAJOPARADIGMAS class >> ruleClassNotReferencedRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#Duelo)) #'2024-11-24T16:36:20.537-03:00') #(#(#RGClassDefinition #(#WelcomeInterface)) #'2024-11-24T16:58:51.604-03:00') )
]

{ #category : #'code-critics' }
ManifestATRABAJOPARADIGMAS class >> ruleCodeCruftLeftInMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Tablero #iniciarDuelo #false)) #'2024-11-24T16:48:26.638-03:00') )
]

{ #category : #'code-critics' }
ManifestATRABAJOPARADIGMAS class >> ruleCollectionProtocolRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Jugador #ganarTerritorio: #false)) #'2024-11-24T16:38:09.195-03:00') )
]

{ #category : #'code-critics' }
ManifestATRABAJOPARADIGMAS class >> ruleDeadBlockRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Tablero #casillaEn:columna: #false)) #'2024-11-24T16:48:07.684-03:00') )
]

{ #category : #'code-critics' }
ManifestATRABAJOPARADIGMAS class >> ruleEndTrueFalseRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Tablero #iniciarDuelo #false)) #'2024-11-24T16:48:30.343-03:00') )
]

{ #category : #'code-critics' }
ManifestATRABAJOPARADIGMAS class >> ruleInconsistentMethodClassificationRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Duelo #initialize #false)) #'2024-11-24T16:36:27.904-03:00') #(#(#RGMethodDefinition #(#Casilla #initialize #false)) #'2024-11-24T16:36:49.071-03:00') #(#(#RGMethodDefinition #(#Jugador #initialize #false)) #'2024-11-24T16:37:49.173-03:00') #(#(#RGMethodDefinition #(#Pregunta #initialize #false)) #'2024-11-24T16:47:34.118-03:00') #(#(#RGMethodDefinition #(#Tablero #initialize #false)) #'2024-11-24T16:55:31.114-03:00') #(#(#RGMethodDefinition #(#Tema #initialize #false)) #'2024-11-24T16:56:45.491-03:00') )
]

{ #category : #'code-critics' }
ManifestATRABAJOPARADIGMAS class >> ruleLongMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Tablero #iniciarDuelo #false)) #'2024-11-24T16:48:39.068-03:00') #(#(#RGMethodDefinition #(#Tablero #initialize #false)) #'2024-11-24T16:55:37.588-03:00') #(#(#RGMethodDefinition #(#'WelcomeInterface class' #open #true)) #'2024-11-24T16:59:27.059-03:00') #(#(#RGMethodDefinition #(#'WelcomeInterface class' #startGame #true)) #'2024-11-24T17:04:07.007-03:00') )
]

{ #category : #'code-critics' }
ManifestATRABAJOPARADIGMAS class >> ruleModifiesCollectionRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Tablero #initialize #false)) #'2024-11-24T16:55:34.86-03:00') )
]

{ #category : #'code-critics' }
ManifestATRABAJOPARADIGMAS class >> ruleNoClassCommentRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#Casilla)) #'2024-11-24T16:35:57.738-03:00') #(#(#RGClassDefinition #(#Duelo)) #'2024-11-24T16:36:17.895-03:00') #(#(#RGClassDefinition #(#Jugador)) #'2024-11-24T16:36:38.83-03:00') #(#(#RGClassDefinition #(#MyProgressBarMorph)) #'2024-11-24T16:38:49.4-03:00') #(#(#RGClassDefinition #(#Pregunta)) #'2024-11-24T16:47:19.966-03:00') #(#(#RGClassDefinition #(#Tablero)) #'2024-11-24T16:47:53.333-03:00') #(#(#RGClassDefinition #(#Tema)) #'2024-11-24T16:56:38.825-03:00') #(#(#RGClassDefinition #(#WelcomeInterface)) #'2024-11-24T16:58:54.531-03:00') )
]

{ #category : #'code-critics' }
ManifestATRABAJOPARADIGMAS class >> rulePrecedenceRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Tablero #casillaEn:columna: #false)) #'2024-11-24T16:48:09.784-03:00') )
]

{ #category : #'code-critics' }
ManifestATRABAJOPARADIGMAS class >> ruleReClassNotCategorizedRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#Casilla)) #'2024-11-24T16:36:08.623-03:00') #(#(#RGClassDefinition #(#Duelo)) #'2024-11-24T16:36:15.977-03:00') #(#(#RGClassDefinition #(#Jugador)) #'2024-11-24T16:36:35.198-03:00') #(#(#RGClassDefinition #(#MyProgressBarMorph)) #'2024-11-24T16:38:51.577-03:00') #(#(#RGClassDefinition #(#Pregunta)) #'2024-11-24T16:47:17.812-03:00') #(#(#RGClassDefinition #(#Tablero)) #'2024-11-24T16:47:51.355-03:00') #(#(#RGClassDefinition #(#Tema)) #'2024-11-24T16:56:36.227-03:00') #(#(#RGClassDefinition #(#WelcomeInterface)) #'2024-11-24T16:58:57.244-03:00') )
]

{ #category : #'code-critics' }
ManifestATRABAJOPARADIGMAS class >> ruleReNoNilAssignationInInitializeRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Duelo #initialize #false)) #'2024-11-24T16:36:25.548-03:00') #(#(#RGMethodDefinition #(#Casilla #initialize #false)) #'2024-11-24T16:36:45.863-03:00') #(#(#RGMethodDefinition #(#Jugador #initialize #false)) #'2024-11-24T16:37:46.927-03:00') #(#(#RGMethodDefinition #(#Tablero #initialize #false)) #'2024-11-24T16:55:33.123-03:00') #(#(#RGMethodDefinition #(#Tema #initialize #false)) #'2024-11-24T16:56:48.043-03:00') )
]

{ #category : #'code-critics' }
ManifestATRABAJOPARADIGMAS class >> ruleStringConcatenationRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Tablero #iniciarDuelo #false)) #'2024-11-24T16:48:34.965-03:00') #(#(#RGMethodDefinition #(#Tablero #initialize #false)) #'2024-11-24T16:55:39.73-03:00') #(#(#RGMethodDefinition #(#'WelcomeInterface class' #startGame #true)) #'2024-11-24T17:04:11.04-03:00') )
]

{ #category : #'code-critics' }
ManifestATRABAJOPARADIGMAS class >> ruleToDoRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Tablero #iniciarDuelo #false)) #'2024-11-24T16:48:37.102-03:00') )
]

{ #category : #'code-critics' }
ManifestATRABAJOPARADIGMAS class >> ruleToDoWithIncrementRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Tablero #asignarJugadores: #false)) #'2024-11-24T16:47:58.279-03:00') )
]

{ #category : #'code-critics' }
ManifestATRABAJOPARADIGMAS class >> ruleUnclassifiedMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#MyProgressBarMorph #updateProgress: #false)) #'2024-11-24T16:38:58.438-03:00') #(#(#RGMethodDefinition #(#'WelcomeInterface class' #configureMatrix #true)) #'2024-11-24T16:59:11.627-03:00') #(#(#RGMethodDefinition #(#'WelcomeInterface class' #open #true)) #'2024-11-24T16:59:24.458-03:00') #(#(#RGMethodDefinition #(#'WelcomeInterface class' #showAbout #true)) #'2024-11-24T17:03:25.325-03:00') )
]

{ #category : #'code-critics' }
ManifestATRABAJOPARADIGMAS class >> ruleUnoptimizedAndOrRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Tablero #esPosicionValida: #false)) #'2024-11-24T16:48:18.838-03:00') )
]

{ #category : #'code-critics' }
ManifestATRABAJOPARADIGMAS class >> ruleUsesWorldGlobalRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'WelcomeInterface class' #startGame #true)) #'2024-11-24T17:04:08.919-03:00') )
]
