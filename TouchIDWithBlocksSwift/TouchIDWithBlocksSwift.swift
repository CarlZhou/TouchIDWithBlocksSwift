//
//  TouchIDWithBlocksSwift.swift
//  TouchIDWithBlocksSwift
//
//  Created by Carl Zhou on 2014-07-08.
//  Copyright (c) 2014 czlabs. All rights reserved.
//

import Foundation
import LocalAuthentication

class TouchIDWithBlocksSwift : NSObject {
    
    class func authenticate(reasonString : String, success : ((Void) -> Void)!, failure : ((NSError!) -> Void)!) {
        var context = LAContext()
        var error : NSError?
        
        if context.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: reasonString, reply: {(successBoolean : Bool, errorReturned : NSError?) -> Void in
                
                if successBoolean {
                    
                    if success {
                        success()
                    }
                    
                } else {
                    
                    switch errorReturned!.code {
                    case LAError.AuthenticationFailed.toRaw():
                        // Authentication Failed
                        break;
                        
                    case LAError.UserCancel.toRaw():
                        // User pressed Cancel button
                        break;
                        
                    case LAError.UserFallback.toRaw():
                        // User pressed "Enter Password"
                        break;
                        
                    case LAError.PasscodeNotSet.toRaw():
                        // Passcode not set
                        break;
                        
                    case LAError.SystemCancel.toRaw():
                        // System cancel
                        break;
                        
                    default:
                        // Touch ID is not configured
                        break;
                    }
                    
                    if failure {
                        failure(errorReturned)
                    }
                }
                
                })
        } else {
            
            switch error!.code {
            case LAError.TouchIDNotEnrolled.toRaw():
                // TouchID not enrolled
                break;
                
            case LAError.TouchIDNotAvailable.toRaw():
                // TouchID not available
                break;
                
            case LAError.PasscodeNotSet.toRaw():
                // Passcode not set
                break;
                
            default:
                // Unable to authenticate
                break;
            }
            
            if failure {
                failure(error)
            }
        }
    }
    
}