//
//  NetworkManager.swift
//  Appetito
//
//  Created by Diego Ferreira on 13/09/22.
//

import Foundation

struct NetworkManager {
    
    var cep: String
    let urlSession: URLSession
    
    init(cep: String, urlSession: URLSession = .shared) {
        self.cep = cep
        self.urlSession = urlSession
    }
    
    var basePath: String {
        return "viacep.com.br/ws/\(cep)/json/"
    }
    
    func loadRequest(onComplete: @escaping (Result<CEPModel?, Error>) -> Void) {
        
        guard let url = URL(string: basePath) else { return }
        
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
