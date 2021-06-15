//
//  CustomQuizListCell.swift
//  Aplus
//
//  Created by hsh on 2021/06/11.
//

import UIKit

class CustomQuizListCell:UITableViewCell{
    @IBOutlet weak var lbQuizRegDate: UILabel!
    @IBOutlet weak var lbQuizTitle: UILabel!
    @IBOutlet weak var lbQuizDeadline: UILabel!
    @IBOutlet weak var viewQuizStatus: UIView!
    
    @IBOutlet weak var lbQuizNumOfPeople: UILabel!
    override class func awakeFromNib() {
        
    }
}
