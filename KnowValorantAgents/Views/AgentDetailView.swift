//
//  AgentDetailView.swift
//  KnowValorantAgents
//
//  Created by Pratik Ray on 22/09/23.
//

import SwiftUI

struct AgentDetailView: View {
    let agentData: AgentData
    let didSelectBack: () -> Void
    @State private var image: UIImage? // Store the fetched image
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .padding()
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .padding()
            }
            
            Text(agentData.displayName)
                .font(.title)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
            
            Text(agentData.description)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            Divider()
            
            Text("Abilities")
                .font(.headline)
                .padding(.bottom, 5)
            
            VStack(alignment: .leading, spacing: 10) {
                ForEach(agentData.abilities, id: \.self) { ability in
                    AbilityView(ability: ability)
                }
            }
        }
        .padding()
        .onAppear {
            loadImage()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: didSelectBack) {
            Image(systemName: "chevron.left")
            Text("Back")
        })
    }
    
    private func loadImage() {
        guard let url = URL(string: agentData.displayIconSmall) else { return }
        
        // Check if the image is already cached
        if let cachedImage = ImageCache.shared.image(forKey: url.absoluteString) {
            self.image = cachedImage
            return
        }
        
        // Fetch image asynchronously
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let loadedImage = UIImage(data: data) else {
                print("Error loading image: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            // Cache the loaded image
            ImageCache.shared.saveImage(loadedImage, forKey: url.absoluteString)
            
            DispatchQueue.main.async {
                self.image = loadedImage
            }
        }.resume()
    }
}
