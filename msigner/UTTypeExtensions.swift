//
//  UTTypeExtensions.swift
//  msigner
//
//  Created by Miika Karjalainen on 8.3.2024.
//

import UniformTypeIdentifiers

extension UTType
{
    static let ipa = UTType(importedAs: "com.apple.itunes.ipa")
    static let p12 = UTType(importedAs: "com.apple.p12")
    static let mobileprovision = UTType(importedAs: "com.apple.mobileprovision")
}
