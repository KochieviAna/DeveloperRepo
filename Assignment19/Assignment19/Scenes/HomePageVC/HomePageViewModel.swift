//
//  HomePageViewModel.swift
//  Assignment19
//
//  Created by MacBook on 30.10.24.
//

import Foundation

final class HomePageViewModel {
    
    var newsData: NewsModel?
    
    func fetchDataFrom() {
        let urlString = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=1cfd272ed6f74e45ae3f4d37fed3b649"
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error {
                print(error)
            }
            
            guard let data else {
                return
            }
            
            do {
                let newsData = try JSONDecoder().decode(NewsModel.self, from: data)
                DispatchQueue.main.async {
                    self.newsData = newsData
                }
            } catch {
                print(error)
            }
        }.resume()
        
    }
}
