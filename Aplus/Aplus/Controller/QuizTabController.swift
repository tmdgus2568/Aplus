//
//  QuizTabController.swift
//  Aplus
//
//  Created by hsh on 2021/06/11.
//

import UIKit

class QuizTabControllder:UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableQuiz: UITableView!
    let cellRegDate:Array<String> = ["2021년 6월 12일", "2021년 7월 15일"]
    let cellStatus:Array<String> = ["제출완료","기간만료"]
    let cellTitle:Array<String> = ["제 1회 문제풀기","제 2회 문제풀기"]
    let cellDeadLine:Array<String> = ["2021월 6월 18일 11:59","2021년 8월 1일 11:59"]
    let cellNumOfPeople:Array<String> = ["10/20","0/20"]
    
    override func viewDidLoad() {
        tableQuiz.delegate = self
        tableQuiz.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableQuiz.dequeueReusableCell(withIdentifier: "customQuizListCell") as! CustomQuizListCell
        cell.lbQuizDeadline.text = cellDeadLine[indexPath.row]
        cell.lbQuizTitle.text = cellTitle[indexPath.row]
        cell.lbQuizRegDate.text = cellRegDate[indexPath.row]
        cell.lbQuizNumOfPeople.text = cellNumOfPeople[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController = segue.destination as? QuizSolveController else {
            return
        }
        if sender is CustomQuizListCell{
            let cell = sender as! CustomQuizListCell
            nextViewController.stringTitle = cell.lbQuizTitle.text
            nextViewController.stringDeadline = cell.lbQuizDeadline.text
        }
    }
    
    
}

