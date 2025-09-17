import Foundation
import ProjectDescription
import DependencyPlugin
import ProjectTemplatePlugin

let project = Project.makeAppModule(
  name: "FeatureArticle",
  bundleId: .bundleId(name: "Feature.Article"),
  product: .staticFramework,
  settings: .settings(),
  dependencies: [
    .core
  ],
  sources: ["Sources/**"]
)
