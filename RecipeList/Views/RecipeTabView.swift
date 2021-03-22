//
//  RecipeTabView.swift
//  RecipeList
//
//  Created by Cristian Guerra on 22/3/2564 BE.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        TabView () {
            Text("featuredView")
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
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
