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

    // WHEN
    let result = StringUtils.trimWhitespace(input.text)

    // THEN
    #expect(result == input.expected)
  }

  @Test("removingWhitespaces", arguments: [
    (" 4345 ", "4345"),
    (" 000", "000"),
    ("test123 ", "test123")
  ])
  func test_removingWhitespaces(input: (text: String, expected: String)) async throws {

    // WHEN
    let result = StringUtils.removingWhitespaces(from: input.text)

    // THEN
    #expect(result == input.expected)
  }

  @Test("removingCharacters", arguments: [
    ("He11o W0r1d!", "\\d", "Heo Wrd!"),
    ("Hello@# World!", "[^a-zA-Z0-9 ]", "Hello World"),
    (" H e l l o ", "\\s", "Hello")
  ])
  func test_removingCharacters(input: (text: String, pattern: String, expected: String)) async throws {

    // WHEN
    let result = StringUtils.removingCharacters(from: input.text, matching: input.pattern)

    // THEN
    #expect(result == input.expected)
  }
}
