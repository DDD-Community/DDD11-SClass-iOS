import Foundation
import ProjectDescription
import DependencyPlugin
import ProjectTemplatePlugin
import DependencyPackagePlugin

let project = Project.makeAppModule(
  name: "SharedThirdPartyLib",
  bundleId: .appBundleID(name: "Shared.ThirdPartyLib"),
  product: .staticFramework,
  settings: .settings(),
  dependencies: [
    .SPM.composableArchitecture,
    .SPM.moya,
    .SPM.combineMoya
  ],
  sources: ["Sources/**"]
)
