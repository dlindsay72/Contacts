//
//  ContactListController.swift
//  Contacts
//
//  Created by Dan Lindsay on 2017-04-17.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import UIKit

extension Contact {
    var firstLetterForSort: String {
        return String(firstName.characters.first!).uppercased()
    }
}

extension ContactsSource {
    static var sortedUniqueFirstLetters: [String] {
        let firstLetters = contacts.map { $0.firstLetterForSort }
        let uniqueFirstLetters = Set(firstLetters)
        return Array(uniqueFirstLetters).sorted()
    }
    
    static var sectionedContacts: [[Contact]] {
        return sortedUniqueFirstLetters.map { firstLetter in
            let filteredContacts = contacts.filter { $0.firstLetterForSort == firstLetter }
            return filteredContacts.sorted(by: { $0.firstName < $1.firstName })
        }
    }
}

private var contactCellIdentifier = "contactCell"
private var contactSegueIdentifier = "showContact"

class ContactListController: UITableViewController {
    
    var sections = ContactsSource.sectionedContacts
    let sectionTitles = ContactsSource.sortedUniqueFirstLetters

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitles
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sections[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let contactCell = tableView.dequeueReusableCell(withIdentifier: contactCellIdentifier, for: indexPath) as? ContactCell else { fatalError() }
        
        let contact = sections[indexPath.section][indexPath.row]
        
        contactCell.profileImageView.image = contact.image
        contactCell.nameLabel.text = "\(contact.firstName) \(contact.lastName)"
        contactCell.cityLabel.text = contact.city
        
        if contact.isFavorite {
            contactCell.favoriteIcon.image = #imageLiteral(resourceName: "Free_Blue_Star.jpg")
        }
        
        
        
        return contactCell
    }
    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
   
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == contactSegueIdentifier {
            if let indexPath = tableView.indexPathForSelectedRow {
                let contact = sections[indexPath.section][indexPath.row]
                
                guard let navigationController = segue.destination as? UINavigationController, let contactDetailController = navigationController.topViewController as? ContactDetailController else { return }
                contactDetailController.contact = contact
            }
        }
    }

   

}
