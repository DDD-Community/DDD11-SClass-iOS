//
//  String+.swift
//  ProjectTemplatePlugin
//
//  Created by 홍은표 on 6/23/24.
//

import Foundation
import ProjectDescription

extension String {
  public static func appVersion(version: String = "1.0.0") -> String {
    return version
  }
  
  public static func appBuildVersion(buildVersion: String = "1") -> String {
    return buildVersion
  }
    return "\(Project.Environment.bundlePrefix)\(name)"
  }
}
