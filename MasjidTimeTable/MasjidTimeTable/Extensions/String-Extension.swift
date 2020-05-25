//
//  StringExtension.swift
//  NoBolo
//
//  Created by Muneeb on 4/25/19.
//  Copyright © 2019 Muneeb. All rights reserved.
//

import Foundation

var kAppLanguage = "en"

extension String {
    
    func condensingWhitespace() -> String { //example "  my   name is  " -> "my name is"
        return self.components(separatedBy: .whitespacesAndNewlines)
            .filter { !$0.isEmpty }
            .joined(separator: " ")
    }
    
    var localized: String {
        if let appLang = UserDefaults.standard.string(forKey: Constants.appLanguageKey) {
            kAppLanguage = appLang
        }
        UserDefaults.standard.set([kAppLanguage], forKey: "AppleLanguages")
        guard let path = Bundle.main.path(forResource:  kAppLanguage,
                                          ofType: "lproj") else {return ""}
        guard let bundle = Bundle(path: path) else {return ""}
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    var html2AttributedString: NSAttributedString? {
        return Data(utf8).html2AttributedString
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}

extension Data {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}
