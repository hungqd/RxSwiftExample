//
//  main.swift
//  RxSwiftExample
//
//  Created by Đặng Quang Hưng on 4/4/19.
//  Copyright © 2019 Đặng Quang Hưng. All rights reserved.
//

import Foundation
import RxSwift

_ = Single.just(Int.random(in: 1...100)).subscribe { print($0) }

_ = Single<Int>.error(CustomError()).subscribe { print($0) }
