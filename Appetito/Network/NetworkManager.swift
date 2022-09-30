//
//  NetworkManager.swift
//  Appetito
//
//  Created by Diego Ferreira on 13/09/22.
//

import Foundation

struct NetworkManager {
    
    let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func loadRequest(cep: String, onComplete: @escaping (Result<CEPModel?, Error>) -> Void) {
        
        guard let url = URL(string: "https://viacep.com.br/ws/\(cep)/json/") else { return }
        
        urlSession.dataTask(with: url) { data, response, error in
            
            if error == nil {
                guard let response = response as? HTTPURLResponse else { return }
                
                guard let data = data else {
                    onComplete(.failure(NSError()))
                    
                    return
                }
                
                if response.statusCode == 200 {
                    do {
                        let parsedData = try JSONDecoder().decode(CEPModel.self, from: data)
                        
                        onComplete(.success(parsedData))
                    } catch {
                        onComplete(.success(nil))
                    }
                }
            } else {
                onComplete(.failure(error!))
            }
        }.resume()
    }
}
