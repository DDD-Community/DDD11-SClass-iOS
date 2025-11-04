//
//  CardView.swift
//  FeatureHome
//
//  Created by 홍은표 on 9/25/24.
//

import SwiftUI

import SharedDesignSystem

struct CardView: View {
  private let title: String
  private let isSelected: Bool
  private let progress: CGFloat
  private let onTap: () -> Void
  private let colorType: ChecklistColorType

  init(
    colorType: ChecklistColorType,
    title: String,
    isSelected: Bool,
    progress: CGFloat,
    onTap: @escaping () -> Void
  ) {
    self.colorType = colorType
    self.title = title
    self.isSelected = isSelected
    self.progress = progress
    self.onTap = onTap
  }

  var body: some View {
    Button(action: {
      onTap()
    }) {
      HStack(spacing: .zero) {
        VStack(alignment: .leading, spacing: 10) {
          CardProgressView(colorType: colorType, isSelected: isSelected, progress: progress)
            .padding(.top, 14)

          Text(title)
            .notoSans(.subhead_3)
            .foregroundStyle(isSelected ? colorType.cardTintColor : .greyScale600)
        }
        Spacer()
      }
    }
    .padding(.horizontal, 12)
    .frame(width: 162, height: 120)
    .background(isSelected ? colorType.cardColor : .greyScale050)
    .clipShape(
      .rect(cornerRadius: 10)
    )
  }
}

extension ChecklistColorType {
  
  // MARK: - 카드 색상
  var cardColor: Color {
    switch self {
    case .blue:
      return Color.primary100
    case .green:
      return Color(hex: "EFFAF3")
    case .orange:
      return Color(hex: "FBF1D2")
    }
  }
  
  var cardTintColor: Color {
    switch self {
    case .blue:
      return Color.primary800
    case .green:
      return Color(hex: "84E1AF")
    case .orange:
      return Color(hex: "F07603")
    }
  }
}
