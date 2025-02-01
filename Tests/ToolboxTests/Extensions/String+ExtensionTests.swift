//
//  String+ExtensionTests.swift
//  Toolbox
//
//  Created by Sambit Das on 02/02/25.
//

import Foundation
import Testing

@testable import Toolbox

@MainActor
struct StringExtensionTests {

  @Test("isEmptyOrWhitespace", arguments: [
    ("", true),
    (" ", true),
    ("test", false)
  ])
  func test_isEmptyOrWhitespace(input: (text: String, expected: Bool)) async throws {
    let isEmptyOrWhitespace = input.text.isEmptyOrWhitespace()

    #expect(isEmptyOrWhitespace == input.expected)
  }

  @Test("containsOnlyDigits", arguments: [
    ("4345", true),
    ("000", true),
    ("test123", false)
  ])
  func test_containsOnlyDigits(input: (text: String, expected: Bool)) async throws {
    let isContainsOnlyDigits = input.text.containsOnlyDigits()

    #expect(isContainsOnlyDigits == input.expected)
  }

  @Test("containsUppercase", arguments: [
    ("TEST", true),
    ("TEST123", true),
    ("test", false)
  ])
  func test_containsUppercase(input: (text: String, expected: Bool)) async throws {
    let isContainsUppercase = input.text.containsUppercase()

    #expect(isContainsUppercase == input.expected)
  }

  @Test("containsLowercase", arguments: [
    ("test", true),
    ("test123", true),
    ("T", false),
    ("TEST", false)
  ])
  func test_containsLowercase(input: (text: String, expected: Bool)) async throws {
    let isContainsLowercase = input.text.containsLowercase()

    #expect(isContainsLowercase == input.expected)
  }

  @Test("containsSpecialCharacters", arguments: [
    ("!23@", true),
    ("@@@", true),
    ("test", false)
  ])
  func test_containsSpecialCharacters(input: (text: String, expected: Bool)) async throws {
    let isContainsSpecialCharacters = input.text.containsSpecialCharacters()

    #expect(isContainsSpecialCharacters == input.expected)
  }
}
