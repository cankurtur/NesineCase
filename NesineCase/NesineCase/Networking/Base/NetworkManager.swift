//
//  NetworkManager.swift
//  NesineCase
//
//  Created by Can Kurtur on 13.05.2023.
//

import Foundation

final class NetworkManager<EndpointItem: Endpoint>: NetworkManagerProtocol {
    
    private let sesion: URLSession
    private let timeoutInterval: TimeInterval
    private lazy var decoder: JSONDecoder = {
        return .init()
    }()
    
    private var successStatusCodes: ClosedRange<Int> {
        return 200...209
    }
    
    init(sesion: URLSession = .shared, timeoutInterval: TimeInterval = 10) {
        self.sesion = sesion
        self.timeoutInterval = timeoutInterval
    }
    
    func request<T>(endpoint: EndpointItem, responseType: T.Type, networkCompletion: @escaping NetworkHandler<T>) where T : Decodable {
        guard let request = RequestBuilder.makeRequest(for: endpoint, timeoutInterval: timeoutInterval) else {
            networkCompletion(.failure(.badRequest))
            return
        }
        
        let task = sesion.dataTask(with: request) { [weak self] data, response, error in
            guard let self else { return }
            
            guard let statusCode = response?.code else {
                networkCompletion(.failure(.invalidStatusCode))
                return
            }
            
            if let httpRespose = response as? HTTPURLResponse,
               self.successStatusCodes.contains(httpRespose.statusCode) {
                
                guard let data = data, !data.isEmpty else {
                    networkCompletion(.success(EmptyResponse() as! T))
                    return
                }
                do {
                    let decodedObject = try self.decoder.decode(responseType, from: data)
                    networkCompletion(.success(decodedObject))
                } catch {
                    let decodingError = APIClientError.decoding(error: error as? DecodingError)
                    networkCompletion(.failure(decodingError))
                }
            } else {
                if let error = error as NSError?, error.code == NSURLErrorTimedOut {
                    networkCompletion(.failure(.timeout))
                } else {
                    do {
                        guard let data = data else {
                            networkCompletion(.failure(.networkError))
                            return
                        }
                        let clientError = try self.decoder.decode(ClientError.self, from: data)
                        clientError.statusCode = statusCode
                        networkCompletion(.failure(.handledError(error: clientError)))
                    } catch {
                        let decodingError = APIClientError.decoding(error: error as? DecodingError)
                        networkCompletion(.failure(decodingError))
                    }
                }
            }
        }
        task.resume()
    }
}
