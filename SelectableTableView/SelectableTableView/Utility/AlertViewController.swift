//
//  AlertViewController.swift
//  SelectableTableView
//
//  Created by AbbyLai on 2017/1/16.
//  Copyright © 2017年 AbbyLai. All rights reserved.
//

import UIKit

class AlertViewController: NSObject {
    
    public func showAlertViewController(title:String!,message:String,vc:UIViewController) {
        let alertController = UIAlertController(title:title,
                                                message:message,
                                                preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK",
                                                style: UIAlertActionStyle.default,
                                                handler: nil))
        
        vc.present(alertController, animated: true, completion: nil)
    }
    
}
