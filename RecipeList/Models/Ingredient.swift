//
//  Ingredient.swift
//  RecipeList
//
//  Created by Cristian Guerra on 22/3/2564 BE.
//

import Foundation

class Ingredient: Identifiable, Decodable {
    
    var id:UUID?
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?
    
}
