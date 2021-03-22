//
//  RecipeTabView.swift
//  RecipeList
//
//  Created by Cristian Guerra on 22/3/2564 BE.
//

import SwiftUI

struct RecipeTabView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        TabView () {
            
            RecipeFeaturedView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("Recipes")
                    }
                }
        }
        .environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
