//
//  String+.swift
//  SharedUtils
//
//  Created by 현수빈 on 6/18/25.
//
import Foundation

public extension String {
  var relativeDateString: String? {
    let formatter: DateFormatter = .longFormWithMicroseconds
    guard let date = formatter.date(from: self) else {
      return nil
    }

    return Formatter.relative.localizedString(
      for: date,
      relativeTo: Date()
    )
  }

  func toDate(with formatter: DateFormatter) -> Date? {
    return formatter.date(from: self)
  }
}
