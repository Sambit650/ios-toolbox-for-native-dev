//
//  Date+Extension.swift
//
//
//  Created by Sambit Das on 18/10/23.
//

import Foundation

// MARK: - Helper variables

extension Date {

  /// Gets the beginning of a day from a given date.
  public var startOfDay: Date {
    return Calendar.current.startOfDay(for: self)
  }

  /// Gets the end of a day from a given date.
  public var endOfDay: Date {
    return Calendar.current.date(byAdding: .second, value: 86399, to: startOfDay)!
  }

  /// Check If a Date is in Today
  public var isToday: Bool {
    Calendar.current.isDateInToday(self)
  }

  /// Check If a Date is in Yesterday
  public var isYesterday: Bool {
    Calendar.current.isDateInYesterday(self)
  }

  /// Check If a Date is in Tomorrow
  public var isTomorrow: Bool {
    Calendar.current.isDateInTomorrow(self)
  }
}

// MARK: - Helper Methods

extension Date {

  /// Date Formatter.
  public func formatted(_ format: String = "yyyy-MM-dd HH:mm") -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = format
    return formatter.string(from: self)
  }

  /// Easily modify dates by adding or subtracting time components.
  public func adding(_ component: Calendar.Component, value: Int) -> Date {
    return Calendar.current.date(byAdding: component, value: value, to: self) ?? self
  }

  /// Get Weekday Name from a Date // "Monday", "Tuesday", etc.
  public func dayOfWeek() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE"  // "Monday", "Tuesday", etc.
    return formatter.string(from: self)
  }
}
