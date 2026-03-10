//
//  FavoriteView.swift
//  Currency App
//
//  Created by MYKHAILO NAUMOV on 3/10/26.
//

import SwiftUI

struct FavoriteView: View {
    
    @Binding var favorites: [String]
    
    var body: some View {
        NavigationView{
            List(favorites, id: \.self){ code in
                HStack{
                    Text(countriesDict[code] ?? code)
                    Spacer()
                }
                
            }
            .navigationTitle(Text("Favorites"))
            
        }
    }
}

