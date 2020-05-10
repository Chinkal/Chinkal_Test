//
//  Blog.swift
//  Chinkal_Test
//
//  Created by chinkalshah on 08/05/20.
//  Copyright © 2020 chinkalshah. All rights reserved.
//

import UIKit

class Blog: Decodable {
    let createdAt:String?
    let content:String?
    let comments:Double?
    let likes:Double?
    let media:[Media]
    let user:[User]
}

