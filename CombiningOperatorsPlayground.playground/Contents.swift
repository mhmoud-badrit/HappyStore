//: Playground - noun: a place where people can play

import UIKit
import RxSwift

//concat
let helloObservable = Observable.of("Hello ")
let worldObservable = Observable.of("World")

Observable.concat([helloObservable,worldObservable]).subscribe(onNext : {
    print($0)
})

 //
