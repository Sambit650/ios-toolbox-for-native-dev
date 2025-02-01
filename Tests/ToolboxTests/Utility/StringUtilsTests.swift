//
//  StringUtilsTests.swift
//  Toolbox
//
//  Created by Sambit Das on 02/02/25.
//

import Testing

@testable import Toolbox

@MainActor
struct StringUtilsTests {

  @Test("trimWhitespace", arguments: [
    (" 4345 ", "4345"),
    (" 000", "000"),
    ("test123 ", "test123")
  ])
  func test_trimWhitespace(input: (text: String, expected: String)) async throws {
    // GIVEN
    let utils = StringUtils()

    // WHEN
    let isContainsOnlyDigits = utils.trimWhitespace(input.text)

    // THEN
    #expect(isContainsOnlyDigits == input.expected)
  }
}
