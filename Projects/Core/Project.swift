import Foundation
import ProjectDescription
import DependencyPlugin
import ProjectTemplatePlugin

let project = Project.makeModule(
  name: "Core",
  bundleId: .bundleId(name: "Core"),
  product: .staticFramework,
  settings: .moduleSettings,
  dependencies: [
    .core(implements: .common),
    .core(implements: .domain),
    .core(implements: .network),
    .shared
  ],
  sources: ["Sources/**"]
)
