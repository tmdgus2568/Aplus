//
//  QAController.swift
//  Aplus
//
//  Created by hsh on 2021/06/30.
//

import UIKit

class QAController:UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var lbWriter: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var lbViews: UILabel!
    @IBOutlet weak var lbComments: UILabel!
    @IBOutlet weak var textContents: UITextView!
    @IBOutlet weak var tableComment: UITableView!
    
    var commentWriter:Array<String> = ["김소현","홍승현"]
    var commentContents:Array<String> = ["dkfdfd","sdfs"]
    var commentDate:Array<String> = ["2021.03.24 11:11:11","2021.03.25 11:11:11"]
    
    
    override func viewDidLoad() {
        tableComment.dataSource = self
        tableComment.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        commentWriter.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableComment.dequeueReusableCell(withIdentifier: "customCommentListCell") as! CustomCommentListCell
        
        cell.lbWriter.text = commentWriter[indexPath.row]
        cell.lbDate.text = commentDate[indexPath.row]
        cell.textContents.text = commentContents[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
