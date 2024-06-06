//
//  NoteDetails.swift
//  NoteApp
//
//  Created by Long Nguyen on 6/6/24.
//

import UIKit

class NoteDetails: UIViewController {
    var note: Note?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Note details"
        if let note = note {
            titleLabel.text = note.title
            descriptionLabel.text = note.description
        } else {
            print("Empty notes")
        }

    }
    

}
