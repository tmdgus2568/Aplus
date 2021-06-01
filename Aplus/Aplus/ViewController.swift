//
//  ViewController.swift
//  Aplus
//
//  Created by hsh on 2021/05/31.
//

import UIKit

class ViewController: UIViewController {
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
            
            isCheckedAuto = false
        }

        else{
            sender.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            isCheckedAuto = true
        }
    }
    
}

