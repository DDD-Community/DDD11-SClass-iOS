import Foundation
import ProjectDescription
import DependencyPlugin
import ProjectTemplatePlugin

let project = Project.makeAppModule(
  name: "FeatureOnboarding",
  bundleId: .bundleId(name: "Feature.Onboarding"),
  product: .staticFramework,
  settings: .settings(),
  dependencies: [
    .core
  ],
  sources: ["Sources/**"]
)
