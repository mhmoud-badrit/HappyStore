//: Playground - noun: a place where people can play

import UIKit
import RxSwift

print("------------- Filter Operators -------------")

//filter , skip , take
let observable = Observable.range(start: 0, count: 100)
observable.filter { $0 > 50 }.take(10).skip(5).subscribe(onNext : {
        print($0)
    })

//skipWhile , skipUntil
//takeWhile , takeUntil



print("--------------------------")
//distinctUntilChanged() , distinctUntilChanged(_:)
let observable2 = Observable.of(1,2,3,3,3,3,4,4,5,6,7,7,8)
observable2.distinctUntilChanged().subscribe(onNext : {
    print($0)
})
