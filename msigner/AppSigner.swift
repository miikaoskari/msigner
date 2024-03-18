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
    // init
    init() {
        Zip.addCustomFileExtension("ipa")
    }
    
    // unzip ipa
    func unZipIPA(ipaPath: URL, destinationPath: URL) {
        do {
            try Zip.unzipFile(ipaPath, destination: destinationPath, overwrite: true, password: "", progress: { (progress) -> () in
                print(progress)
            }) // Unzip
        }
        catch {
            print("Something went wrong")
        }
    }
    
    // zip resigned ipa
    func zipIPA(unzippedIpaPath: URL, destinationPath: URL, zipFileName: String) {
        let zipFilePath = destinationPath.appendingPathComponent(zipFileName)
        do {
            try Zip.zipFiles(paths: [unzippedIpaPath], zipFilePath: zipFilePath, password: "", progress: { (progress) -> () in
                print(progress)
            }) // Zip
        } catch {
            print("Something went wrong")
        }
    }
    
    // sign ipa file
    func signIPAFile(unzippedIpaPath: URL) {
        let zsignasset = ZSignAsset()
        let zappbundle = ZAppBundle()
        
        
        
    }
    
}
