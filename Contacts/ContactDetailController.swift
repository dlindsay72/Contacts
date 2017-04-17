//
//  ContactDetailController.swift
//  Contacts
//
//  Created by Dan Lindsay on 2017-04-17.
//  Copyright © 2017 Dan Lindsay. All rights reserved.
//

import UIKit

class ContactDetailController: UITableViewController {
    
    var contact: Contact?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }


}
