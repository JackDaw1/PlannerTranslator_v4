//
//  TaskDTOModel.swift
//  TableView_v5
//
//  Created by Galina Iaroshenko on 20.12.2022.
//

import Foundation

protocol ATProtocol: Codable {
    var idAT: String? { get set }
}
struct MoyResponse<T: ATProtocol>: Codable {
    let records: [SubMoyResponse<T>]
    
    enum MoyResponseKeys: CodingKey {
        case records
    }
}

struct SubMoyResponse<T: ATProtocol>: Codable {
    let id: String
    let createdTime: String
    var fields: T
    enum SubMoyResponseKeys: CodingKey {
        case id,createdTime,fields
    }
    
    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<SubMoyResponse<T>.CodingKeys> = try decoder.container(keyedBy: SubMoyResponse<T>.CodingKeys.self)
        self.id = try container.decode(String.self, forKey: SubMoyResponse<T>.CodingKeys.id)
        self.createdTime = try container.decode(String.self, forKey: SubMoyResponse<T>.CodingKeys.createdTime)
        self.fields = try container.decode(T.self, forKey: SubMoyResponse<T>.CodingKeys.fields)
        self.fields.idAT = self.id
    }
}

struct MoyRequest<T: Codable>: Codable {
    let records: [SubMoyRequest<T>]
    
    enum MoyRequestKeys: CodingKey {
        case records
    }
}

struct SubMoyRequest<T: Codable>: Codable {
    let id: String?
    let fields: T
    enum SubMoyRequestKeys: CodingKey {
        case id,createdTime,fields
    }
    
    func toJSON() -> Dictionary<String, Any> {
        do {
            let jsonData = try JSONEncoder().encode(self)
            let jsonString = String(data: jsonData, encoding: .utf8)!
            
            if let data = jsonString.data(using: .utf8) {
                    do {
                        return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] ?? Dictionary<String, Any>()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
                return Dictionary<String, Any>()
        } catch { print(error) }
        return Dictionary<String, Any>()
    }
}

extension Encodable {

    /// Encode into JSON and return `Data`
    func jsonData() throws -> Data {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        encoder.dateEncodingStrategy = .iso8601
        return try encoder.encode(self)
    }
}

class OrdersModel {
    
    static func getDetailOfTask(
        id: String,
        completionHandler: @escaping (OrderItem) -> Void,
        errorHandler: @escaping (WDNetworkError) -> Void) {
        MoyaNetworkManager.shared.mainRequest(RequestType.ordersDetail(id)) { responseAPI in
            parseData(responseAPI: responseAPI,
                      type: SubMoyResponse<OrderItem>.self,
                      completion: { response in
                switch response {
                case .success(let result):
                    completionHandler(result.fields)
                case .failure(let error):
                    errorHandler(error)
                }
            })
        }
    }
    
    static func create(_ order: OrderItem,
        completionHandler: @escaping (OrderItem?) -> Void,
        errorHandler: @escaping ( WDNetworkError) -> Void) {
            
        MoyaNetworkManager.shared.mainRequest(RequestType.create(order)) { responseAPI in
            parseData(responseAPI: responseAPI,
                      type: MoyResponse<OrderItem>.self,
                      completion: { response in
                switch response {
                case .success(let result):
                    completionHandler(result.records.compactMap({ $0.fields }).first)
                case .failure(let error):
                    errorHandler(error)
                }
            })
        }
    }
    
    static func edit(_ order: OrderItem,
        completionHandler: @escaping (OrderItem?) -> Void,
        errorHandler: @escaping ( WDNetworkError) -> Void) {
            
        MoyaNetworkManager.shared.mainRequest(RequestType.edit(order)) { responseAPI in
            parseData(responseAPI: responseAPI,
                      type: MoyResponse<OrderItem>.self,
                      completion: { response in
                switch response {
                case .success(let result):
                    completionHandler(result.records.compactMap({ $0.fields }).first)
                case .failure(let error):
                    errorHandler(error)
                }
            })
        }
    }
    
    static func loadTasks(
        completionHandler: @escaping ([OrderItem]) -> Void,
        errorHandler: @escaping ( WDNetworkError) -> Void) {
            
        MoyaNetworkManager.shared.mainRequest(RequestType.orders) { responseAPI in
            parseData(responseAPI: responseAPI,
                      type: MoyResponse<OrderItem>.self,
                      completion: { response in
                switch response {
                case .success(let result):
                    completionHandler(result.records.compactMap({ $0.fields }))
                case .failure(let error):
                    errorHandler(error)
                }
            })
        }
    }
}
