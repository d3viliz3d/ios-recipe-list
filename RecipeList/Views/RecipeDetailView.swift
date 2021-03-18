//
//  RecipeDetailView.swift
//  RecipeList
//
//  Created by Cristian Guerra on 18/3/2564 BE.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.vertical, 5.0)
                    ForEach(recipe.ingredients, id: \.self) { i in
                        Text(" - " + i)
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
