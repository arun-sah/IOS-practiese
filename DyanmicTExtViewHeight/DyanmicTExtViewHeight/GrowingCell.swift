//
//  GrowingCell.swift
//  DyanmicTExtViewHeight
//
//  Created by mac on 4/2/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

protocol GrowingCellProtocol {
    func updateHeightOfRow(_ cell: GrowingCell, _ textview: UITextView)
}

class GrowingCell: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
     var cellDelegate : GrowingCellProtocol?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textView.delegate  = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension GrowingCell:UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView){
        if let delegate = cellDelegate{
                        delegate.updateHeightOfRow(self, textView)
                    }
    }
    
//    func textviewDidChange(_ textview: UITextView) {
//        if let delegate = cellDelegate{
//            delegate.updateHeightOfRow(self, textView)
//        }
//    }
    
}
