//
//  MagiKarpTableViewController.swift
//  JumpMagikarpIndex
//
//  Created by Yu-Hsuan Chen on 19/06/2017.
//  Copyright © 2017 Yu-Hsuan Chen. All rights reserved.
//

import UIKit

class MagiKarpTableViewController: UITableViewController {

    
    var Magikarp:[[String:String]] = []
    
    func getAddMagiNoti(noti:Notification) {
        let magiX = noti.userInfo as? [String:String]
        
        Magikarp.insert(magiX!, at: 0)
        
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("Magikarp.txt")
        (Magikarp as NSArray).write(to: url!, atomically: true)
        
        
        tableView.reloadData()
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("Magikarp.txt")
        let array = NSArray(contentsOf: url!)
        if array != nil {
            Magikarp = array as! [[String:String]]
        }
        
        let notiName = Notification.Name("AddMagi")
        NotificationCenter.default.addObserver(self, selector: #selector(MagiKarpTableViewController.getAddMagiNoti(noti:)), name: notiName, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Magikarp.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MCell", for: indexPath)
        
        // Configure the cell...
        
        let dic = Magikarp[indexPath.row]
        
        cell.textLabel?.text = dic["name"]
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent(dic["photo"]!)
        cell.imageView?.image = UIImage(contentsOfFile: url!.path)

        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
    */
    
    
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    
        Magikarp.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
        tableView.reloadData()

     }
    
     
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
