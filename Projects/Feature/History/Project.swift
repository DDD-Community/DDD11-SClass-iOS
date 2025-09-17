import Foundation
import ProjectDescription
import DependencyPlugin
import ProjectTemplatePlugin

let project = Project.makeAppModule(
  name: "FeatureHistory",
  bundleId: .bundleId(name: "Feature.History"),
  product: .staticFramework,
  settings: .settings(),
  dependencies: [
    .core
  ],
  sources: ["Sources/**"]
)
