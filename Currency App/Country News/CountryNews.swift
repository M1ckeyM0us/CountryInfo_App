//
//  CountryNews.swift
//  Currency App
//
//  Created by MYKHAILO NAUMOV on 3/2/26.
//

import SwiftUI

struct CountryNews: View {
    
    var countryCode: String
    @State var articles: [NSDictionary] = []
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                Button("Load News") {
                    loadNews()
                }
                .padding()
                .background(Color.blue.opacity(0.9))
                .foregroundColor(.white)
                .cornerRadius(10)
                
                List(articles, id: \.self) { article in
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text(getTitle(article))
                            .font(.headline)
                        
                        Text(getSource(article))
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Text(getDescription(article))
                            .font(.body)
                            .lineLimit(3)
                    }
                    .padding(.vertical, 5)
                }
            }
            .navigationTitle("Country News")
        }
    }
    
    func loadNews() {
        NewsService().loadNews(countryCode: countryCode)
        
        // Check repeatedly until data loads
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.articles = NewsService.newsArticles
        }
    }
    
    func getTitle(_ article: NSDictionary) -> String {
        return article["title"] as? String ?? "No Title"
    }
    
    func getDescription(_ article: NSDictionary) -> String {
        return article["description"] as? String ?? "No Description"
    }
    
    func getSource(_ article: NSDictionary) -> String {
        if let source = article["source"] as? NSDictionary {
            return source["name"] as? String ?? "Unknown Source"
        }
        return "Unknown Source"
    }
}
