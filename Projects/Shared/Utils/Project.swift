import Foundation
import ProjectDescription
import DependencyPlugin
import ProjectTemplatePlugin

let project = Project.makeModule(
  name: "SharedUtils",
  bundleId: .bundleId(name: "Shared.Utils"),
  product: .staticFramework,
  settings: .settings(),
  dependencies: [

  ],
  sources: ["Sources/**"]
)
