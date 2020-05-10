//
//  ViewModel.swift
//  Chinkal_Test
//
//  Created by chinkalshah on 08/05/20.
//  Copyright © 2020 chinkalshah. All rights reserved.
//

import UIKit

struct ViewModel {

    var userName: String
    var userDesignation: String
    var blogContent: String
    var blogTitle: String
    var blogUrl: String
    var blogLike: Double
    var blogComments: Double
    var imageBlogUrl: String
    var imageUser: String
    var timeAgo: String
    var mediaContent: [Media]

    init(_ blog: Blog) {
        userName = blog.user[0].name!
        userDesignation = blog.user[0].designation!
        blogContent = blog.content!
        mediaContent = blog.media
        blogTitle = blog.media.count != 0 ? blog.media[0].title! : ""
        blogUrl = blog.media.count != 0 ? blog.media[0].url! : ""
        imageBlogUrl = blog.media.count != 0 ? blog.media[0].image! : ""
        imageUser = blog.user.count != 0 ? blog.user[0].avatar! : ""
        blogLike = blog.likes!
        blogComments = blog.comments!
        timeAgo = blog.createdAt!
    }
    
    public func getTimeDiff(from : String) -> String {
        let dateConverted = ViewModel.convertStringToDate(dateString: from)
        return ViewModel.configureDateDiff(from: dateConverted , to: Date())
    }
    
    private static func configureDateDiff(from: Date, to : Date) -> String {
        let diff = from.CalculateTimeDiff(current: from, recent: to)
        return diff
    }
    
    private static func convertStringToDate(dateString:String) -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from:dateString)!
        return date
    }

}

