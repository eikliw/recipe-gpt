//
//  RecipeViewModel.swift
//  Paleo
//
//  Created by Adam Wilkie on 4/24/23.
//

import SwiftUI
import Combine

class RecipeViewModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        fetchRecipes()
    }
    
    func fetchRecipes() {
        let url = URL(string: "https://api.spoonacular.com/recipes/random?number=10&apiKey=5e2f3b873f0b4264a09147ee4175757f")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            let recipes = try! JSONDecoder().decode([Recipe].self, from: data!)
            
            DispatchQueue.main.async {
                self.recipes = recipes
            }
        }.resume()
    }
}

struct Recipe: Identifiable {
    var id = UUID()
    var title: String
    var imageUrl: String
    var ingredients: [Ingredient]
    var instructions: String
}

struct Ingredient: Identifiable {
    var id = UUID()
    var name: String
    var quantity: Int
    var unit: String
}
extension Ingredient: Decodable {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try values.decode(String.self, forKey: .name)
        quantity = try values.decode(Int.self, forKey: .quantity)
        unit = try values.decode(String.self, forKey: .unit)
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case quantity
        case unit
    }
}


extension Recipe: Decodable {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try values.decode(String.self, forKey: .title)
        imageUrl = try values.decode(String.self, forKey: .imageUrl)
        ingredients = try values.decode([Ingredient].self, forKey: .ingredients)
        instructions = try values.decode(String.self, forKey: .instructions)
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case imageUrl
        case ingredients
        case instructions
    }
}



