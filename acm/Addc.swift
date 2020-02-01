//
//  Addc.swift
//  acm
//
//  Created by Swamita on 01/02/20.
//  Copyright © 2020 Swamita. All rights reserved.
//

import UIKit
import ContactsUI

var contactNameTxt: UITextField!
var phoneNumberTxt: UITextField!

func saveActionBtn(_ sender: UIButton) {

        let store = CNContactStore()
        let contact = CNMutableContact()

        // Name
        contact.givenName = contactNameTxt.text ?? ""

        // Phone
        contact.phoneNumbers.append(CNLabeledValue(
            label: "mobile", value: CNPhoneNumber(stringValue: phoneNumberTxt.text ?? "")))

        // Save
        let saveRequest = CNSaveRequest()
        saveRequest.add(contact, toContainerWithIdentifier: nil)
        try? store.execute(saveRequest)
}

class Addc: UIViewController {

    @IBAction func cancel(_ sender: Any) {
        /*let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier: "screen1") ;
        self.present(vc, animated: true, completion: nil);*/
    }
    @IBAction func save(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
