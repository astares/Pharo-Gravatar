"
# Gravatar

## Project info

The ""Gravatar"" project is a simple wrapper for the [Gravatar API][1] allowing you to get small avatar images for a given registered email address. You can easily access and use it in [Pharo][2]. 

### Project location
The project is located on STHub at [http://smalltalkhub.com/#!/~TorstenBergmann/Gravatar][3]

### License
The Gravatar project for Pharo is under MIT License.

## Installation

To install just open the Pharo configuration browser and load ""Gravatar"" from there. 

Alternatively to install the packages manually into your Pharo image just evaluate:

    Gofer new
        url: 'http://smalltalkhub.com/mc/TorstenBergmann/Gravatar/main';
        package: 'ConfigurationOfGravatar';
        load.
    ((Smalltalk at: #ConfigurationOfGravatar) project stableVersion) load.

## Use in your own application
### Retrieving the image URL

Usually you display a Gravatar image within a web application. If you generate the HTML you will add an URL for the  image. To get one you can use:

    Gravatar imageURLFor: 'example@mail.com'
    
If you require a different size just evaluate:

    Gravatar imageURLFor: 'example@mail.com' size: 32.

### Retrieving and displaying an image

If you need the real image you can use Pharos Zinc components suite to get the image form over HTTP and open it on your Pharo desk:

    |form|
	form := ZnEasy getJpeg: (self imageURLFor: 'example@mail.com').
	form asMorph openInWorld


### Internals

Gravatar is based on MD5 hashing an email address. To get the hashing just evaluate:

    Gravatar hash: 'example@mail.com' 


# Packages

- Gravatar-Core - package with the core, contains anything you need in an own app
- Gravatar-Tests - package with the SUnit tests

# Testing
The package comes with unit tests tests in the package ***Gravatar-Tests***. Just use the SUnit TestRunner to run them.

  [1]: https://en.gravatar.com/site/implement/
  [2]: http://www.pharo.org
  [3]: http://smalltalkhub.com/#!/~TorstenBergmann/Gravatar
"
Class {
	#name : #ConfigurationOfGravatar,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : #ConfigurationOfGravatar
}

{ #category : #'development support' }
ConfigurationOfGravatar class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>

]

{ #category : #private }
ConfigurationOfGravatar class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : #private }
ConfigurationOfGravatar class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfGravatar class >> ensureMetacelloBaseConfiguration [

	Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			| repository version |
			repository := MCHttpRepository location: 'http://seaside.gemstone.com/ss/metacello' user: '' password: ''.
			repository
				versionReaderForFileNamed: 'Metacello-Base-DaleHenrichs.2.mcz'
				do: [ :reader | 
					version := reader version.
					version load.
					version workingCopy repositoryGroup addRepository: repository ] ]
]

{ #category : #'metacello tool support' }
ConfigurationOfGravatar class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfGravatar class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfGravatar class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfGravatar class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfGravatar class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfGravatar class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."

	"self validate"

	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : #baselines }
ConfigurationOfGravatar >> baseline01: spec [
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/TorstenBergmann/Gravatar/main/'.
		spec 
			package: #'Gravatar-Core';
			package: #'Gravatar-Tests' with: [
				spec requires: #(#'Gravatar-Core' ). ].
		spec 
			group: 'Core' with: #(#'Gravatar-Core' );
			group: 'Tests' with: #(#'Gravatar-Tests' );
			group: 'default' with: #('Core' 'Tests' ). ].

]

{ #category : #accessing }
ConfigurationOfGravatar >> customProjectAttributes [
	 "Edit to return a collection of any custom attributes e.g. for conditional loading: Array with: #'Condition1' with: #'Condition2.
	For more information see: http://code.google.com/p/metacello/wiki/CustomProjectAttrributes"

	^ #().
]

{ #category : #'symbolic versions' }
ConfigurationOfGravatar >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: '0.1-baseline'.

]

{ #category : #accessing }
ConfigurationOfGravatar >> project [

	^ project ifNil: [ 
		"Bootstrap Metacello if it is not already loaded"
		(self class baseConfigurationClassIfAbsent: []) ensureMetacello.
		"Construct Metacello project"
		project := MetacelloMCProject new projectAttributes: self customProjectAttributes. 
		(Smalltalk at: #MetacelloVersionConstructor) on: self project: project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : #'symbolic versions' }
ConfigurationOfGravatar >> stable: spec [
	<symbolicVersion: #'stable'>

	spec for: #'common' version: '0.1.0'.

]

{ #category : #versions }
ConfigurationOfGravatar >> version010: spec [
	<version: '0.1.0' imports: #('0.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'stable'.
		spec description: 'version 0.1.0'.
		spec author: 'TorstenBergmann'.
		spec timestamp: '4/23/2014 13:08'.
		spec 
			package: #'Gravatar-Core' with: 'Gravatar-Core-BiardMathias.7';
			package: #'Gravatar-Tests' with: 'Gravatar-Tests-BiardMathias.2'. ].

]
