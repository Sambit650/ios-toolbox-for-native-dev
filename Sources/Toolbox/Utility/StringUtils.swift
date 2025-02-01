//
//  StringUtils.swift
//  Toolbox
//
//  Created by Sambit Das on 02/02/25.
//

import Foundation

public struct StringUtils {

  /// Trim Whitespace from Both Ends of String
  public func trimWhitespace(_ text: String) -> String {
    return text.trimmingCharacters(in: .whitespacesAndNewlines)
  }
}
