//
//  DetailVC.swift
//  SelectableTableView
//
//  Created by AbbyLai on 2017/1/16.
//  Copyright © 2017年 AbbyLai. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

class DetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    static let keyDetail : String = "title"
    let contentArray = [
        ["top":"top1","mid":"mid1","bottom":"bottom1","title":"Apple"],["top":"top2","mid":"mid2","bottom":"bottom2","title":"Apricot"],
        ["top":"top3","mid":"mid3","bottom":"bottom3","title":"Banana"],
        ["top":"top1","mid":"mid1","bottom":"bottom1","title":"Blueberry"],
        ["top":"top2","mid":"mid2","bottom":"bottom2","title":"Cantaloupe"],
        ["top":"top3","mid":"mid3","bottom":"bottom3","title":"Cherry"],
        ["top":"top1","mid":"mid1","bottom":"bottom1","title":"Clementine"],
        ["top":"top2","mid":"mid2","bottom":"bottom2","title":"Coconut"],
        ["top":"top3","mid":"mid3","bottom":"bottom3","title":"Cranberry"]
    ]
    var selectedRow = NSMutableIndexSet()
    public var isMultipleSelection : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.tableView.allowsMultipleSelection = isMultipleSelection
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -
    
    @IBAction func saveBtnAction(_ sender: Any) {
        if selectedRow.count > 0 {
            print("selectedRow:\(selectedRow)")
            for row in selectedRow {
                let dictionary = contentArray[row]
                print("Selected dictionary:\(dictionary)")
            }
        }
        
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell") as! DetailTableViewCell
        let dictionary = contentArray[indexPath.row]
        let str : String = dictionary[DetailVC.keyDetail]!
        cell.lbTitle.text = str;
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red: 66/255, green: 134/255, blue: 244/255, alpha: 0.6)
        cell.selectedBackgroundView = backgroundView
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
        
        selectedRow.remove(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
        }
        
        selectedRow.add(indexPath.row)
        //print("Selected array:\(selectedRow)")
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
