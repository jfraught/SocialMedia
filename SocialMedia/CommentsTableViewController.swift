//
//  CommentsTableViewController.swift
//  SocialMedia
//
//  Created by Jordan Fraughton on 3/26/24.
//

import UIKit

class CommentsTableViewController: UITableViewController {
    var comments: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comments.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comment = comments[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)

        var content = cell.defaultContentConfiguration()
        content.text = comment
        cell.contentConfiguration = content

        return cell
    }
}
