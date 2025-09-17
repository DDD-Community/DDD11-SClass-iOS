import Foundation
import ProjectDescription
import DependencyPlugin
import ProjectTemplatePlugin

let project = Project.makeAppModule(
  name: "CoreDomain",
  bundleId: .bundleId(name: "Core.Domain"),
  product: .staticFramework,
  settings: .settings(),
  dependencies: [
    
  ],
  sources: ["Sources/**"]
)
