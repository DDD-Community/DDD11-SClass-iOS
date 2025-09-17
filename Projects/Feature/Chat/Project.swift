import Foundation
import ProjectDescription
import DependencyPlugin
import ProjectTemplatePlugin

let project = Project.makeAppModule(
  name: "FeatureChat",
  bundleId: .bundleId(name: "Feature.Chat"),
  product: .staticFramework,
  settings: .settings(),
  dependencies: [
    .core
  ],
  sources: ["Sources/**"]
)
