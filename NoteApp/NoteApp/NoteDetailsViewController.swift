//
//  NoteDetails.swift
//  NoteApp
//
//  Created by Long Nguyen on 6/6/24.
//

import UIKit

class NoteDetailsViewController: UIViewController {
    var note: Note?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    var noteTitle: String = ""
    var noteContent: String = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Note details"
        
        titleLabel?.text = noteTitle
        descriptionLabel?.text = noteContent

    }
    

}
