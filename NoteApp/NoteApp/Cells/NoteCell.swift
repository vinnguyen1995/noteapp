//
//  NoteCell.swift
//  NoteApp
//
//  Created by Long Nguyen on 6/6/24.
//

import UIKit

class NoteCell: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel?
    @IBOutlet weak var lblDescription: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lblTitle?.numberOfLines = 0
        lblDescription!.numberOfLines = 3
    }
    
    func binding(note: Note) {
        lblTitle?.text = note.title
        lblDescription!.text = note.description
    }
}

