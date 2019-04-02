//
//  ViewController.swift
//  DyanmicTExtViewHeight
//
//  Created by mac on 4/2/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "GrowingCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "GrowingCell")
        self.tableView.tableFooterView = UIView()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }


}
extension ViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GrowingCell", for: indexPath) as! GrowingCell
      cell.cellDelegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension ViewController:GrowingCellProtocol{
    func updateHeightOfRow(_ cell: GrowingCell, _ textview: UITextView) {
        let size = textview.bounds.size
        let newSize = tableView.sizeThatFits(CGSize(width: size.width, height: CGFloat.greatestFiniteMagnitude))
        if size.height != newSize.height{
            UIView.setAnimationsEnabled(false)
            tableView.beginUpdates()
            tableView.endUpdates()
            UIView.setAnimationsEnabled(true)
            if let thisindexPath = tableView.indexPath(for: cell){
                tableView.scrollToRow(at: thisindexPath, at: .bottom, animated: false)
            }
        }
    }
    
    
}

