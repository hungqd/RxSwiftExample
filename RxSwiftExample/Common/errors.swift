//
//  errors.swift
//  Observable
//
//  Created by Đặng Quang Hưng on 4/4/19.
//  Copyright © 2019 Đặng Quang Hưng. All rights reserved.
//

import Foundation

class CustomError: Error {
}

extension CustomError: LocalizedError {
    var errorDescription: String? {
        return NSLocalizedString("Custom error", comment: "")
    }
}
