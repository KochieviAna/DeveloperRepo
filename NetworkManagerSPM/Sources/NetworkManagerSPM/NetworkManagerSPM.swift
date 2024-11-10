// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public enum CustomErrors: Error {
    case wrongResponse
    case statusCode
}

public final class NetworkManagerSPM{
    
    public func fetchData<T: Decodable>(urlString: String, completion: @Sendable @escaping (Result<T, Error>) -> Void) {
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
                completion(.success(newsResponseData))
            } catch {
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }.resume()
    }
}
