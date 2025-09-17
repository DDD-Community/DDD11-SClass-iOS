import Foundation
import ProjectDescription
import DependencyPlugin
import ProjectTemplatePlugin

let project = Project.makeModule(
  name: "Shared",
  bundleId: .bundleId(name: "Shared"),
  product: .staticFramework,
  settings: .moduleSettings,
  dependencies: [
    .shared(implements: .designSystem),
    .shared(implements: .thirdPartyLib),
    .shared(implements: .utils)
  ],
  sources: ["Sources/**"]
)
