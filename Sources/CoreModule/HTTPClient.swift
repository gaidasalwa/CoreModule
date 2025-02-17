
import Foundation
import Alamofire

public protocol HTTPClientProtocol {
    // Compatible avec iOS 12 (Completion Handler)
    func sendRequest<T: Decodable>(
        to url: URLRequest,
        completion: @escaping (Result<T, Error>) -> Void
    )
    
    // Compatible avec iOS 13+ (Async/Await)
    @available(iOS 13.0, *)
    func sendRequest<T: Decodable>(to url: URLRequest) async throws -> T
}

public class HTTPClient: HTTPClientProtocol {
    public init() {}
    
    // iOS 12 - Completion Handler
    public func sendRequest<T: Decodable>(
        to url: URLRequest,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        
        AF.request(url)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let decodedObject = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(decodedObject)) // Retourne le succès
                    } catch {
                        completion(.failure(error)) // Gère l'erreur de parsing
                    }
                case .failure(let error):
                    completion(.failure(error)) // Gère l'erreur réseau
                }
            }
    }
    
    // iOS 13+ - Async/Await
    @available(iOS 13.0, *)
    public func sendRequest<T: Decodable>(to url: URLRequest) async throws -> T {
        
        let request = AF.request(url)
        return try await withUnsafeThrowingContinuation { continuation in
            request.responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let decodedObject = try JSONDecoder().decode(T.self, from: data)
                        continuation.resume(returning: decodedObject) // Résolution avec T
                    } catch {
                        continuation.resume(throwing: error) // Gère l'erreur de parsing
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
