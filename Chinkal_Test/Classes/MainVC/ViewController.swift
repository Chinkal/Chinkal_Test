//
//  ViewController.swift
//  Chinkal_Test
//
//  Created by chinkalshah on 08/05/20.
//  Copyright © 2020 chinkalshah. All rights reserved.
//

import UIKit

class ViewController: UIViewController , DataDownloadCompletionDelegate{
 
    @IBOutlet weak var tblList: UITableView!
    @IBOutlet weak var lblPage: UILabel!

    var pageNumber: Int!
    var arrayofBlogs = [Blog]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Articles"
        pageNumber = 1;
        self.parseAPI()
        self.lblPage.text = String(self.pageNumber)

        self.tblList.estimatedRowHeight = 300
        self.tblList.rowHeight = UITableView.automaticDimension
        // Do any additional setup after loading the view.
    }

    //Custom functions
    func parseAPI() {
        Apihandler.shared.downloadArticlesData(Apihandler.requestType.getArticlesData.rawValue, httpmethod: "GET", page: pageNumber, Delegate: self)
    }
    
    
    //MARK: - Network Delegate
    func dataDownloadCompleted(error: Error?, data: Data) {
        guard error == nil else {
            print(error!)
            return
        }
        
        do {
           let response = try JSONDecoder().decode([Blog].self, from: data)
           self.arrayofBlogs.append(contentsOf: response)
        } catch let error {
           print(error)
        }
        
        DispatchQueue.main.async {
            self.tblList.reloadData()
        }
    }
    
}

extension ViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayofBlogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Customcell", for: indexPath) as? Customcell
        cell?.selectionStyle = .none
        let blog = self.arrayofBlogs[indexPath.row]
        let viewModel = ViewModel(blog)
        cell?.configureCell(viewModel: viewModel)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if(self.pageNumber <= 5){
             let count = self.arrayofBlogs.count
             if count > 1{
                 let lastElement = count - 1
                 if indexPath.row == lastElement {
                     self.pageNumber = self.pageNumber + 1
                     self.parseAPI()
                 }
            }
        }
        self.lblPage.text = String(Int(indexPath.row / 10) + 1)
    }
}

extension ViewController : UITableViewDelegate{
    
    
}



