//
//  RecipeDetailView.swift
//  RecipeList
//
//  Created by Cristian Guerra on 18/3/2564 BE.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @State var picker = 2
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                Text(recipe.name)
                    .font(.title)
                
                VStack {
                    Text("Choose servings size")
                        .font(.caption)
                    Picker("", selection: $picker) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width:160)
                }
                .padding()
                
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.vertical, 5.0)
                    ForEach(recipe.ingredients) { i in
                        Text(" - " + RecipeModel.ingredient_amount(ingredient: i, recipeServings: recipe.servings, targetServings: picker) + " " + i.name)
                    }
                }
                .padding(.leading, 5.0)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.vertical, 5.0)
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index+1) + ". " + recipe.directions[index])
                    }
                }
                .padding(.horizontal, 5.0)
                
            }
        }.navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        RecipeDetailView(recipe: RecipeModel().recipes[0])
    }
}
