//
//  String+Extension.swift
//  Toolbox
//
//  Created by Sambit Das on 02/02/25.
//

import Foundation

extension String {

  /// Check if the string is empty
  public func isEmptyOrWhitespace(_ text: String) -> Bool {
    return text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
  }

  /// Check if String Contains Only Digits
  public func containsOnlyDigits(_ text: String) -> Bool {
    let digitSet = CharacterSet.decimalDigits
    return text.rangeOfCharacter(from: digitSet.inverted) == nil
  }

  /// Check if String Contains Uppercase Letters
  public func containsUppercase(_ text: String) -> Bool {
    let uppercaseCharacterSet = CharacterSet.uppercaseLetters
    return text.rangeOfCharacter(from: uppercaseCharacterSet) != nil
  }

  /// Check if String Contains Lowercase Letters
  public func containsLowercase(_ text: String) -> Bool {
    let lowercaseCharacterSet = CharacterSet.lowercaseLetters
    return text.rangeOfCharacter(from: lowercaseCharacterSet) != nil
  }

  /// Check if String Contains Special Characters
  public func containsSpecialCharacters(_ text: String) -> Bool {
      let specialCharacterSet = CharacterSet.punctuationCharacters
      return text.rangeOfCharacter(from: specialCharacterSet) != nil
  }

  /// Trim Whitespace from Both Ends of String
  public func trimWhitespace(_ text: String) -> String {
    return text.trimmingCharacters(in: .whitespacesAndNewlines)
  }
}
