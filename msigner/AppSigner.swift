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
    func signIPAFile(unzippedIpaPath: URL, dylibPath: URL) {
        var zsignasset = ZSignAsset()
        var zappbundle = ZAppBundle()
        
        let unzippedIpaPathString = unzippedIpaPath.path
        let stdUnzippedIpaPath = std.string(unzippedIpaPathString)
        
        let dylibPathString = dylibPath.path
        let stdDylibPath = std.string(dylibPathString)
        
        let bundleId = std.string("1")
        let bundleVersion = std.string("version")
        let displayName = std.string("display")
        let bForce = CBool(false)
        let bWeakInject = CBool(false)
        let bEnableCache = CBool(false)
        
        zappbundle.SignFolder(&zsignasset, stdUnzippedIpaPath, bundleId, bundleVersion, displayName, stdDylibPath, bForce, bWeakInject, bEnableCache)
    }
    
}
