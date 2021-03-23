//
//  RecipeFeatured.swift
//  RecipeList
//
//  Created by Cristian Guerra on 22/3/2564 BE.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    @State var tabIndex = 1
    
    var body: some View {
        
        VStack (alignment: .leading){
            
            Text("Featured recipes")
                .font(Font.custom("Avenir Heavy", size: 20))
                .padding(.leading)
            
            GeometryReader { geo in
                TabView (selection: $tabIndex) {
                    ForEach (0..<model.recipes.count) { index in
                        if model.recipes[index].featured {
                            Button(
                                action: {
                                    self.isDetailViewShowing = true
                                },
                                label : {
                                    ZStack {
                                        Rectangle()
                                            .foregroundColor(.white)
                                        VStack(spacing: 0) {
                                            Image(model.recipes[index].image)
                                                .resizable()
                                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                                .clipped()
                                            Text(model.recipes[index].name)
                                                .foregroundColor(.black)
                                                .padding(5)
                                        }
                                    }
                                }
                                
                            )
                            .tag(index)
                            .sheet(isPresented: $isDetailViewShowing) {
                                RecipeDetailView(recipe: model.recipes[index])
                            }
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(15)
                            .shadow(color: .black, radius: 10, x: -5, y: 5)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack (alignment: .leading){
                Text("Prep time")
                    .font(.headline)
                Text(model.recipes[tabIndex].prepTime)
                Text("Highlight")
                    .font(.headline)
                HStack {
                    ForEach (0..<model.recipes[tabIndex].highlights.count) { index in
                        Text(model.recipes[tabIndex].highlights[index])
                    }
                }
            }
            .padding(.leading)
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
