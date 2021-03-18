//
//  RecipeModel.swift
//  RecipeList
//
//  Created by Cristian Guerra on 18/3/2564 BE.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        self.recipes = DataService.getLocalData()
    
    }
    
}
