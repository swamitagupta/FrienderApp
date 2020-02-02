//
//  Contacts.swift
//  acm
//
//  Created by Swamita on 01/02/20.
//  Copyright © 2020 Swamita. All rights reserved.
//

import UIKit
import Contacts

class Friend {
  let firstName: String
  let lastName: String
  let workEmail: String
  var identifier: String?
  let profilePicture: UIImage?
  var storedContact: CNMutableContact?
  var phoneNumberField: (CNLabeledValue<CNPhoneNumber>)?
  
  init(firstName: String, lastName: String, workEmail: String, profilePicture: UIImage?){
    self.firstName = firstName
    self.lastName = lastName
    self.workEmail = workEmail
    self.profilePicture = profilePicture
  }
  
  static func defaultContacts() -> [Friend] {
    return [
      Friend(firstName: "Mic", lastName: "Pringle", workEmail: "mic@example.com", profilePicture: UIImage(named: "MicProfilePicture")),
      Friend(firstName: "Ray", lastName: "Wenderlich", workEmail: "ray@example.com", profilePicture: UIImage(named: "RayProfilePicture")),
      Friend(firstName: "Sam", lastName: "Davies", workEmail: "sam@example.com", profilePicture: UIImage(named: "SamProfilePicture")),
      Friend(firstName: "Greg", lastName: "Heo", workEmail: "greg@example.com", profilePicture: UIImage(named: "GregProfilePicture"))]
  }
}

extension Friend: Equatable {
  static func ==(lhs: Friend, rhs: Friend) -> Bool{
    return lhs.firstName == rhs.firstName &&
      lhs.lastName == rhs.lastName &&
      lhs.workEmail == rhs.workEmail &&
      lhs.profilePicture == rhs.profilePicture
  }
}

extension Friend {
  var contactValue: CNContact {
    let contact = CNMutableContact()
    contact.givenName = firstName
    contact.familyName = lastName
    contact.emailAddresses = [CNLabeledValue(label: CNLabelWork, value: workEmail as NSString)]
    if let profilePicture = profilePicture {
      let imageData = profilePicture.jpegData(compressionQuality: 1)
      contact.imageData = imageData
    }
    if let phoneNumberField = phoneNumberField {
      contact.phoneNumbers.append(phoneNumberField)
    }
    return contact.copy() as! CNContact
  }
  
  convenience init?(contact: CNContact) {
    guard let email = contact.emailAddresses.first else { return nil }
    let firstName = contact.givenName
    let lastName = contact.familyName
    let workEmail = email.value as String
    var profilePicture: UIImage?
    if let imageData = contact.imageData {
      profilePicture = UIImage(data: imageData)
    }
    self.init(firstName: firstName, lastName: lastName, workEmail: workEmail, profilePicture: profilePicture)
    if let contactPhone = contact.phoneNumbers.first {
      phoneNumberField = contactPhone
    }
  }
}

/*class Contacts: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}*/
