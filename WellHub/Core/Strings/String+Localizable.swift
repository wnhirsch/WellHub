//
//  String+Localizable.swift
//  WellHub
//
//  Created by Wellington Nascente Hirsch on 22/05/23.
//

import Foundation

enum LocalizableFiles: String {
    case `default` = "Default"
}

extension String {

    func localized(context: LocalizableFiles) -> String {
        return NSLocalizedString(self, tableName: context.rawValue, value: "", comment: "")
    }

    func localizedWithArgs(context: LocalizableFiles, _ args: [CVarArg]) -> String {
        return String(format: localized(context: context), arguments: args)
    }
}
