//
//  ViewController.swift
//  Aplus
//
//  Created by hsh on 2021/05/31.
//

import UIKit

class LoginController: UIViewController {
    var isCheckedAuto:Bool! = true;

    @IBOutlet weak var btnAutoLogin: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
  
    }

    // 자동 로그인 체크박스
    @IBAction func didTapAutoLogin(_ sender: UIButton) {
        if isCheckedAuto{
            sender.setImage(UIImage(systemName: "square"), for: .normal)
            sender.tintColor = .black
            
            isCheckedAuto = false
        }

        else{
            sender.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            sender.tintColor = .black
            isCheckedAuto = true
        }
    }
    
    // 화면 전환 시, fullScreen 으로 표현
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let navigationController = segue.destination
        navigationController.modalPresentationStyle = .fullScreen
    }
    
}

