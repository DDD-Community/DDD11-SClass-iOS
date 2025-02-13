//
//  SocialLogin.swift
//  CoreNetwork
//
//  Created by 현수빈 on 1/15/25.
//

import AuthenticationServices
import Foundation

import CoreDomain

public enum AppleErrorType: Error {
  case invalidToken
  case invalidAuthorizationCode
  case dismissASAuthorizationController
  case ASAuthorizationAppleIDCredentialError
}

final class AppleLogin: NSObject, ASAuthorizationControllerDelegate {
  private var continuation: CheckedContinuation<SocialLoginInfo, Error>? = nil
  
  /// 애플 로그인
  @MainActor
  func appleLogin() async throws -> SocialLoginInfo {
    return try await withCheckedThrowingContinuation { continuation in
      let appleIDProvider = ASAuthorizationAppleIDProvider()
      let request = appleIDProvider.createRequest()
      request.requestedScopes = [.fullName, .email]
      
      let authorizationController = ASAuthorizationController(authorizationRequests: [request])
      authorizationController.delegate = self
      authorizationController.performRequests()
      
      if self.continuation == nil {
        self.continuation = continuation
      }
    }
  }
  
  func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
    defer {
      continuation = nil
    }
    switch authorization.credential {
    case let appleIDCredential as ASAuthorizationAppleIDCredential:
      let email = appleIDCredential.email
      debugPrint("appleLogin email: \(email ?? "")")
      let fullName = appleIDCredential.fullName
      debugPrint("appleLogin fullName: \(fullName?.description ?? "")")
      
      guard let tokenData = appleIDCredential.identityToken,
            let token = String(data: tokenData, encoding: .utf8) else {
        continuation?.resume(throwing: AppleErrorType.invalidToken)
        return
      }
      
      debugPrint("appleLogin token: \(token)")
      
      guard let authorizationCode = appleIDCredential.authorizationCode,
            let authorizationCodeString = String(data: authorizationCode, encoding: .utf8) else {
          continuation?.resume(throwing: AppleErrorType.invalidAuthorizationCode)
          return
      }
      
      debugPrint("appleLogin authorizationCode: \(authorizationCodeString)")
      
      let userIdentifier = appleIDCredential.user
      debugPrint("appleLogin authenticated user: \(userIdentifier)")
      
      let info = SocialLoginInfo(idToken: token, provider: .apple)
        
      continuation?.resume(returning: info)
      
    default:
      continuation?.resume(throwing: AppleErrorType.ASAuthorizationAppleIDCredentialError)
    }
  }
  
  @MainActor
  func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
    if let authError = error as? ASAuthorizationError {
      switch authError.code {
      case .canceled:
        continuation?.resume(throwing: AppleErrorType.dismissASAuthorizationController)
        continuation = nil

      default:
        continuation?.resume(throwing: authError)
        continuation = nil
      }
    }
  }
}
