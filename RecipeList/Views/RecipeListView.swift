//
//  ContentView.swift
//  RecipeList
//
//  Created by Cristian Guerra on 18/3/2564 BE.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack (alignment: .leading) {
                    ForEach(model.recipes) { r in
                        NavigationLink(
                            destination: RecipeDetailView(recipe: r),
                            label: {
                                HStack(spacing: 10.0) {
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    Text(r.name)
                                        .foregroundColor(.white)
                                }
                            })
                        
                    }.navigationBarTitle("All Recipes")
                }
                .padding(.leading)
            }
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .preferredColorScheme(.dark)
            .environmentObject(RecipeModel())
    }
}
