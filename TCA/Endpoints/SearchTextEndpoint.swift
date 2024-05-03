//
//  SearchTextEndpoint.swift
//  TCA
//
//  Created by Jade Silveira on 03/05/24.
//

import Foundation
import NatworkSPM

struct SearchTextEndpoint: EndpointProtocol {
    var cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy
    var decodingStrategy: JSONDecoder.KeyDecodingStrategy = .convertFromSnakeCase
    
    let host: String = "https://api.themoviedb.org"
    let method: NatworkSPM.EndpointMethod = .get
    
    let apiVersion: String = "3"
    var path: String { "/\(apiVersion)/search/movie" }
    
    let apiKey = "5725d89a6357e321ddfa9db44c0dfc27"
    let locale = NSLocalizedString("locale", comment: "")
    var text: String
    var page: String
    var params: [String : Any] { ["api_key": apiKey,
                                  "language": locale,
                                  "query": text,
                                  "page": page] }
}
