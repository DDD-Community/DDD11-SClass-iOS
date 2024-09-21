//
//  HomeRootStore.swift
//  FeatureHome
//
//  Created by 홍은표 on 7/27/24.
//

import Foundation
import ComposableArchitecture

@Reducer
public struct HomeRootStore {
  public init() { }
  
  @ObservableState
  public struct State {
    var path = StackState<Path.State>()
    var home: HomeStore.State = .init()
    
    public init() {
      
    }
  }
  
  public enum Action {
    case path(StackActionOf<Path>)
    case home(HomeStore.Action)
    case onPresentChat
  }
  
  @Reducer
  public enum Path {
    
  }
  
  public var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .path:
        return .none
      case .home(.onPresentChat):
        return .send(.onPresentChat)
      case .home:
        return .none
      default:
        return .none
      }
    }
    .forEach(\.path, action: \.path)
    
    Scope(state: \.home, action: \.home) {
      HomeStore()
    }
  }
}
