//
//  Apihandler.swift
//  Chinkal_demo
//
//  Created by chinkalshah on 15/04/20.
//  Copyright © 2020 chinkalshah. All rights reserved.
//

import UIKit

class Apihandler {
    
    static let shared = Apihandler()
    
    enum requestType: UInt {
        case getArticlesData
    }
    
    // MARK: - downloadWeather Api
    func downloadArticlesData(_ requestType : UInt , httpmethod : String , page : Int , Delegate : DataDownloadCompletionDelegate)  {
        let stringToAppend = API.BaseURL + String(format: "page=%d&limit=%@", page,"10")
        URLSession.shared.dataTask(with: URL(string: stringToAppend)!) { (data, response, error) -> Void in
            Delegate.dataDownloadCompleted(error: error, data: data!)
        }.resume()
    }

}
