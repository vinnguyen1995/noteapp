//
//  NoteCell.swift
//  NoteApp
//
//  Created by Long Nguyen on 6/6/24.
//

import UIKit
protocol NoteCellDelegate {
    func noteCellDidSelect(_ cell: NoteDetails)
}
class NoteCell: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    var delegate: NoteCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblTitle.numberOfLines = 0
        lblDescription.numberOfLines = 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        delegate?.noteCellDidSelect(NoteDetails())
    }
    
    func binding(note: Note) {
        lblTitle.text = note.title
        lblDescription.text = note.description
    }
    
}
