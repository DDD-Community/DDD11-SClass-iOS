//
//  ChecklistList.swift
//  FeatureHome
//
//  Created by eunpyo on 8/25/25.
//

import SwiftUI

import SharedDesignSystem

import ComposableArchitecture

struct ChecklistList: View {
  @Bindable private var store: StoreOf<HomeStore>
  private let width: CGFloat
  private let colorType: ChecklistColorType

  init(store: StoreOf<HomeStore>, width: CGFloat) {
    self.store = store
    self.width = width
    
    if let selected = store.selectedCard,
       let index = store.cards.firstIndex(of: selected) {
      self.colorType = ChecklistColorType(index: index)
    } else {
      self.colorType = .blue
    }
  }

  var body: some View {
    if let selectedCard = store.selectedCard {
      if store.isFetchingChecklistItems {
        SkeletonChecklistListView(width: width - 32)
      } else {
        VStack(spacing: 16) {
          ListSection(
            title: selectedCard.title,
            onTap: {
              store.send(.didTapNavigateToDetailChecklist(card: selectedCard))
            }
          )

          Group {
            if store.displayedCheckBoxes.isEmpty {
              ChecklistCompleteView()
            } else {
              ForEach(store.displayedCheckBoxes) { checkBox in
                DefaultColorChecklistCellView(
                  title: checkBox.label,
                  isSelected: checkBox.isCompleted,
                  onToggle: {
                    store.send(.didTapChecklistCompleteButton(checkBox: checkBox))
                  },
                  colorType: colorType
                )
              }
            }
          }
          .padding(.horizontal, 16)
        }
      }
    }
  }
}

struct ChecklistCompleteView: View {
  var body: some View {
    HStack(spacing: .zero) {
      Text("체크리스트를 모두 완료했어요.")
        .multilineTextAlignment(.leading)
        .notoSans(.body_long_1)
        .foregroundStyle(.greyScale600)
        .padding(.leading, 20)
      
      Spacer()
    }
    .padding(.trailing, 15)
    .frame(maxWidth: .infinity)
    .frame(height: 48)
    .background(.primary100)
    .clipShape(RoundedRectangle(cornerRadius: 4))
    .shadow(color: .greyScale950.opacity(0.05), radius: 5, x: 0, y: 4)
  }
}
