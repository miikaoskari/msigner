//
//  AppSigner.swift
//  msigner
//
//  Created by Miika Karjalainen on 18.2.2024.
//

import Foundation
import UIKit
import Zip

class Signer {
    private var unsigIPAPath: URL
    private var signedIPAPath: URL
    private let p12Path: String?
    private let provPath: String?
    private var documentsFolder: URL
    
    init(unsigIPAPath: URL, p12Path: String, provPath: String, documentsFolder: URL, signedIPAPath: URL) {
        self.unsigIPAPath = unsigIPAPath
        self.p12Path = p12Path
        self.provPath = provPath
        self.documentsFolder = documentsFolder
        self.signedIPAPath = signedIPAPath
        Zip.addCustomFileExtension("ipa")
    }
    
    func signIPAFile() {
        
    }
    
    // unzip ipa
    func unZipIPA() {
        do {
            self.unsigIPAPath = Bundle.main.url(forResource: "file", withExtension: "ipa")!
            let documentsDirectory = FileManager.default.urls(for:.documentDirectory, in: .userDomainMask)[0]
            try Zip.unzipFile(self.unsigIPAPath, destination: documentsDirectory, overwrite: true, password: "", progress: { (progress) -> () in
                print(progress)
            })
        }
        catch {
          print("Failed to unzip ipa")
        }
    }
    
    // zip signed ipa
    func zipIPA() {
       
    }
    
    
    
    
}
