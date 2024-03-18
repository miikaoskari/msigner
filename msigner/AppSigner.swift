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
    
    // unzip ipa
    func unZipIPA(ipaPath: URL, destinationPath: URL) {
        Zip.addCustomFileExtension("ipa")
        do {
            try Zip.unzipFile(ipaPath, destination: destinationPath, overwrite: true, password: "", progress: { (progress) -> () in
                print(progress)
            }) // Unzip

        }
        catch {
          print("Something went wrong")
        }
    }
    
    // zip signed ipa
    func zipIPA() {
        
    }
    
    // sign ipa file
    func signIPAFile() {
        
    }
    
}
