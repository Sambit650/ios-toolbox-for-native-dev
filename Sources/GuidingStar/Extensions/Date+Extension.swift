//
//  File.swift
//  
//
//  Created by Sambit Das on 18/10/23.
//

import Foundation

extension Date {

  func formateDateDDMMYYYY() -> String {
    let date = self
    let formatter = DateFormatter()
    formatter.dateFormat = "dd MMM yyyy"
    let currentDate = formatter.string(from: date)
    return currentDate
  }
}
