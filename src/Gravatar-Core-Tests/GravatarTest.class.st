Class {
	#name : #GravatarTest,
	#superclass : #TestCase,
	#category : #'Gravatar-Core-Tests-Utilities'
}

{ #category : #accessing }
GravatarTest >> defaultTestClass [

	^Gravatar
]

{ #category : #tests }
GravatarTest >> testHashingMailaddress [

	|hashed|
	hashed := (self defaultTestClass hash: 'example@mail.com').
	self assert: hashed equals: 'fbf2b9cfc0a472389f3620e471bdf0e9'
]

{ #category : #tests }
GravatarTest >> testImageURL [

	|url|
	url := self defaultTestClass imageURLFor: 'example@mail.com'.
	self assert: url equals: 'http://www.gravatar.com/avatar/fbf2b9cfc0a472389f3620e471bdf0e9.jpg'
]

{ #category : #tests }
GravatarTest >> testImageURLWithRetroDefault [

	|url|
	url := self defaultTestClass imageURLWithRetroDefaultFor:  'example@mail.com'.
	self assert: url equals: 'http://www.gravatar.com/avatar/fbf2b9cfc0a472389f3620e471bdf0e9.jpg?d=retro'
]

{ #category : #tests }
GravatarTest >> testImageURLWithRetroDefaultAndSize [

	|url|
	url := self defaultTestClass imageURLWithRetroDefaultFor:  'example@mail.com' size: 42.
	self assert:  url equals: 'http://www.gravatar.com/avatar/fbf2b9cfc0a472389f3620e471bdf0e9.jpg?d=retro&s=42'
]

{ #category : #tests }
GravatarTest >> testImageURLWithSize [

	|url|
	url := self defaultTestClass imageURLFor: 'example@mail.com' size: 16.
	self assert: url equals: 'http://www.gravatar.com/avatar/fbf2b9cfc0a472389f3620e471bdf0e9.jpg?s=16'.

	url := self defaultTestClass imageURLFor: 'example@mail.com' size: 32.
	self assert: url equals: 'http://www.gravatar.com/avatar/fbf2b9cfc0a472389f3620e471bdf0e9.jpg?s=32'
]
