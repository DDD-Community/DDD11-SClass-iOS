//
//  KakaoLogin.swift
//  CoreNetwork
//
//  Created by 현수빈 on 1/15/25.
//

import Foundation

import CoreDomain

import KakaoSDKAuth
import KakaoSDKCommon
import KakaoSDKUser

enum KakaoErrorType: Error {
  case invalidToken
}

final class KakaoLogin {
  private var continuation: CheckedContinuation<SocialLoginInfo, Error>? = nil
  
  
  func initSDK() {
    if let appkey = Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"] as? String {
      KakaoSDK.initSDK(appKey: appkey)
    }
  }
  
  /// Handle KakaoTalkLoginUrl
  func handleKakaoTalkLoginUrl(url: URL) {
      guard AuthApi.isKakaoTalkLoginUrl(url) else { return }
      _ = AuthController.handleOpenUrl(url: url)
  }
  
  /// 카카오톡 로그인
  @MainActor
  func kakaoLogin() async throws -> SocialLoginInfo {
    return try await withCheckedThrowingContinuation { continuation in
      self.continuation = continuation
      let nonce = UUID().uuidString
      
      if UserApi.isKakaoTalkLoginAvailable() {
        loginWithKakaoTalk(nonce: nonce)
      } else {
        loginWithKakaoWeb(nonce: nonce)
      }
    }
  }
  
  /// 카카오톡(앱)으로 로그인
  private func loginWithKakaoTalk(nonce: String) {
    UserApi.shared.loginWithKakaoTalk(nonce: nonce) { [weak self] OAuthToken, error in
      guard let self else { return }
      
      if let error {
        self.continuation?.resume(throwing: error)
        self.continuation = nil
        debugPrint("\(error)")
        return
      } else if let token = OAuthToken?.idToken {
        self.setSocialLoginData(idToken: token, nonce: nonce)
        debugPrint("loginWithKakaoTalk() success., \(#function), \(#line)")
      } else {
        self.continuation?.resume(throwing: KakaoErrorType.invalidToken)
        self.continuation = nil
        return
      }
    }
  }
  
  /// 웹에서 카카오 계정 Access
  private func loginWithKakaoWeb(nonce: String) {
    UserApi.shared.loginWithKakaoAccount(nonce: nonce) { [weak self] OAuthToken, error in
      guard let self else { return }
      
      if let error {
        self.continuation?.resume(throwing: error)
        self.continuation = nil
        debugPrint("\(error)")
        return
      } else if let token = OAuthToken?.idToken {
        self.setSocialLoginData(idToken: token, nonce: nonce)
        debugPrint("loginWithWeb() success., \(#function), \(#line)")
      } else {
        self.continuation?.resume(throwing: KakaoErrorType.invalidToken)
        self.continuation = nil
        return
      }
    }
  }
  
  private func setSocialLoginData(idToken: String, nonce: String) {
    UserApi.shared.me { User, Error in
      debugPrint(User)
    }
    let info = SocialLoginInfo(idToken: idToken, nonce: nonce, provider: .kakao)
    continuation?.resume(returning: info)
    continuation = nil
  }
}
