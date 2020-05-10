//
//  Customcell.swift
//  Chinkal_demo
//
//  Created by chinkalshah on 15/04/20.
//  Copyright © 2020 chinkalshah. All rights reserved.
//

import UIKit

class Customcell: UITableViewCell {
    
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserDesignation: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblUrl: UILabel!
    @IBOutlet weak var lblLike: UILabel!
    @IBOutlet weak var lblComment: UILabel!
    @IBOutlet weak var imgUserBG: UIImageView!
    @IBOutlet weak var imgArticalBG: UIImageView!
    
    @IBOutlet weak var heightImageArtical: NSLayoutConstraint!
    @IBOutlet weak var heightlblTitle: NSLayoutConstraint!
    @IBOutlet weak var heightlblUrl: NSLayoutConstraint!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.initUI()
        // Initialization code
    }
    
    func initUI()  {
        self.imgUserBG?.layer.cornerRadius = (self.imgUserBG?.frame.size.width ?? 0.0) / 2
        self.imgUserBG?.clipsToBounds = true
        self.imgUserBG?.layer.borderWidth = 3.0
        self.imgUserBG?.layer.borderColor = UIColor.white.cgColor
    }

    func configureCell(viewModel : ViewModel)  {
        self.lblUserName.text = viewModel.userName
        self.lblUserDesignation.text = viewModel.userDesignation
        self.lblContent.text = viewModel.blogContent
        self.lblTitle.text = viewModel.blogTitle
        self.lblUrl.text = viewModel.blogUrl
        self.lblTime.text = viewModel.getTimeDiff(from: viewModel.timeAgo)
        if(viewModel.mediaContent.count == 0){
            self.heightImageArtical.constant = 0
            self.heightlblTitle.constant = 0
            self.heightlblUrl.constant = 0
        }else{
            self.heightImageArtical.constant = 128
            self.heightlblTitle.constant = 21
            self.heightlblUrl.constant = 21
        }
            
        self.lblLike.text = String(format: "%@%@%@", viewModel.blogLike.formatUsingAbbrevation()," ","Likes")
        self.lblComment.text = String(format: "%@s%@%@", viewModel.blogComments.formatUsingAbbrevation()," ","Comments")
        if(!viewModel.imageUser.isEmpty){
            self.setImageBgUser(ImageURL: viewModel.imageUser)
        }else{
            self.imgUserBG?.image = nil
        }
        
        if(!viewModel.imageBlogUrl.isEmpty){
            self.setImageBgArtical(ImageURL: viewModel.imageBlogUrl)
        }else{
            self.imgArticalBG?.image = nil
        }
    }
    
    func setImageBgUser(ImageURL :String) {
       URLSession.shared.dataTask( with: NSURL(string:ImageURL)! as URL, completionHandler: {
          (data, response, error) -> Void in
          DispatchQueue.main.async {
             if let data = data {
                self.imgUserBG?.image = UIImage(data: data)
             }
          }
       }).resume()
    }
    
    func setImageBgArtical(ImageURL :String) {
       URLSession.shared.dataTask( with: NSURL(string:ImageURL)! as URL, completionHandler: {
          (data, response, error) -> Void in
          DispatchQueue.main.async {
             if let data = data {
                self.imgArticalBG?.image = UIImage(data: data)
             }
          }
       }).resume()
    }
}
