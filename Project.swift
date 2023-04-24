import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "Dalla",
    platform: .iOS,
    product: .app,
    dependencies: [
//        .project(target: "Feature", path: .relativeToRoot("Projects/Feature"))
    ],
    resources: ["Resources/**"],
    infoPlist: .file(path: "Support/Info.plist")
)
