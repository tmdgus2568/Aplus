//
//  TermsOfServiceController.swift
//  Aplus
//
//  Created by hsh on 2021/06/03.
//

import UIKit

class TermsOfServiceController: UIViewController{
    var isCheckedAgree = false
    @IBOutlet weak var btnAgree: UIButton!
    var alert:UIAlertController!
    var okAction:UIAlertAction!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = ""
        self.title = "약관 동의"
        alert = UIAlertController(title: "알림", message: "이용 약관 동의를 체크해 주세요.", preferredStyle: UIAlertController.Style.alert)
        okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        
    }
    
    // 체크시 버튼 이미지 변경 
    @IBAction func onClickBtnAgree(_ sender: UIButton) {
        if isCheckedAgree{
            sender.setImage(UIImage(systemName: "square"), for: .normal)
            sender.tintColor = .black
            
            isCheckedAgree = false
        }

        else{
            sender.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            sender.tintColor = .black
            isCheckedAgree = true
        }
    }
    
    @IBAction func onClickBtnNext(_ sender: Any) {
        // 이용약관 동의 체크버튼을 누르지 않고
        // 다음으로 버튼을 누르려 할 시 알림창
        if !isCheckedAgree{
            present(alert, animated: true, completion: nil)
            
        }
    }
}
