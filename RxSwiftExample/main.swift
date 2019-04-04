//
//  main.swift
//  RxSwiftExample
//
//  Created by Đặng Quang Hưng on 4/3/19.
//  Copyright © 2019 Đặng Quang Hưng. All rights reserved.
//

import Foundation
import RxSwift

class CustomError: Error {
}

extension CustomError: LocalizedError {
    var errorDescription: String? {
        return NSLocalizedString("Custom error", comment: "")
    }
}

_ = Observable<Int>.just(Int.random(in: 1...100)).subscribe { print($0) }

print("=============================================")

_ = Observable.from(["Dang", "Quang", "Hung"])
    .subscribe(onNext: { (value) in
        print(value)
    }, onError: { (error) in
        print("Error: \(error)")
    }, onCompleted: {
        print("Completed")
    }) {
        print("Disposed")
}

print("=============================================")

_ = Observable<Int>.create({ (observer) -> Disposable in
    for i in 1...3 {
        observer.onNext(i)
    }
    observer.onError(CustomError())
    return Disposables.create()
}).subscribe(onNext: { (value) in
    print(value)
}, onError: { (error) in
    print("Error: \(error.localizedDescription)")
}, onCompleted: {
    print("Completed")
}) {
    print("Disposed")
}

print("=============================================")

_ = Observable<Int>.create({ (observer) -> Disposable in
    for i in 1...3 {
        observer.on(.next(i))
    }
    observer.on(.completed)
    return Disposables.create()
}).subscribe(onNext: { (value) in
    print(value)
})
