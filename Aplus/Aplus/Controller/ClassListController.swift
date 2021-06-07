//
//  ClassListController.swift
//  Aplus
//
//  Created by hsh on 2021/06/07.
//

import UIKit

class ClassListController:UIViewController, UITableViewDataSource, UITabBarDelegate, UITableViewDelegate{
    let cellNames:Array<String> = ["새싹수학학원", "예지컴퓨터학원","소현수학학원"]
    let cellStatus:Array<String> = ["승인대기","거절","승인"]
    
    @IBOutlet weak var tableClass: UITableView!
    
    override func viewDidLoad() {
      
        self.title = "반목록"
    
        self.navigationController?.navigationBar.tintColor = .black
        tableClass.delegate = self
        tableClass.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableClass.dequeueReusableCell(withIdentifier: "customClassCell") as! CustomClassCell
        cell.lbClassName.text = cellNames[indexPath.row]
     
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // table click보다 먼저 실행되는 것 같다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let nextViewController = segue.destination as? MainTabController else{return}
        
        // sender가 CustomClassCell일 경우
        // class의 이름을 다음 나올 화면의 타이틀로 지정 (다음 화면 준비(prepare))
        if sender is CustomClassCell{
            let cell = sender as! CustomClassCell
            nextViewController.classTitle = cell.lbClassName.text
        }
    
        
        
    }
    
}
