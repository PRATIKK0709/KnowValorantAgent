//
//  AsyncImageView.swift
//  KnowValorantAgents
//
//  Created by Pratik Ray on 22/09/23.
//

import SwiftUI

struct AsyncImageView: View {
    @StateObject private var imageLoader = ImageLoader()
    private let url: URL?
    
    init(url: URL?) {
        self.url = url
    }
    
    var body: some View {
        if let image = imageLoader.image {
            Image(uiImage: image)
                .resizable()
        } else {
            Image(systemName: "photo")
                .resizable()
                .onAppear {
                    imageLoader.loadImage(from: url)
                }
        }
    }
}

