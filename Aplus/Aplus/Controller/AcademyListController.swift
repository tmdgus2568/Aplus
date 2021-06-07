//
//  AcademyListController.swift
//  Aplus
//
//  Created by hsh on 2021/06/03.
//
import UIKit

class AcademyListController: UIViewController, UITableViewDataSource, UITabBarDelegate, UITableViewDelegate{
    


    @IBOutlet weak var btnNotice: UIButton!
    @IBOutlet weak var btnSchedule: UIButton!
    @IBOutlet weak var btnSetting: UIButton!
    @IBOutlet weak var tableAcademy: UITableView!
    let cellNames:Array<String> = ["새싹수학학원", "예지컴퓨터학원","소현수학학원"]
    let cellStatus:Array<String> = ["승인대기","거절","승인"]
    var btnLeftBar:UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnLeftBar = UIBarButtonItem.init(title:"  학원 선택", style: .done, target: self, action: nil)
        btnLeftBar.tintColor = .black
        self.navigationItem.leftItemsSupplementBackButton = true
        navigationItem.leftBarButtonItem = btnLeftBar
        self.navigationController?.navigationBar.barTintColor = .white

        tableAcademy.delegate = self
        tableAcademy.dataSource = self
        
   
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableAcademy.dequeueReusableCell(withIdentifier: "customAcademyCell") as! CustomAcedemyCell
        cell.lbAcademyName.text = cellNames[indexPath.row]
        
        // cell의 status에 따라 승인이면 숨김.
        switch cellStatus[indexPath.row] {
        case "승인":
            cell.viewAcademyStatus.isHidden = true
            break
            
        case "거절":
            cell.viewAcademyStatus.isHidden = false
            cell.lbAcademyStatus.text = "거절됨"
            cell.viewAcademyStatus.backgroundColor = UIColor(named: "pink_main")
            cell.lbAcademyName.textColor = UIColor(named: "pink_main")
            cell.viewAcedemybg.backgroundColor = UIColor(named: "pink_main_opacity")
            break

        case "승인대기":
            cell.viewAcademyStatus.isHidden = false
            cell.viewAcademyStatus.backgroundColor = UIColor(named: "blue_main")
            cell.lbAcademyName.textColor = UIColor(named: "blue_main")
            cell.viewAcedemybg.backgroundColor = UIColor(named: "blue_main_opacity")
            break
            
        default:
            break
            
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
  
}
