import Foundation
import ProjectDescription
import DependencyPlugin
import ProjectTemplatePlugin

let project = Project.makeAppModule(
  name: "CoreNetwork",
  bundleId: .bundleId(name: "Core.Network"),
  product: .staticFramework,
  settings: .settings(),
  dependencies: [
    .shared
  ],
  sources: ["Sources/**"]
)
