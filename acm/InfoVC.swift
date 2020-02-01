//
//  InfoVC.swift
//  acm
//
//  Created by Swamita on 30/01/20.
//  Copyright © 2020 Swamita. All rights reserved.
//

import UIKit

class InfoVC: UIViewController {
    
    @IBOutlet weak var clabel: UILabel!
    @IBOutlet weak var  cname: UILabel!
    @IBOutlet weak var cemail: UILabel!
    @IBOutlet weak var cimage: UIImageView!
    
    @IBAction func Call(_ sender: Any) {
        
    }
    @IBAction func message(_ sender: Any) {
        let mail = "mail://"
        let mailURL = NSURL(string: mail)
        if UIApplication.shared.canOpenURL(mailURL! as URL)
        {
            UIApplication.shared.canOpenURL(mailURL! as URL)
        } else {
            UIApplication.shared.openURL(NSURL(string: "http://gmail.com")! as URL)        }
    }
    @IBAction func mail(_ sender: Any) {
        let instagramHooks = "imessage://"
        let instagramUrl = NSURL(string: instagramHooks)
        if UIApplication.shared.canOpenURL(instagramUrl! as URL)
        {
            UIApplication.shared.openURL(instagramUrl! as URL)

         } else {
            //redirect to safari because the user doesn't have Instagram
            UIApplication.shared.openURL(NSURL(string: "http://instagram.com/")! as URL)
        }
    }
    @IBAction func fav(_ sender: Any) {
    }
    var cont: Contactinfo?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        clabel.text = "Phone: \(cont?.number ?? "00")"
        cname.text = cont?.name
        cemail.text = "Mail ID: \(cont?.email ?? "00")"
        cimage.image = cont?.image
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
