//
//  ListVC.swift
//  SelectableTableView
//
//  Created by AbbyLai on 2017/1/16.
//  Copyright © 2017年 AbbyLai. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbTop: UILabel!
    @IBOutlet weak var lbMid: UILabel!
    @IBOutlet weak var lbBottom: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}


class ListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    static let key1 : String = "top"
    static let key2 : String = "mid"
    static let key3 : String = "bottom"
    let contentArray = [["top":"top1","mid":"mid1","bottom":"bottom1"],
                        ["top":"top2","mid":"mid2","bottom":"bottom2"],
                        ["top":"top3","mid":"mid3","bottom":"bottom3"]]
    var selectedSection = 0
    let sectionHeader = ["Single Selection", "Multiple Selection"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -
    @IBAction func logoutAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell") as! ListTableViewCell
        let dictionary = contentArray[indexPath.row]
        let str : String = dictionary[ListVC.key1]!
        cell.lbTop.text = str;
        cell.lbMid.text = dictionary[ListVC.key2]!;
        cell.lbBottom.text = dictionary[ListVC.key3]!;
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red: 66/255, green: 134/255, blue: 244/255, alpha: 1)
        cell.selectedBackgroundView = backgroundView

        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Single Selection"
        }
        else {
            return "Multiple Selection"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSection = indexPath.section
        self.performSegue(withIdentifier: "goToDetail", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let returnedView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        returnedView.backgroundColor = UIColor.init(colorLiteralRed: 12/255, green: 14/255, blue: 18/255, alpha: 1)
        
        let label = UILabel(frame: CGRect(x: 10, y: 0, width:returnedView.frame.size.width-20.0, height: returnedView.frame.size.height))
        label.text = sectionHeader[section]
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 17)
        returnedView.addSubview(label)
        
        return returnedView
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let detailVC : DetailVC = segue.destination as! DetailVC
        if selectedSection == 0 {
            //single selection
            detailVC.isMultipleSelection = false
        }
        else {
            //multiple selection
            detailVC.isMultipleSelection = true
        }
    }

}
