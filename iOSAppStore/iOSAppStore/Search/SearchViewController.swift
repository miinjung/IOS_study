//
//  SearchViewController.swift
//  iOSAppStore
//
//  Created by Jercy on 2020/07/14.
//  Copyright © 2020 Jercy. All rights reserved.
//

import UIKit
import Alamofire

class SearchViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var appstoreItems : AppstoreItems?
    
    @IBAction func textFieldChangedAction(_ sender: UITextField) {
        let term = sender.text!
        let url = "https://itunes.apple.com/search?term=\(term)&entity=software&country=kr"
        let encodingURL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        AF.request(encodingURL).response{ result in
            let decoder = JSONDecoder()
            let response = try? decoder.decode(AppstoreItemResponse.self, from: result.data!)
            self.appstoreItems = response?.results
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SearchViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appstoreItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchItemTableViewCell", for: indexPath) as! SearchItemTableViewCell
        cell.setData(data: appstoreItems![indexPath.row])
        return cell
    }
    
    
}
