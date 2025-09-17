import Foundation
import ProjectDescription
import DependencyPlugin
import ProjectTemplatePlugin

let project = Project.makeModule(
  name: "SharedDesignSystem",
  bundleId: .bundleId(name: "Shared.DesignSystem"),
  product: .staticFramework,
  settings: .moduleSettings,
  dependencies: [
    .shared(implements: .thirdPartyLib)
  ],
  sources: ["Sources/**"],
  resources: ["Resources/**"]
)
