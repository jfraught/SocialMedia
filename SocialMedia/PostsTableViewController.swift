//
//  PostsTableViewController.swift
//  SocialMedia
//
//  Created by Jordan Fraughton on 3/26/24.
//

import UIKit

class PostsTableViewController: UITableViewController, PostTableViewControllerDelegate {
    var posts: [Post] = []
    var editingIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Posts"
        posts = Post.samplePosts
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostTableViewCell

        let post = posts[indexPath.row]
        cell.titleLabel.text = post.title
        cell.dateLabel.text = post.date.formatted(date: .numeric, time: .shortened)
        cell.userLabel.text = "By: \(post.user)"
        cell.bodyLabel.text = post.bodyText
        cell.editButton.tag = indexPath.row

        return cell
    }

    @IBSegueAction func showPost(_ coder: NSCoder, sender: Any?) -> UITableViewController? {
        let commentsTableViewController = CommentsTableViewController(coder: coder)

        guard 
            let cell = sender as? UITableViewCell,
                let indexPath = tableView.indexPath(for: cell)
        else {
            return commentsTableViewController
        }

        let comments = posts[indexPath.row].comments
        commentsTableViewController?.comments = comments
        commentsTableViewController?.navigationItem.title = posts[indexPath.row].title

        return commentsTableViewController
    }

    func postTableViewController(_ controller: PostTableViewController, didSave post: Post) {
        if let editingIndex {
            posts.remove(at: editingIndex)
            posts.insert(post, at: editingIndex)
            self.editingIndex = nil
        } else {
            posts.append(post)
        }

        tableView.reloadData()
        dismiss(animated: true)
    }

    @IBAction func unwindToPosts(segue: UIStoryboardSegue) {
        tableView.reloadData()
    }

    @IBSegueAction func postDetailVC(_ coder: NSCoder, sender: Any?) -> PostTableViewController? {
        let postTableViewController = PostTableViewController(coder: coder)
        postTableViewController?.delegate = self

        guard let editButton = sender as? UIButton else { return postTableViewController }

        postTableViewController?.post = posts[editButton.tag]
        editingIndex = editButton.tag

        return postTableViewController
    }
}
