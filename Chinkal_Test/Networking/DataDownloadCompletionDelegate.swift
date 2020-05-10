//
//  DataDownloadCompletionDelegate.swift
//  ChinkalDemo
//
//  Created by chinkalshah on 03/08/19.
//  Copyright © 2019 chinkalshah. All rights reserved.
//


import UIKit

protocol DataDownloadCompletionDelegate {
    func dataDownloadCompleted(error:Error? , data:Data)
}
