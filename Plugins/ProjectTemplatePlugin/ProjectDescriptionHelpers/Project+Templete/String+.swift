//
//  String+.swift
//  ProjectTemplatePlugin
//
//  Created by 홍은표 on 6/23/24.
//

import Foundation
import ProjectDescription

extension String {
  public static func bundleId(name: String) -> String {
    return "\(Project.Environment.bundlePrefix)\(name)"
  }
}
