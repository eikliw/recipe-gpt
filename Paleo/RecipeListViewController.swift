//
//  RecipeListViewController.swift
//  Paleo
//
//  Created by Adam Wilkie on 4/24/23.
//

import SwiftUI

struct RecipeListViewController: View {
    @ObservedObject var viewModel: RecipeViewModel
    
    var body: some View {
        List(viewModel.recipes) { recipe in
            NavigationLink(destination: RecipeView(recipe: recipe)) {
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
                }
            }
        }
        .navigationBarTitle("Recipes")
    }
}



