//
//  Recipe.swift
//  RecipeList
//
//  Created by Cristian Guerra on 18/3/2564 BE.
//

import Foundation

class Recipe: Identifiable, Decodable {
    
    var id:UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings: Int
    var ingredients:[Ingredient]
    var directions:[String]
    var highlights:[String]
    
}
