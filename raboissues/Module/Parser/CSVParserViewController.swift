//
//  ViewController.swift
//  raboissues
//
//  Created by Oktay Curebal on 10/08/2022.
//

import UIKit
import UniformTypeIdentifiers


protocol CSVParserDisplayLogic {
    func displayCSVEntries(
        viewModel: CSVIssues.LoadIssues.ViewModel
    )
}

class CSVParserViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var interactor: CSVIssuesBusinessLogic?
    var presenter: CSVParserPresentationLogic?
    var issues: [Issue] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor = CSVIssuesInteractor()
        presenter = CSVParserPresenter()
        interactor?.presenter = presenter
        presenter?.view = self
        
    }
    
    
    /// Open the document picker
    @IBAction func openDocumentPicker() {
        let documentPicker = UIDocumentPickerViewController(
            forOpeningContentTypes: [
                .jpeg, .png, .commaSeparatedText
            ]
        )
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = false
        documentPicker.modalPresentationStyle = .fullScreen
        
        present(documentPicker, animated: true)
    }
    
    
    /// Fetch CSV Entries
    /// - Parameter fileUrl: the file url 
    func fetchCSVEntries(fileUrl: URL) {
        interactor?.parseCSVEntries(
            fileUrl: fileUrl
        )
    }
}

extension CSVParserViewController: CSVParserDisplayLogic {
    func displayCSVEntries(viewModel: CSVIssues.LoadIssues.ViewModel) {
        issues = viewModel.issues
        tableView.reloadData()
    }
}

extension CSVParserViewController: UIDocumentPickerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        fetchCSVEntries(fileUrl: url)
        dismiss(animated: true)
    }
}
