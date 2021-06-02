//
//  SignUpController.swift
//  Aplus
//
//  Created by hsh on 2021/06/03.
//

import UIKit

class SignUpController: UIViewController{
    @IBOutlet weak var tfId: UITextField!
    @IBOutlet weak var tfPwd: UITextField!
    @IBOutlet weak var tfPwd2: UITextField!
    @IBOutlet weak var tfName: UITextField!
    
    @IBOutlet weak var btnSignUp: UIButton!
    var alert:UIAlertController!
    var okAction:UIAlertAction!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = ""
        self.title = "회원 가입"
        
        alert = UIAlertController(title: "알림", message: "필수 입력란을 채워주세요.", preferredStyle: .alert)
        okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)

        
    }
    @IBAction func onClickBtnSignUp(_ sender: UIButton) {
        

        if !tfId.hasText{
            present(alert, animated: true, completion: nil)
        }
        else if !tfPwd.hasText{
            present(alert, animated: true, completion: nil)
        }
        else if !tfPwd2.hasText{
            present(alert, animated: true, completion: nil)
        }
        else if !tfName.hasText{
            present(alert, animated: true, completion: nil)
        }
        else{
            // 가입 가능하다면 다시 로그인 상태로 돌아감
            self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        }

    }
    
}
