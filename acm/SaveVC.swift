//
//  SaveVC.swift
//  acm
//
//  Created by Swamita on 02/02/20.
//  Copyright © 2020 Swamita. All rights reserved.
//

import UIKit

class SaveVC: UIViewController {
    
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
            UIApplication.shared.openURL(NSURL(string: "https://www.icloud.com/mail")! as URL)        }
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
    
    var cont: Contactinfo?
    
    /*func objectAtKey(array: [T], key: String) -> T? {
        for element in array {
            if element.name == key {
                return element
            }
        }
        return nil
    }*/
    //let i = array.indexOf({$0 == "Foo"})

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        clabel.text = "Phone: \(cont?.number ?? "00")"
        cname.text = cont?.name ?? "John Appleseed"
        cemail.text = "Mail ID: \(cont?.email ?? "00@icloud.com")"
        cimage.image = cont?.image ?? UIImage(named: "img_411575")!
        
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
