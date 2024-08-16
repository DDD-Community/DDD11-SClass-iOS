//
//  HomeView.swift
//  OnboardingKit.
//
//  Created by SClass on 2024/07/20
//  Copyright © 2024 DDD , Ltd., All rights reserved.
//

import SwiftUI
import SharedDesignSystem

public struct HomeView: View {
  
  public init() {}
  
  public var body: some View {
    VStack {
      TopNavigation(
        centerTitle: "텍스트 입력"
      )
      TopNavigation(
        leadingItem: (SharedDesignSystemAsset.Image.left, {}),
        centerTitle: "텍스트 입력"
      )
      TopNavigation(
        leadingItem: (SharedDesignSystemAsset.Image.left, {}),
        centerTitle: "텍스트 입력",
        trailingButton: ("완료", {})
      )
      TopNavigation(
        leadingItem: (SharedDesignSystemAsset.Image.left, {}),
        centerTitle: "텍스트 입력",
        trailingItem: (SharedDesignSystemAsset.Image.vertical, {})
      )
      
      CustomProgressBar(progress: 0.333)
      CustomProgressBar(progress: 0.66)
      CustomProgressBar(progress: 0.9999999)
      
      CommonButton(title: "텍스트 내용",
                   style: .line,
                   isActive: true,
                   action: {
      })
      
      CommonButton(title: "텍스트 내용",
                   style: .default,
                   isActive: false,
                   action: {
      })
      
      CommonButton(title: "텍스트 내용",
                   style: .default,
                   isActive: true,
                   action: {
      })
      
      CommonButton(title: "텍스트 내용",
                   style: .contrast,
                   isActive: true,
                   action: {
      })
      
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundColor(.accentColor)
      Text("Hello, world!")
    }
    .padding()
    .background(Color.white)
  }
}
