// swift-tools-version:5.10.0

import PackageDescription

let package = Package(
  name: "Pitchy",
  platforms: [.iOS(.v15), .macOS(.v13)],
  products: [
    .library(
        name: "Pitchy",
        targets: ["Pitchy"]
    )
  ],
  dependencies: [
    .package(
        url: "https://github.com/Quick/Quick",
        from: "7.6.0"
    ),
    .package(
        url: "https://github.com/Quick/Nimble",
        from: "13.0.0"
    ),
  ],
  
  targets: [
    .target(
        name: "Pitchy",
        dependencies: [
            "Quick",
            "Nimble"
        ]
    ),
    .testTarget(
      name: "PitchyTests",
      dependencies: [
        "Pitchy",
        "Quick",
        "Nimble"
      ],
      exclude: [
        "Mac/Info.plist",
        "iOS/Info.plist"
      ]
    ),
  ]
)
