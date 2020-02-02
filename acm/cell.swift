//
//  cell.swift
//  acm
//
//  Created by Swamita on 01/02/20.
//  Copyright © 2020 Swamita. All rights reserved.
//

import UIKit
import Contacts

class FriendCell: UITableViewCell {
  @IBOutlet private weak var contactNameLabel: UILabel!
  @IBOutlet private weak var contactEmailLabel: UILabel!
  @IBOutlet private weak var contactImageView: UIImageView! {
    didSet {
      contactImageView.layer.masksToBounds = true
      contactImageView.layer.cornerRadius = 22.0
    }
  }
  
  var friend : Friend? {
    didSet {
      configureCell()
    }
  }
  
  private func configureCell() {
    let formatter = CNContactFormatter()
    formatter.style = .fullName
    guard let friend = friend,
      let name = formatter.string(from: friend.contactValue) else { return }
    contactNameLabel.text = name
    contactEmailLabel.text = friend.workEmail
    contactImageView.image = friend.profilePicture ?? UIImage(named: "PlaceholderProfilePic")
  }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}*/
