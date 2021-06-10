//
//  AttendanceTab.swift
//  Aplus
//
//  Created by hsh on 2021/06/08.
//

import UIKit
import FSCalendar
import SVProgressHUD

class AttendanceTabController:UIViewController, UITableViewDataSource, UITabBarDelegate, UITableViewDelegate, FSCalendarDelegate{
    var isCalendarOpen:Bool = false
    
    @IBOutlet weak var lbDate: UILabel!
    
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnPrev: UIButton!
    @IBOutlet weak var tableAttendance: UITableView!
    @IBOutlet weak var btnCalendar: UIButton!
    @IBOutlet weak var fsCalendar: FSCalendar!
    let dateFormatter = DateFormatter()
    
    @IBOutlet weak var stackView: UIStackView!
    let cellTime:Array<String> = ["16:00 ~ 17:00", "17:00 ~ 18:00","18:00 ~ 19:00"]
    let cellStatus:Array<String> = ["결석","지각","출석"]
    let cellSubject:Array<String> = ["수학","영어","과학"]
    override func viewDidLoad() {

        dateFormatter.dateFormat = "yyyy.MM.dd"
        
        tableAttendance.delegate = self
        tableAttendance.dataSource = self
        fsCalendar.delegate = self
        
        fsCalendar.isHidden = true
        lbDate.text = dateFormatter.string(from: fsCalendar.today!)
        
        fsCalendar.appearance.headerMinimumDissolvedAlpha = 0.0
        fsCalendar.locale = Locale(identifier: "ko_KR")
        
        
        
//        fsCalendar.calendarWeekdayView.weekdayLabels[0].textColor = UIColor(named: "pink_main")
//        fsCalendar.calendarWeekdayView.weekdayLabels[6].textColor = UIColor(named: "blue_main")
        
        
        
        
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        SVProgressHUD.show(withStatus: "Wait!")
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTime.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableAttendance.dequeueReusableCell(withIdentifier: "customAttendanceCell") as! CustomAttendanceCell
        
        switch cellStatus[indexPath.row] {
        case "출석":
            cell.viewStatusbg.backgroundColor = UIColor(named: "green_main")
            break
        case "결석":
            cell.viewStatusbg.backgroundColor = UIColor(named: "pink_main")
            break
        case "지각":
            cell.viewStatusbg.backgroundColor = UIColor(named: "yellow_main")
            break
        default:
            break
        }
        cell.lbStatus.text = cellStatus[indexPath.row]
        cell.lbSubject.text = cellSubject[indexPath.row]
        cell.lbTime.text = cellTime[indexPath.row]
    
        
        
        return cell
        
    }

    // 달력 날짜 선택 시, lbDate가 바뀜
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        // 날짜선택 시, 새로 데이터를 불러와야하므로 시간이 다소 걸릴 수 있는
        // 경우를 대비하여 progress 생성
        SVProgressHUD.show(withStatus: "Wait!")
        DispatchQueue.global(qos: .userInitiated).async {
            self.lbDate.text = self.dateFormatter.string(from: date)

            // 위 코드가 완료되면 dismiss
            DispatchQueue.main.async {
                SVProgressHUD.dismiss()
            }
        }
       
        
    }
    
    func animateCalendar(status:Bool){
        UIView.animate(withDuration: 0.35,
                           delay: 0.0,
                           usingSpringWithDamping: 0.9,
                           initialSpringVelocity: 1,
                           options: [],
                           animations: {
                            self.fsCalendar.isHidden = status
                              
                            self.stackView.layoutIfNeeded()
                            },
                           completion: nil)
    }
    
    @IBAction func onClickCalendar(_ sender: Any) {
        if !isCalendarOpen{
            animateCalendar(status: isCalendarOpen)
            isCalendarOpen = true
          
        }
        else{
            animateCalendar(status: isCalendarOpen)
            isCalendarOpen = false
            
        }
    }

    
    
    
}
