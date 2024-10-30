//
//  HomePageViewModel.swift
//  Assignment19
//
//  Created by MacBook on 30.10.24.
//

import Foundation

final class HomePageViewModel {
    
    private let newsData = NewsData()
    private let networkService = NetworkService()
    
    private var news: [NewsData] = []
    
    var numberOfNews: Int {
        news.count
    }
    
    var newsChanged: (()->Void)?
    
    init() {
        fetchData()
    }
    
    func news(at index: Int) -> NewsData {
        news[index]
    }
    
    func fetchData() {
        networkService.fetchData(ulrStirng: "https://newsapi.org/v2/everything?q=bitcoin&apiKey=1cfd272ed6f74e45ae3f4d37fed3b649") { (response: Result<NewsData, Error>)in
            switch response {
            case .success(let success): break
                
            case .failure(let failure): break
                
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

