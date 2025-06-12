//
//  ContentView.swift
//  explore-visionOS26
//
//  Created by Tom Krikorian on 11/06/2025.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    var body: some View {
        NavigationStack {
            List {
                NavigationLink("ImagePresentationComponent Example") {
                    ImagePresentationComponentSampleView()
                }
            }
            .navigationTitle("Explore visionOS 26")
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
