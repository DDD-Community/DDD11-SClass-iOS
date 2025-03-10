//
//  RootStore.swift
//  OnboardingKit
//
//  Created by 홍은표 on 7/27/24.
//

import Foundation

import CoreDomain
import Feature

import ComposableArchitecture

@Reducer
public struct RootStore {
  @ObservableState
  public enum State {
    case splash(SplashStore.State)
    case login(LoginStore.State)
    case onboarding(OnboardingRootStore.State)
    case mainTab(MainTabStore.State)
    
    init() {
      self = .splash(.init())
    }
  }
  
  @Dependency(\.socialLogin) private var socialLogin
  
  public enum Action {
    case splash(SplashStore.Action)
    case login(LoginStore.Action)
    case onboarding(OnboardingRootStore.Action)
    case mainTab(MainTabStore.Action)
    case onOpenURL(URL)
  }
  
  public var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .splash(.routeToLoginScreen):
        state = .login(LoginStore.State())
        return .none
      case .splash(.routeToMainTabScreen):
        state = .mainTab(.init(.home))
        return .none
          
      case .splash(.routeToOnboardingScreen), .login(.routeToOnboardingScreen), .login(.loginSuccess(_,_)):
        state = .onboarding(OnboardingRootStore.State())
        return .none
    
      case .onboarding(.onSuccessSignUp):
        state = .mainTab(.init(.home))
        return .none
      
      case .mainTab(.routeToLoginPage):
        state = .login(.init())
        return .none
    
      case let .onOpenURL(url):
        socialLogin.handleKakaoUrl(url)
        return .none
          
      default:
        return .none
      }
    }
    .ifCaseLet(\.splash, action: \.splash) {
      SplashStore()
    }
    .ifCaseLet(\.login, action: \.login) {
      LoginStore()
    }
    .ifCaseLet(\.onboarding, action: \.onboarding) {
      OnboardingRootStore()
    }
    .ifCaseLet(\.mainTab, action: \.mainTab) {
      MainTabStore()
    }
  }
}
