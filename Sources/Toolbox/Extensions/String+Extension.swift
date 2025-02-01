//
//  String+Extension.swift
//  Toolbox
//
//  Created by Sambit Das on 02/02/25.
//

import Foundation

extension String {

  /// Check if the string is empty
  public func isEmptyOrWhitespace() -> Bool {
    return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
  }

  /// Check if String Contains Only Digits
  public func containsOnlyDigits() -> Bool {
    let digitSet = CharacterSet.decimalDigits
    return self.rangeOfCharacter(from: digitSet.inverted) == nil
  }

  /// Check if String Contains Uppercase Letters
  public func containsUppercase() -> Bool {
    let uppercaseCharacterSet = CharacterSet.uppercaseLetters
    return self.rangeOfCharacter(from: uppercaseCharacterSet) != nil
  }

  /// Check if String Contains Lowercase Letters
  public func containsLowercase() -> Bool {
    let lowercaseCharacterSet = CharacterSet.lowercaseLetters
    return self.rangeOfCharacter(from: lowercaseCharacterSet) != nil
  }

  /// Check if String Contains Special Characters
  public func containsSpecialCharacters() -> Bool {
      let specialCharacterSet = CharacterSet.punctuationCharacters
      return self.rangeOfCharacter(from: specialCharacterSet) != nil
  }
}
