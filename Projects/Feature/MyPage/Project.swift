import Foundation
import ProjectDescription
import DependencyPlugin
import ProjectTemplatePlugin

let project = Project.makeAppModule(
  name: "FeatureMyPage",
  bundleId: .bundleId(name: "Feature.MyPage"),
  product: .staticFramework,
  settings: .moduleSettings,
  dependencies: [
    .core
  ],
  sources: ["Sources/**"]
)
