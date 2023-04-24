//
//  RecipeView.swift
//  Paleo
//
//  Created by Adam Wilkie on 4/24/23.
//

import SwiftUI

struct RecipeView: View {
    
    @State private var isFavorite = false
    
    @Binding var recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(recipe.imageUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(10)
                
                Text(recipe.title)
                    .font(.title)
                    .bold()
                    .padding(.top)
                
                Text(recipe.ingredients.map { $0.name }.joined(separator: ", "))
                    .font(.body)
                    .padding()
                
                Text(recipe.instructions)
                    .font(.body)
                    .padding()
                
                Button(action: {
                    isFavorite.toggle()
                }) {
                    Text(isFavorite ? "Unfavorite" : "Favorite")
                }
            }
        }
    }
}


