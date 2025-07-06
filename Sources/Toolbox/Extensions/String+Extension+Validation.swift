//
//  String+Extension+Validation.swift
//  Toolbox
//
//  Created by Sambit Das on 06/07/25.
//

import Foundation

public extension String {

  // MARK: - Validation

  /// Checks if the string is a valid email format.
  var isValidEmail: Bool {
    let regex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
    return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
  }

  /// Validates a 10-digit phone number (basic numeric check).
  var isValidPhoneNumber: Bool {
    let regex = #"^[0-9]{10}$"#
    return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
  }

  /// Returns true if the string contains only alphanumeric characters.
  var isAlphanumeric: Bool {
    let regex = "^[a-zA-Z0-9]+$"
    return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
  }

  /// Returns true if the string contains only letters (no digits or special characters).
  var containsOnlyLetters: Bool {
    let regex = "^[A-Za-z]+$"
    return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
  }
}
