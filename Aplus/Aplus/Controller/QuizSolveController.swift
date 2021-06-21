//
//  QuizSolveController.swift
//  Aplus
//
//  Created by hsh on 2021/06/17.
//

import UIKit

class QuizSolveController:UIViewController, UITableViewDelegate, UITableViewDataSource{
    let cellTitle:Array<String> = ["다음 중 과일이 아닌것은?", "다음 중 과목이 아닌 것은?"]
    let cellAddImage:Array<Bool> = [false, false]
    let cellType:Array<String> = ["객관식","객관식"]
    
    
    var stringTitle:String?
    var stringDeadline:String?
    
    @IBOutlet weak var tableQuestion: UITableView!
    @IBOutlet weak var viewQuizStatus: UIView!
    @IBOutlet weak var lbQuizDeadline: UILabel!
    @IBOutlet weak var lbQuizTitle: UILabel!
    override func viewDidLoad() {
        tableQuestion.delegate = self
        tableQuestion.dataSource = self
        
        (stringTitle==nil) ? (lbQuizTitle.text=""):(lbQuizTitle.text=stringTitle)
        (stringDeadline==nil) ? (lbQuizDeadline.text=""):(lbQuizDeadline.text=stringDeadline)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableQuestion.dequeueReusableCell(withIdentifier: "customQuizQuestionCell") as! CustomQuizQuestionList
        cell.imgAddImage.isHidden = true
        cell.imgGrading.isHidden = true
        cell.fieldOption.isHidden = true
        cell.viewSelectOption.isHidden = true
        cell.lbTitle.text = cellTitle[indexPath.row]
        
        cell.view1Option.tag = indexPath.row
        cell.view2Option.tag = indexPath.row
        cell.view3Option.tag = indexPath.row
        cell.view4Option.tag = indexPath.row
        
        // button이 아닌 view, image 등에 클릭시 액션 넣고싶으면
        // UITapGestureRecognizer 사용
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(onClickOption(_sender:)))
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(onClickOption(_sender:)))
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(onClickOption(_sender:)))
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(onClickOption(_sender:)))
        
        cell.view1Option.addGestureRecognizer(tapGesture1)
        cell.view1Option.isUserInteractionEnabled = true
        
        cell.view2Option.addGestureRecognizer(tapGesture2)
        cell.view2Option.isUserInteractionEnabled = true

        cell.view3Option.addGestureRecognizer(tapGesture3)
        cell.view3Option.isUserInteractionEnabled = true

        cell.view4Option.addGestureRecognizer(tapGesture4)
        cell.view4Option.isUserInteractionEnabled = true
        
        
        if cellAddImage[indexPath.row]{
            cell.imgAddImage.isHidden = false
        }
        if cellType[indexPath.row] == "객관식"{
            cell.viewSelectOption.isHidden = false


        }
        if cellType[indexPath.row] == "주관식"{
            cell.fieldOption.isHidden = false
        }
        
        
        return cell
        
        
    }
    
    @objc func onClickOption(_sender:UITapGestureRecognizer!){
        print(_sender.view!.tag)
        // _sender.view ==> viewXOption (X = 1,2,3,4)
    
        let cell = tableQuestion.cellForRow(at: IndexPath(row: _sender.view!.tag, section: 0) as IndexPath) as! CustomQuizQuestionList
        
        if _sender.view! == cell.view1Option{
            cell.imgCheck1Option.image = UIImage(systemName: "record.circle")
            cell.imgCheck2Option.image = UIImage(systemName: "circle")
            cell.imgCheck3Option.image = UIImage(systemName: "circle")
            cell.imgCheck4Option.image = UIImage(systemName: "circle")
        }
        else if _sender.view! == cell.view2Option{
            cell.imgCheck2Option.image = UIImage(systemName: "record.circle")
            cell.imgCheck1Option.image = UIImage(systemName: "circle")
            cell.imgCheck3Option.image = UIImage(systemName: "circle")
            cell.imgCheck4Option.image = UIImage(systemName: "circle")
            
        }
        else if _sender.view! == cell.view3Option{
            cell.imgCheck3Option.image = UIImage(systemName: "record.circle")
            cell.imgCheck2Option.image = UIImage(systemName: "circle")
            cell.imgCheck1Option.image = UIImage(systemName: "circle")
            cell.imgCheck4Option.image = UIImage(systemName: "circle")
            
        }
        else if _sender.view! == cell.view4Option{
            cell.imgCheck4Option.image = UIImage(systemName: "record.circle")
            cell.imgCheck2Option.image = UIImage(systemName: "circle")
            cell.imgCheck3Option.image = UIImage(systemName: "circle")
            cell.imgCheck1Option.image = UIImage(systemName: "circle")
            
        }
//        cell.isSelected = !cell.isSelected
//        if cell.isSelected{
//            cell.imgCheck1Option.image = UIImage(systemName: "record.circle")
//
//        }
//        self.tableQuestion.reloadData()
    }
}
