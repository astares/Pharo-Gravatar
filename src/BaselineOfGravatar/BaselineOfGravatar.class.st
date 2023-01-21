"
A simple Pharo wrapper for the Gravatar API

See [https://github.com/astares/Pharo-Gravatar](https://github.com/astares/Pharo-Gravatar)
"
Class {
	#name : #BaselineOfGravatar,
	#superclass : #BaselineOf,
	#category : #BaselineOfGravatar
}

{ #category : #baseline }
BaselineOfGravatar >> baseline: spec [
	<baseline>
	spec
		for: #common do: [
			"Packages"
			spec 
				package: 'Gravatar-Core';
				package: 'Gravatar-Core-Tests' with: [ spec requires: #('Gravatar-Core') ].
			
			"Groups"	
			spec	
				group: 'Core' with: #('Gravatar-Core');
				group: 'Tests' with: #('Gravatar-Core-Tests');
				group: 'CI' with: #('Tests');
				group: 'all' with: #('Core' 'Tests');
				group: 'default' with: #('Core' 'Tests') ]
]
