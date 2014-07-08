TouchIDWithBlocksSwift
======================

## Intro

Use the iOS 8 TouchID authentication feature in swift.

## Requirements

TouchID authentication only works on iOS 8.x+ version. It depends on the following Apple frameworks:

* LocalAuthentication.framework

## Usage

Directly add the `TouchIDWithBlocksSwift.swift` source file to your project.
Use the class method `authenticate(reasonString : String, success : ((Void) -> Void)!, failure : ((NSError!) -> Void)!)` to perform TouchID authentication
