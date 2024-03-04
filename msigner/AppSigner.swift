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
    private let unsigIPAPath: String?
    private var signedIPAPath: String?
    private let p12Path: String?
    private let provPath: String?
    
    init(unsigIPAPath: String, p12Path: String, provPath: String) {
        self.unsigIPAPath = unsigIPAPath
        self.p12Path = p12Path
        self.provPath = provPath
    }
    
    func signIPAFile() {
        
    }
    
    func unZipIPA() {
        
        
    }
    
    func zipIPA() {
        
        
    }
    
    
    
    
}
