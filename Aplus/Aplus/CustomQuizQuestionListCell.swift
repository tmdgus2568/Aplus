//
//  CustomQuizQuestionListCell.swift
//  Aplus
//
//  Created by hsh on 2021/06/17.
//

import UIKit

class CustomQuizQuestionList:UITableViewCell{
    @IBOutlet weak var imgGrading: UIImageView!
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var imgAddImage: UIImageView!
 
    @IBOutlet weak var viewSelectOption: UIView!
    
    @IBOutlet weak var view1Option: UIView!
    @IBOutlet weak var view2Option: UIView!
    @IBOutlet weak var view3Option: UIView!
    @IBOutlet weak var view4Option: UIView!
    
    @IBOutlet weak var fieldOption: UITextField!
    
    @IBOutlet weak var imgCheck1Option: UIImageView!
    @IBOutlet weak var imgCheck2Option: UIImageView!
    @IBOutlet weak var imgCheck3Option: UIImageView!
    @IBOutlet weak var imgCheck4Option: UIImageView!
    
    override class func awakeFromNib() {
    
    }

}
