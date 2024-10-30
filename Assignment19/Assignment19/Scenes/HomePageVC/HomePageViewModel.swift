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
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        let urlString = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=1cfd272ed6f74e45ae3f4d37fed3b649"
        networkService.fetchData(ulrStirng: urlString) { [weak self] (result: Result<NewsModel, Error>) in
            switch result {
            case .success(let newsModel):
                self?.articles = newsModel.articles ?? []
                DispatchQueue.main.async {
                    self?.onDataUpdated?()
                }
            case .failure(let error):
                print("Error fetching news: \(error)")
            }
        }
    }
}



enum CustomErrors: Error {
    case wrongResponse
    case statusCode
}

final class NetworkService {
    
    func fetchData<T: Decodable>(ulrStirng: String, completion: @escaping (Result<T, Error>)->Void) {
        let url = URL(string: ulrStirng)
        let urlRequest = URLRequest(url: url!)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
            print(Thread.current.isMainThread, "✅")
            if let error {
                print(error)
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(CustomErrors.wrongResponse))
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                completion(.failure(CustomErrors.statusCode))
                return
            }
            
            guard let data else { return }
            
            do {
                let newsResponseData = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    print(Thread.current.isMainThread, "-----")
                    completion(.success(newsResponseData))
                }
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}

