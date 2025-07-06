//
//  StringUtils.swift
//  Toolbox
//
//  Created by Sambit Das on 02/02/25.
//

import Foundation

public struct StringUtils {

  /// Removes all spaces from the input string.
  public static func removingWhitespaces(from text: String) -> String {
    text.replacingOccurrences(of: " ", with: "")
  }

  /// Trims whitespace and newlines from both ends of the input string.
  public static func trimWhitespace(_ text: String) -> String {
    text.trimmingCharacters(in: .whitespacesAndNewlines)
  }

  /// Removes characters matching a regex pattern from the input string.
  /// - Parameters:
  ///   - text: The input string.
  ///   - pattern: Regex pattern of characters to remove.
  public static func removingCharacters(from text: String, matching pattern: String) -> String {
    return text.replacingOccurrences(of: pattern, with: "", options: .regularExpression)
  }
}
