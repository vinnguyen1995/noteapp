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
        Note(title: "I don't know how to make Automations.", description: "AI to the rescue. Just type in what you want automated and ClickUp AI will build it for you!"),
        Note(title: "Help us build ClickUp", description: "On average, Automations save 3.6 hours every single week! What other meaningful projects could you focus on with all of that extra time?"),
        Note(title: "Bản tin Khách hàng T6.2024", description: "Any person receiving this email and any attachment(s) contained, shall treat the information as confidential and not misuse, copy, disclose, distribute or retain the information in any way that amounts to a breach of confidentiality. If you are not the intended recipient, please delete all copies of this email from your computer system. As the integrity of this message cannot be guaranteed, neither UOB nor any entity in the UOB Group (including United Overseas Bank (Vietnam) Limited) shall be responsible for the contents. Any opinion in this email may not necessarily represent the opinion of UOB or any entity in the UOB Group.")
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected cell: \(indexPath.row)")
        
        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "notedetails") as! NoteDetailsViewController
        storyboard.noteTitle = notes[indexPath.row].title
        storyboard.noteContent = notes[indexPath.row].description
        self.navigationController?.pushViewController(storyboard, animated: true)
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
        if segue.identifier == "NoteDetailsViewController",
           let destinationVC = segue.destination as? NoteDetailsViewController,
           let selectedNote = sender as? Note {
            destinationVC.note = selectedNote
        }
    }
}
