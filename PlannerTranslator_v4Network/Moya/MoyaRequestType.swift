//
//  MoyaRequestType.swift
//  TableView_v5
//
//  Created by Galina Iaroshenko on 20.12.2022.
//

import Foundation
import Moya

public typealias RequestParametersType = (apiStringURL: String, body: [String: Any]?)

enum RequestType {
    case orders
    case ordersDetail(String)
    case create(OrderItem)
    case edit(OrderItem)
}

protocol WDTargetType: TargetType, Hashable {
    
}


extension RequestType: WDTargetType {
    static func == (lhs: RequestType, rhs: RequestType) -> Bool {
        lhs.path == rhs.path
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(path)
        hasher.combine(method)
    }
    
    var baseURL: URL {
        //https://api.airtable.com/v0/appPMjoCgIPwBqrPL/PlannerTranslator?maxRecords=3&view=Order
        URL(string: "https://api.airtable.com/v0/appPMjoCgIPwBqrPL/")!
    }
    
    var path: String {
        switch self {
        case .orders:
            return "PlannerTranslator"
        case .ordersDetail:
            return "PlannerTranslator"
        case .create:
            return "PlannerTranslator"
        case .edit:
            return "PlannerTranslator"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .orders, .ordersDetail:
            return Moya.Method.get
        case .create:
            return Moya.Method.post
        case .edit:
            return Moya.Method.patch
        }
    }
    
    var task: Task {
        switch self {
        case .orders:
            return .requestParameters(
                parameters: ["maxRecords":20,
                             "view":"Order"],
                encoding: URLEncoding.default)
        case .ordersDetail(let id):
            return .requestCompositeParameters(
                bodyParameters: ["id" : id],
                bodyEncoding: JSONEncoding.default,
                urlParameters: [:])
        case .create(let order):
            do {
                let dict = try MoyRequest(records:
                                            [
                                                SubMoyRequest<OrderItem>.init(
                                                    id: nil,
                                                    fields: order)
                                            ]).jsonData()
                return .requestCompositeData(bodyData: dict,
                                             urlParameters: [:])
            } catch {
                return Task.requestPlain
            }
        case .edit(let order):
            do {
                let dict = try MoyRequest(records:
                                            [
                                                SubMoyRequest<OrderItem>.init(
                                                    id: order.idAT,
                                                    fields: order)
                                            ]).jsonData()
                return .requestCompositeData(bodyData: dict,
                                             urlParameters: [:])
            } catch {
                return Task.requestPlain
            }
        }
    }
    
    var headers: [String : String]? {
        var headersDictionary = MoyaNetworkManager.shared.headers
//        switch self {
//        default:
//            headersDictionary["content-type"] = "application/json-patch+json"
//            break
//        }
        return  headersDictionary
    }
}

