//
//  LoginVC.swift
//  SelectableTableView
//
//  Created by AbbyLai on 2017/1/13.
//  Copyright © 2017年 AbbyLai. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var txfAccount: UITextField!
    @IBOutlet weak var txfPwd: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action:#selector(LoginVC.handleTap(_:)))
        self.view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -
    @IBAction func loginBtnAction(_ sender: Any) {
        
    }
    
    func handleTap(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    // MARK: - TextField
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField==txfAccount {
            txfPwd.becomeFirstResponder()
        }
        else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    
    // MARK: - Navigation

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool  {
        //check all feild are filled.
        let account : String = txfAccount.text!
        let pwd : String = txfPwd.text!
        print("account:\(account)\npwd:\(pwd)")
        if account=="" {
            AlertViewController().showAlertViewController(title:nil,message:"Please fill account feild!",vc: self)
            return false;
        }
        if pwd=="" {
            AlertViewController().showAlertViewController(title:nil,message:"Please fill password feild!",vc: self)
            return false;
        }
        
        return true
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
