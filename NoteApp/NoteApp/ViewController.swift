//
//  ViewController.swift
//  NoteApp
//
//  Created by Long Nguyen on 6/6/24.
//

import UIKit

struct Note {
    let title: String
    let description: String
}

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private let noteCellIdentifier = "NoteCell"
    private var notes = [
        Note(title: "untitled", description: "lorem ipsum dolor asimet"),
        Note(title: "untitled2", description: "This is a note")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "All Notes"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "NoteCell", bundle: nil), forCellReuseIdentifier: noteCellIdentifier)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60 // Adjust height as needed
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedNote = notes[indexPath.row]
        performSegue(withIdentifier: "showNoteDetails", sender: selectedNote)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: noteCellIdentifier, for: indexPath) as! NoteCell
        cell.binding(note: notes[indexPath.row])
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showNoteDetails",
           let destinationVC = segue.destination as? NoteDetails,
           let selectedNote = sender as? Note {
            destinationVC.note = selectedNote
        }
    }
}
