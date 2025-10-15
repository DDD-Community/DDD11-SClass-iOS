//
//  ChecklistColorType.swift
//  FeatureHome
//
//  Created by 현수빈 on 10/15/25.
//

import SwiftUI

public enum ChecklistColorType: Int, CaseIterable {
  case blue = 0
  case green
  case orange
  
  public init(index: Int) {
    self = ChecklistColorType(rawValue: index % ChecklistColorType.allCases.count ) ?? .blue
  }
  
  // MARK: - 체크리스트 색상
  var checklistColor: Color {
    switch self {
    case .blue:
      return Color.primary050
    case .green:
      return Color(hex: "EFFAF3")
    case .orange:
      return Color.sub050
    }
  }
  
   var checklistTintColor: Color {
    switch self {
    case .blue:
      return Color.primary500
    case .green:
      return Color(hex: "84E1AF")
    case .orange:
      return Color.sub500
    }
  }
  
  // MARK: - 선택 시 체크리스 색상
  var checklistSelectedColor: Color {
    switch self {
    case .blue:
      return Color.primary100
    case .green:
      return Color(hex: "E5FBEC")
    case .orange:
      return Color.sub100
    }
  }
  
  var checklistSelectedTintColor: Color {
    switch self {
    case .blue:
      return Color.primary900
    case .green:
      return Color(hex: "489C6E")
    case .orange:
      return Color.sub600
    }
  }
}
