import Foundation
import ProjectDescription
import DependencyPlugin
import ProjectTemplatePlugin

let project = Project.makeAppModule(
  name: "FeatureLogin",
  bundleId: .bundleId(name: "Feature.Login"),
  product: .staticFramework,
  settings: .moduleSettings,
  dependencies: [
    .core
  ],
  sources: ["Sources/**"]
)
