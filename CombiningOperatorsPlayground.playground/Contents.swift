//: Playground - noun: a place where people can play

import UIKit
import RxSwift

print("----------- concat ----------")
//concat
let helloObservable = Observable.of("Hello " , "dfddfff")
let worldObservable = Observable.of("World" , "sddsddsd" , "/dedeee")

Observable.concat([helloObservable,worldObservable]).subscribe(onNext : {
    print($0)
})


print("----------- merge ----------")
//merge

let observable1 = Observable.of(1,3,5,7,9)
let observable2 = Observable.of(0,2,4,6,9,10)

Observable.of(observable1,observable2)
.merge()
    .subscribe(onNext : {
        print($0)
    })


print("----------- concatMap ----------")
//concatMap
let sequences = [
    "Cars": Observable.of("BMW ", "Ford", "Toyota"),
    "Phones": Observable.of("S8", "iPhone X", "LG G5" , "Galaxy Note8")
]

let observable = Observable.of("Cars", "Phones")
    .concatMap { item in sequences[item] ?? .empty() }

_ = observable.subscribe(onNext: { string in
    print(string)
})

print("----------- zip ----------")
let observable11 = Observable.of(1,3,5,7,9)
let observable22 = Observable.of(0,2,4,6,8,10)

Observable.zip(observable11,observable22)
    .subscribe(onNext : {
         print($0)
    })

print("----------- combineLatest ----------")

let publishSubject1 = PublishSubject<Int>()
let publishSubject2 = PublishSubject<Int>()
Observable.combineLatest(publishSubject1,publishSubject2) { left , right in
    left + right
    }.subscribe(onNext : {
        print($0)
    })

publishSubject1.onNext(200)
publishSubject2.onNext(300)
publishSubject1.onNext(90)
publishSubject1.onNext(1000)


