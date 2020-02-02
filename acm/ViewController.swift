//
//  ViewController.swift
//  acm
//
//  Created by Swamita on 30/01/20.
//  Copyright © 2020 Swamita. All rights reserved.
//

import UIKit
import ContactsUI

class Contactinfo {
    
    
    var number: String?
    var name: String?
    var image:UIImage?
    var email: String?
    
    init(no: String, na: String, im: UIImage, em: String) {
        self.number = no
        self.name = na
        self.image = im
        self.email = em
        
    }
}
var carray = [Contactinfo]()
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var contacts: UITableView!
    
    /*@IBOutlet weak var s: UISearchBar!
    var member = [[String:AnyObject]]()

    var members = [String:AnyObject]()

    var searchActive = false
    var filtered:[String] = []
    var data: [String] = []*/
    
    @IBAction func add(_ sender: Any) {
       
        /*let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier: "mySecondScreen") ; 
        self.present(vc, animated: true, completion: nil);*/
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let a = Contactinfo(no: "+91 85281 03018", na: "Aditya Shukla", im: UIImage(named: "img_411575")!, em: "aditya.shukla2019@vitstudent.ac.in")
        carray.append(a)
        
        let b = Contactinfo(no: "+91 94325 86288", na: "Agniva Basat", im: UIImage(named: "b")!, em: "agniva.basat2019@vitstudent.ac.in")
        carray.append(b)
        
        let c = Contactinfo(no: "+91 70213 18343", na: "Rashi Maru", im: UIImage(named: "c")!, em: "rashi.maru2019@vitstudent.ac.in")
        carray.append(c)
        
        let d = Contactinfo(no: "+91 97916 66886", na: "Sai Chaitanya", im: UIImage(named: "d")!, em: "pentapati.sai2019@vitstudent.ac.in")
        carray.append(d)
        
        let e = Contactinfo(no: "+91 70185 44435", na: "Shobhit Gupta", im: UIImage(named: "e")!, em: "shobhit.gupta2019@vitstudent.ac.in")
        carray.append(e)
        
        let f = Contactinfo(no: "+91 74285 19595", na: "Shreya Rastogi", im: UIImage(named: "f")!, em: "shreya.rastogi2019@vitstudent.ac.in")
        carray.append(f)
        
        let g = Contactinfo(no: "+91 96213 33821", na: "Shrivats Poddar", im: UIImage(named: "g")!, em: "shrivats.poddar2019@vitstudent.ac.in")
        carray.append(g)
        
        let h = Contactinfo(no: "+91 79030 37660", na: "Vaibhav Sinha", im: UIImage(named: "h")!, em: "vaibhav.sinha2019@vitstudent.ac.in")
        carray.append(h)
        
        contacts.dataSource = self
        contacts.delegate = self
        
    }
    /*func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }


    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        filtered = data.filter({ (text) -> Bool in
            let tmp:NSString = text as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })

        if (filtered.count == 0){
            searchActive = false
        }
        else{
            searchActive = true
        }
        self.contacts.reloadData()
    }

     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        return "Directory"

    }*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.rowHeight = 80
        return carray.count
        /*if(searchActive){
              print("Yup")
            return filtered.count
           }
        else{
            print("nah")
            return carray.count
            
           }*/
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "ctable")
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "ctable")
        }
        
        cell?.textLabel?.text = carray[indexPath.row].number
        cell?.detailTextLabel?.text = carray[indexPath.row].name
        cell?.imageView?.image = carray[indexPath.row].image
        
        
        cell!.backgroundColor = .yellow
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        performSegue(withIdentifier: "info", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      navigationController?.navigationBar.tintColor = .black
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? InfoVC {
            destination.cont =
                carray[(contacts.indexPathForSelectedRow?.row)!]
            contacts.deselectRow(at: contacts.indexPathForSelectedRow!, animated: true)
            
        }
    }



}
/*extension ViewController: CNContactPickerDelegate {
  func contactPicker(_ picker: CNContactPickerViewController,
                     didSelect contacts: [CNContact]) {
    let newFriends = contacts.compactMap { _ in Contactinfo(no: "", na: "", im: UIImage(named: "img_411575")!, em: "") }
    for ContactInfo in newFriends {
        if !carray.contains(where: Contactinfo) {
        carray.append(Contactinfo)
      }
    }
    tableView.reloadData()
  }
}*/


