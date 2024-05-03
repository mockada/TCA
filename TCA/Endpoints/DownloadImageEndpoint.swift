//
//  DownloadImageEndpoint.swift
//  TCA
//
//  Created by Jade Silveira on 03/05/24.
//

import Foundation
import NatworkSPM

struct DownloadImageEndpoint: EndpointProtocol {
    var cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy
    
    let host: String = "https://api.themoviedb.org"
    let method: NatworkSPM.EndpointMethod = .get
    
    var path: String { "/t/p/w500/\(pathSufix)" }
    var pathSufix: String
}
