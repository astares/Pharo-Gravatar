"
A gravatar
"
Class {
	#name : #Gravatar,
	#superclass : #Object,
	#category : #'Gravatar-Core-Utilities'
}

{ #category : #example }
Gravatar class >> example [
	"
	self example		
	"
	|form|
	form := ZnEasy getJpeg: (self imageURLFor: 'example@mail.com').
	form asMorph openInWorld
]

{ #category : #testing }
Gravatar class >> existsFor: mailAddress [

	|url|
	url := 'http://www.gravatar.com/avatar/', (self hash: mailAddress asLowercase), '?d=404'.	
	^(ZnEasy get: url) isSuccess
]

{ #category : #private }
Gravatar class >> hash: mailAddress [
	"Return an MD5 hash for the given mail address"
	
	^(MD5 hashStream: (mailAddress asByteArray readStream)) hex
]

{ #category : #accessing }
Gravatar class >> imageURLFor: mailAddress [
	"Return an image URL for gravatar for the given mail address"
	
 	^'http://www.gravatar.com/avatar/', (self hash: mailAddress asLowercase), '.jpg'
	
]

{ #category : #accessing }
Gravatar class >> imageURLFor: mailAddress default: defaultCode [
	"Return an image URL for gravatar for the given mail address
	See https://fr.gravatar.com/site/implement/images/ for all the possible defaultCode."
	
 	^(self imageURLFor: mailAddress) , '?d=', defaultCode.	
	
]

{ #category : #accessing }
Gravatar class >> imageURLFor: mailAddress default: defaultCode size: anInteger [
	"Return an image URL for gravatar for the given mail address
	See https://fr.gravatar.com/site/implement/images/ for all the possible defaultCode."
	
 	^(self imageURLFor: mailAddress default: defaultCode) , '&s=' , anInteger asString
	
]

{ #category : #accessing }
Gravatar class >> imageURLFor: mailAddress size: anInteger [
	"Return an image URL for gravatar for the given mail address and image size"
	
 	^(self imageURLFor: mailAddress), '?s=' , anInteger asString
	
]

{ #category : #accessing }
Gravatar class >> imageURLWithRetroDefaultFor: mailAddress [
	^self imageURLFor: mailAddress default: 'retro'.
]

{ #category : #accessing }
Gravatar class >> imageURLWithRetroDefaultFor: mailAddress size: anInteger [
	^self imageURLFor: mailAddress default: 'retro' size: anInteger.
]
