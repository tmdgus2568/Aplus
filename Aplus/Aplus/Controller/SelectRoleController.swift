//
//  SignUpController.swift
//  Aplus
//
//  Created by hsh on 2021/06/01.
//

import UIKit

class SelectRoleController: UIViewController{
//    var btnLeftBar:UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let imgBack = UIImage(systemName: "chevron.backward")
        
        self.title = "역할 설정"
        self.navigationController?.navigationBar.barTintColor = .white
        // 벡버튼 이미지 설정, 액션 설정
        let btnLeftBar = UIBarButtonItem.init(image:imgBack, style: .done, target: self, action: #selector(onClickbtnLeftBar(_sender:)))
        btnLeftBar.tintColor = .black
        self.navigationItem.leftItemsSupplementBackButton = true
        navigationItem.leftBarButtonItem = btnLeftBar
     
        
    }

    // navigation bar에 back 버튼 누르면 dismiss
    @objc func onClickbtnLeftBar(_sender:UIBarButtonItem){
        self.dismiss(animated: true, completion: nil)
    }
    
    
        
}
