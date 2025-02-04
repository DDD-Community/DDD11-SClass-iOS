//
//  SocialLoginInfo.swift
//  CoreDomain
//
//  Created by 현수빈 on 1/15/25.
//

import Foundation

public struct SocialLoginInfo: Equatable {
  public let idToken: String
  public let nonce: String?
  public let provider: SocialLoginType
  
  public init(
    idToken: String,
    nonce: String? = nil,
    provider: SocialLoginType
  ) {
    self.idToken = idToken
    self.nonce = nonce
    self.provider = provider
  }
}
