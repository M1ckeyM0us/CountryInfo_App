//
//  ContentView.swift
//  Currency App
//
//  Created by MYKHAILO NAUMOV on 2/18/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedCountryCode = "US"
    
    var body: some View {
        TabView {
            
            SearchView(selectedCountryCode: $selectedCountryCode)
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            CountryDetailView(countryCode: selectedCountryCode)
                .tabItem {
                    Label("Details", systemImage: "doc.text")
                }
            
            CountryNews(countryCode: selectedCountryCode)
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
            
        }
    }
}
