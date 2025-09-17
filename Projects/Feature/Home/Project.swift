import Foundation
import ProjectDescription
import DependencyPlugin
import ProjectTemplatePlugin

let project = Project.makeAppModule(
  name: "FeatureHome",
  bundleId: .bundleId(name: "Feature.Home"),
  product: .staticFramework,
  settings: .settings(),
  dependencies: [
    .core
  ],
  sources: ["Sources/**"]
)
