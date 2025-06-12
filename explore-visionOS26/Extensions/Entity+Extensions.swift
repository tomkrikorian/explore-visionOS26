//
//  Entity+Extensions.swift
//  explore-visionOS26
//
//  Created by Tom Krikorian on 14/06/2025.
//

import RealityKit

extension Entity {
    func scaleToFit(_ currentSize: SIMD2<Float>, within targetSize: SIMD3<Float>) {
        let prevailingScale = min(targetSize.x / currentSize.x, targetSize.y / currentSize.y)
        scale = SIMD3<Float>(repeating: prevailingScale)
    }
}
