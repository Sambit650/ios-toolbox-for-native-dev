//
//  Date+ExtensionTests.swift
//  Toolbox
//
//  Created by Sambit Das on 02/02/25.
//

import Foundation
import Testing

@testable import Toolbox

@MainActor
struct DateExtensionTests {

  @Test("formateDateDDMMYYYY", arguments: [
    ("2025/02/02", "02 Feb 2025"),
    ("2025/12/25", "25 Dec 2025")
  ])
  func test_formateDateDDMMYYYY(input: (dateString: String, expected: String)) async throws {
    // Given
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy/MM/dd"
    let date = dateFormatter.date(from: input.dateString)!

    // When: We format the date using the formateDateDDMMYYYY method
    let formattedDate = date.formateDateDDMMYYYY()

    // Then
    #expect(formattedDate == input.expected)
  }
}
