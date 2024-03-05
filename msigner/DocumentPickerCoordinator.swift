//
//  DocumentPickerCoordinator.swift
//  msigner
//
//  Created by Miika Karjalainen on 4.3.2024.
//

import Foundation
import UIKit
import MobileCoreServices

class DocumentPickerCoordinator: UIViewController {
    @IBAction func selectFileButtonTapped(_ sender: UIButton) {
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [.pdf])
        documentPicker.delegate = self
        present(documentPicker, animated: true, completion: nil)
    }
}

extension DocumentPickerCoordinator: UIDocumentPickerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let selectedFileURL = urls.first else { return }
        // Handle the selected file URL
        print("Selected file URL: \(selectedFileURL)")
    }
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        // User cancelled the document picker
    }
}
