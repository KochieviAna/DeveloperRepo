//
//  HomePageViewModel.swift
//  Assignment19
//
//  Created by MacBook on 30.10.24.
//

import Foundation

final class HomePageViewModel {
    private let networkService = NetworkService()
    
    private var news: [NewsData] = []
    
    var numberOfNews: Int {
        news.count
    }
    
    
}


enum CustomErrors: Error {
    case wrongResponse
    case statusCode
}

final class NetworkService {
    
    func fetchData<T: Decodable>(ulrStirng: String, completion: @escaping ((T?, Error?)-> Void)) {
        let url = URL(string: ulrStirng)
        let urlRequest = URLRequest(url: url!)
        
        URLSession.shared.dataTask(with: urlRequest) {  [weak self] data, response, error in
            
            print(Thread.current.isMainThread, "✅")
            if let error {
                print(error)
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(nil, CustomErrors.wrongResponse)
                return
            }
            
            guard (200...299).contains(response.statusCode) else {
                completion(nil, CustomErrors.statusCode)
                return
            }
            
            guard let data else { return }
            
            do {
                let newsResponseData = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    print(Thread.current.isMainThread, "-----")
                    completion(newsResponseData, nil)
                }
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}

