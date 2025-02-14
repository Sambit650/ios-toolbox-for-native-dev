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

  @Test("formatted", arguments: [
    ("2025/02/02", "02 Feb 2025"),
    ("2025/12/25", "25 Dec 2025")
  ])
  func test_formateDateDDMMYYYY(input: (dateString: String, expected: String)) async throws {
    // Given
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy/MM/dd"
    let date = dateFormatter.date(from: input.dateString)!

    // When: We format the date using the formateDateDDMMYYYY method
    let expectedFormat = "dd MMM yyyy"
    let formattedDate = date.formatted(expectedFormat)

    // Then
    #expect(formattedDate == input.expected)
  }

  @Test("adding", arguments: [
    ((dateString: "2025/02/10", component: Calendar.Component.day, value: 5), "2025/02/15"),
    ((dateString: "2025/12/25", component: Calendar.Component.month, value: -1), "2025/11/25")
  ])
  func test_addingDateComponent(input: ((dateString: String, component: Calendar.Component, value: Int), expected: String)) async throws {
    // Given
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy/MM/dd"
    let date = dateFormatter.date(from: input.0.dateString)!

    // When: We add/subtract the component
    let modifiedDate = date.adding(input.0.component, value: input.0.value)
    let formattedModifiedDate = dateFormatter.string(from: modifiedDate)

    // Then
    #expect(formattedModifiedDate == input.1)
  }

  @Test("dayOfWeek", arguments: [
    ("2025/02/17", "Monday"),
    ("2025/02/18", "Tuesday"),
    ("2025/12/25", "Thursday")
  ])
  func test_dayOfWeek(input: (dateString: String, expected: String)) async throws {
    // Given
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy/MM/dd"
    let date = dateFormatter.date(from: input.dateString)!

    // When: We get the weekday name
    let weekday = date.dayOfWeek()

    // Then
    #expect(weekday == input.expected)
  }
}

extension DateExtensionTests {

  @Test("startOfDay", arguments: [
    ("2025/02/15 14:30:00", "2025/02/15 00:00:00"),
    ("2025/12/25 23:59:59", "2025/12/25 00:00:00")
  ])
  func test_startOfDay(input: (dateString: String, expected: String)) async throws {
    // Given
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
    let date = formatter.date(from: input.dateString)!

    // When
    let start = date.startOfDay
    let formattedStart = formatter.string(from: start)

    // Then
    #expect(formattedStart == input.expected)
  }

  @Test("endOfDay", arguments: [
    ("2025/02/15 10:00:00", "2025/02/15 23:59:59"),
    ("2025/12/25 00:00:00", "2025/12/25 23:59:59")
  ])
  func test_endOfDay(input: (dateString: String, expected: String)) async throws {
    // Given
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
    let date = formatter.date(from: input.dateString)!

    // When
    let end = date.endOfDay
    let formattedEnd = formatter.string(from: end)

    // Then
    #expect(formattedEnd == input.expected)
  }

  @Test("isToday", arguments: [
    (0, true),    // Today
    (-1, false),  // Yesterday
    (1, false)    // Tomorrow
  ])
  func test_isToday(input: (offset: Int, expected: Bool)) async throws {
    // Given
    let date = Calendar.current.date(byAdding: .day, value: input.offset, to: Date())!

    // When
    let result = date.isToday

    // Then
    #expect(result == input.expected)
  }

  @Test("isYesterday", arguments: [
    (-1, true),   // Yesterday
    (0, false),   // Today
    (1, false)    // Tomorrow
  ])
  func test_isYesterday(input: (offset: Int, expected: Bool)) async throws {
    // Given
    let date = Calendar.current.date(byAdding: .day, value: input.offset, to: Date())!

    // When
    let result = date.isYesterday

    // Then
    #expect(result == input.expected)
  }

  @Test("isTomorrow", arguments: [
    (1, true),    // Tomorrow
    (0, false),   // Today
    (-1, false)   // Yesterday
  ])
  func test_isTomorrow(input: (offset: Int, expected: Bool)) async throws {
    // Given
    let date = Calendar.current.date(byAdding: .day, value: input.offset, to: Date())!

    // When
    let result = date.isTomorrow

    // Then
    #expect(result == input.expected)
  }
}
