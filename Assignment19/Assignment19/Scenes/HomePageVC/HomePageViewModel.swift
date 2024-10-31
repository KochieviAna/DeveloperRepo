//
//  HomePageViewModel.swift
//  Assignment19
//
//  Created by MacBook on 30.10.24.
//

import Foundation

final class HomePageViewModel {
    var articles: [Article] = []
    private let networkService = NetworkService()
    
    var onDataUpdated: (() -> Void)?
    
    private var currentPage: Int = 1
    private let articlesPerPage: Int = 10
    var isFetching: Bool = false
    var hasMoreData: Bool = true
    
    init() {
        fetchData(page: currentPage)
    }
    
    func fetchData(page: Int) {
        guard !isFetching && hasMoreData else { return }
        
        isFetching = true
        
        let urlString = "https://newsapi.org/v2/everything?q=bitcoin&page=\(page)&pageSize=\(articlesPerPage)&apiKey=1cfd272ed6f74e45ae3f4d37fed3b649"
        
        networkService.fetchData(urlString: urlString) { [weak self] (result: Result<NewsModel, Error>) in
            switch result {
            case .success(let newsModel):
                if let newArticles = newsModel.articles {
                    self?.articles.append(contentsOf: newArticles)
                    self?.hasMoreData = newArticles.count == self?.articlesPerPage
                }
                DispatchQueue.main.async {
                    self?.onDataUpdated?()
                }
            case .failure(let error):
                print("Error fetching news: \(error)")
            }
            self?.isFetching = false
        }
    }
    
    func loadMoreData() {
        currentPage += 1
        fetchData(page: currentPage)
    }
}

enum CustomErrors: Error {
    case wrongResponse
    case statusCode
}

final class NetworkService {
    
    func fetchData<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(CustomErrors.wrongResponse))
            
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print(error)
                completion(.failure(error))
                
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(CustomErrors.wrongResponse))
                
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                completion(.failure(CustomErrors.statusCode))
                
                return
            }
            
            guard let data = data else {
                completion(.failure(CustomErrors.wrongResponse))
                
                return
            }
            
            do {
                let newsResponseData = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(newsResponseData))
                }
            } catch {
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }.resume()
    }
}
