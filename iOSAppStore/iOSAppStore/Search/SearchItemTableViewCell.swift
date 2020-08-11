//
//  SearchItemTableViewCell.swift
//  iOSAppStore
//
//  Created by choiminjung on 2020/08/10.
//  Copyright © 2020 Jercy. All rights reserved.
//

import UIKit
import Kingfisher

class SearchItemTableViewCell: UITableViewCell {
    @IBOutlet weak var itemThumbnail: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    
    func setData(data: AppstoreItem){
        artistName.text = data.artistName
        itemName.text = data.trackName
        let url = URL(string: data.artworkUrl512)
        itemThumbnail.kf.setImage(with: url)
    }
}
