//
//  SearchTableViewCell.swift
//  SearchSample
//
//  Created by Makoto on 2021/05/18.
//

import UIKit

final class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
