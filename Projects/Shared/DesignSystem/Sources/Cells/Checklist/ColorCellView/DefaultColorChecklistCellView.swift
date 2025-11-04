//
//  DefaultColorChecklistCellView.swift
//  SharedDesignSystem
//
//  Created by 홍은표 on 9/22/24.
//

import SwiftUI

public struct DefaultColorChecklistCellView: View {
  private let title: String
  private let isSelected: Bool
  private let onToggle: () -> Void
  private let colorType: ChecklistColorType
  
  public init(
    title: String,
    isSelected: Bool,
    onToggle: @escaping () -> Void,
    colorType: ChecklistColorType
  ) {
    self.title = title
    self.isSelected = isSelected
    self.onToggle = onToggle
    self.colorType = colorType
  }
  
  public var body: some View {
    BaseColorChecklistCellView(
      title: title,
      isSelected: isSelected,
      type: .`default`(colorType),
      onToggle: onToggle
    )
  }
}
