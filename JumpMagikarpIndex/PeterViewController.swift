//
//  PeterViewController.swift
//  JumpMagikarpIndex
//
//  Created by Yu-Hsuan Chen on 19/06/2017.
//  Copyright © 2017 Yu-Hsuan Chen. All rights reserved.
//

import UIKit

class PeterViewController: UIViewController {

    @IBAction func gotoPeterFB(_ sender: Any) {
        if let url = NSURL(string: "https://www.facebook.com/iphone.peterpan/") {
            UIApplication.shared.openURL(url as URL)
    }
    }
        override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
