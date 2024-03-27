//
//  PostTableViewController.swift
//  SocialMedia
//
//  Created by Jordan Fraughton on 3/26/24.
//

import UIKit

protocol PostTableViewControllerDelegate: AnyObject {
    func postTableViewController(_ controller: PostTableViewController, didSave post: Post)
}

class PostTableViewController: UITableViewController, UITextFieldDelegate, UITextViewDelegate {
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var userTextField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var bodyTextView: UITextView!
    @IBOutlet var saveButton: UIBarButtonItem!
    
    let dateLabelIndexPath = IndexPath(row: 0, section: 1)
    let datePickerIndexPath = IndexPath(row: 1, section: 1)
    let bodyTextViewIndexPath = IndexPath(row: 0, section: 2)

    var isEditingDate: Bool = false {
        didSet {
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }

    weak var delegate: PostTableViewControllerDelegate?
    var post: Post?

    override func viewDidLoad() {
        super.viewDidLoad()
        bodyTextView.delegate = self

        updateView()
        updateSaveButtonState()
    }

    func updateView() {
        if let post {
            navigationItem.title = post.title
            titleTextField.text = post.title
            userTextField.text = post.user
            dateLabel.text = post.date.formatted(date: .abbreviated, time: .complete)
            datePicker.date = post.date
            bodyTextView.text = post.bodyText
        } else {
            navigationItem.title = "New Post"
        }
    }

    func updateSaveButtonState() {
        let shouldEnableSaveButton = titleTextField.text?.isEmpty == false && userTextField.text?.isEmpty == false && bodyTextView.text.isEmpty == false
        saveButton.isEnabled = shouldEnableSaveButton
    }

    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let title = titleTextField.text,
           let user = userTextField.text,
           let bodyText = bodyTextView.text else { return }

        let post = Post(title: title, bodyText: bodyText, date: datePicker.date, user: user, comments: ["Add some comments"])

        delegate?.postTableViewController(self, didSave: post)
        performSegue(withIdentifier: "peroformUnwind", sender: self)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        post = nil
        performSegue(withIdentifier: "peroformUnwind", sender: self)
    }
    
    @IBAction func titleTextFieldDidChange(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    @IBAction func userTextFieldDidChange(_ sender: UITextField) {
        updateSaveButtonState()
    }

    func textViewDidChange(_ textView: UITextView) {
        updateSaveButtonState()
    }
}
