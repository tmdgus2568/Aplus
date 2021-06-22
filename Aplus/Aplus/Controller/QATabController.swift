//
//  QATabController.swift
//  Aplus
//
//  Created by hsh on 2021/06/23.
//

import UIKit

class QATabController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableQuestion: UITableView!
    @IBOutlet weak var btnWrite: UIButton!
    var cellTitle:Array<String> = ["4번문제 모르겠어요","5번문제좀 알려주세요"]
    var cellComments:Array<String> = ["5","3"]
    var cellViews:Array<String> = ["5","3"]
    var cellWriter:Array<String> = ["김소현","홍승현"]
    
    override func viewDidLoad() {
        tableQuestion.delegate = self
        tableQuestion.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.cellTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableQuestion.dequeueReusableCell(withIdentifier: "customQuestionListCell") as! CustomQuestionListCell
        cell.lbTitle.text = cellTitle[indexPath.row]
        cell.lbComments.text = cellComments[indexPath.row]
        cell.lbViews.text = cellViews[indexPath.row]
        cell.lbWriter.text = cellWriter[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
  
}
