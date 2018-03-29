//: Playground - noun: a place where people can play

import UIKit
import RxSwift

let observable = Observable.range(start: 0, count: 100)

//map will execute on background thread and onNext will be on main thread
observable.observeOn(ConcurrentDispatchQueueScheduler.init(qos: .background))
    .subscribeOn(MainScheduler.instance)
observable.map{ $0 + 100 }.subscribe(onNext : { print($0) })

