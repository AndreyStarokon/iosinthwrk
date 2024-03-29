//
//  LocalAutorizationService.swift
//  VK_app
//
//  Created by Ffhh Qerg on 10.10.2022.
//

import UIKit
import LocalAuthentication

class LocalAuthorizationService {
    func authorizeIfPossible(_ authorizationFinished: @escaping (Bool) -> Void) {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Идентифицируйте себя!"

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in

                DispatchQueue.main.async {
                    if success {
                        authorizationFinished(true)
                    } else {
                        authorizationFinished(false)
                    }
                }
            }
        } else {
            authorizationFinished(false)
        }
    }
}
