//
//  SearchView.swift
//  Currency App
//
//  Created by MYKHAILO NAUMOV on 2/20/26.
//

import SwiftUI

struct SearchView: View {
    
    @State var countryName = ""
    @Binding var selectedCountryCode: String
    
    // Filters the country
    var filteredCountries: [(key: String, value: String)] {
        
        // return all countries sorted alphabetically by name
        if countryName.isEmpty {
            return countriesDict.sorted { $0.value < $1.value }
        }
        else {
            return countriesDict
            
            // This filter checks each country name
                .filter { $0.value.lowercased().contains(countryName.lowercased()) }
            
            // After filtering, sort the results alphabetically
                .sorted { $0.value < $1.value }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                TextField("Enter country name", text: $countryName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                List(filteredCountries, id: \.key) { country in
                    Button(country.value) {
                        selectedCountryCode = country.key
                        countryName = country.value
                    }
                }
                
            }
            .navigationTitle("Search Country")
        }
    }
}
