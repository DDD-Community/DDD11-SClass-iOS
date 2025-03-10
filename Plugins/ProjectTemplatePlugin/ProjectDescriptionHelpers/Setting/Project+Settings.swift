//
//  Project+Settings.swift
//  ProjectTemplatePlugin
//
//  Created by 홍은표 on 6/23/24.
//

import Foundation
import ProjectDescription

private extension ProjectDescription.ConfigurationName {
  static let qa = Self("QA")
}

extension Settings {
  private static func commonSettings(
    appName: String,
    displayName: String,
    provisioningProfile: String
  ) -> SettingsDictionary {
    return SettingsDictionary()
      .setProductName(appName)
      .setCFBundleDisplayName(displayName)
      .setOtherLdFlags("-ObjC -all_load")
      .setDebugInformationFormat("non-global")
      .setProvisioningProfileSpecifier(provisioningProfile)
  }
  
  public static let appMainSetting: Settings = .settings(
    base: SettingsDictionary()
      .setProductName(Project.Environment.appName)
      .setCFBundleDisplayName(Project.Environment.appName)
      .setMarketingVersion(.appVersion(version: Project.Environment.appVersion))
      .setASAuthenticationServicesEnabled()
      .setPushNotificationsEnabled()
      .setEnableBackgroundModes()
      .setArchs()
      .setOtherLdFlags()
      .setCurrentProjectVersion(.appBuildVersion())
      .setCodeSignIdentity()
      .setCodeSignStyle()
      .setVersioningSystem()
      .setProvisioningProfileSpecifier("match AppStore com.DDD.OnboardingKit")
      .setDevelopmentTeam(Project.Environment.organizationTeamId)
      .setSkipInstall(true)
      .setDebugInformationFormat(),
    configurations: [
      .debug(
        name: .debug,
        settings: commonSettings(
          appName: Project.Environment.appDevName,
          displayName: Project.Environment.appDevName,
          provisioningProfile: "match Development com.DDD.OnboardingKit 1736917996"
        ),
        xcconfig: "Resources/Config.xcconfig"
      ),
      .debug(
        name: .qa,
        settings: commonSettings(
          appName: Project.Environment.appDemoName,
          displayName: Project.Environment.appDemoName,
          provisioningProfile: "match AppStore com.DDD.OnboardingKit"
        ),
        xcconfig: "Resources/Config.xcconfig"
      ),
      .release(
        name: .release,
        settings: commonSettings(
          appName: Project.Environment.appName,
          displayName: Project.Environment.appName,
          provisioningProfile: "match AppStore com.DDD.OnboardingKit"
        ),
        xcconfig: "Resources/Config.xcconfig"
      )
    ],
    defaultSettings: .recommended
  )
}
