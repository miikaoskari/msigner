//
//  FilePickerController.swift
//  msigner
//
//  Created by Miika Karjalainen on 18.2.2024.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers

class MyViewController: UIViewController, UIDocumentPickerDelegate {
    func selectFiles() {
        let types = UTType.types(tag: "json", tagClass: .filenameExtension, conformingTo: nil)
        let documentPickerController = UIDocumentPickerViewController(forOpeningContentTypes: types)
        documentPickerController.delegate = self
        self.present(documentPickerController, animated: true, completion: nil)
    }

    // Implement the following method from UIDocumentPickerDelegate:
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        // Handle the selected files (e.g., upload to a server)
        guard let myURL = urls.first else {
            return
        }
        print("Imported file URL: \(myURL)")
    }
}

