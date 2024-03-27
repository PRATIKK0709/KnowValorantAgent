//
//  AbilityView.swift
//  KnowValorantAgents
//
//  Created by Pratik Ray on 22/09/23.

import SwiftUI

struct AbilityView: View {
    let ability: Ability
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(ability.displayName)
                .font(.subheadline)
                .foregroundColor(.primary)
            
            Text(ability.description)
                .font(.body)
                .foregroundColor(.secondary)
        }
    }
}
