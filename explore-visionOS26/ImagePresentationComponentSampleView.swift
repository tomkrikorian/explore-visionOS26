import SwiftUI
import RealityKit

struct ImagePresentationComponentSampleView: View {
    var body: some View {
        StereoImageView()
    }
}

struct StereoImageView: View {
    @State private var root = Entity()
    @State private var imageEntity: Entity?

    var body: some View {
        RealityView { content in
            content.add(root)
            await setupSpatialImage()
        }
        .realityViewLayoutBehavior(.fixedSize)
        .frame(depth: 1)
    }

    private func setupSpatialImage() async {
        guard let url = Bundle.main.url(forResource: "wwdc2025", withExtension: "jpg") else {
            print("Failed to find spatial image in bundle")
            return
        }

        do {
            let spatial3DImage = try await ImagePresentationComponent.Spatial3DImage(contentsOf: url)

            var component = ImagePresentationComponent(spatial3DImage: spatial3DImage)
            component.desiredViewingMode = .spatial3D
            let entity = Entity()
            entity.components.set(component)

            try await spatial3DImage.generate()

            root.addChild(entity)
            imageEntity = entity

        } catch {
            print("Failed to create spatial image: \(error)")
        }
    }


}

#Preview {
    ImagePresentationComponentSampleView()
}
