//
//  HomePageViewModel.swift
//  Assignment19
//
//  Created by MacBook on 30.10.24.
//

import Foundation
import NetworkManager

final class HomePageViewModel {
    private var articles: [Article] = []
    private let networkManager = NetworkManager()
    
    var onDataUpdated: (() -> Void)?
    
    private var currentPage: Int = 1
    private let articlesPerPage: Int = 10
    var isFetching: Bool = false
    var hasMoreData: Bool = true
    
    init() {
        fetchData(page: currentPage)
    }
    
    var allArticles: [Article] {
        return articles
    }
    
    var numberOfArticles: Int {
        articles.count
    }
    
    func article(at index: Int) -> Article {
        articles[index]
    }
    
    func fetchData(page: Int) {
        guard !isFetching && hasMoreData else { return }
        
        isFetching = true
        
        let urlString = "https://newsapi.org/v2/everything?q=bitcoin&page=\(page)&pageSize=\(articlesPerPage)&apiKey=1cfd272ed6f74e45ae3f4d37fed3b649"
        
        networkManager.fetchData(urlString: urlString) { [weak self] (result: Result<NewsModel, Error>) in
            guard let self = self else { return }
            
            switch result {
            case .success(let newsModel):
                if let newArticles = newsModel.articles {
                    self.articles.append(contentsOf: newArticles)
                    self.hasMoreData = newArticles.count == self.articlesPerPage
                }
                DispatchQueue.main.async {
                    self.onDataUpdated?()
                    self.isFetching = false
                }
            case .failure(let error):
                print("Error fetching news: \(error)")
                DispatchQueue.main.async {
                    self.isFetching = false
                }
            }
        }
    }
    
    func loadMoreData() {
        currentPage += 1
        fetchData(page: currentPage)
    }
}
