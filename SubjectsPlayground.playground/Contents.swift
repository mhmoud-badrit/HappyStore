//: Playground - noun: a place where people can play

import UIKit
import RxSwift


print("------------- PublishSubject -------------")
//PublishSubject: Starts empty and only emits new elements to subscribers.
let publishSubject = PublishSubject<String>()

publishSubject.subscribe(onNext :{ element in
    print(element)
})

publishSubject.onNext("Hellooooooooo")
publishSubject.on(.next("World"))

publishSubject.subscribe(onNext :{ element in
    print(element)
}, onCompleted : {
    print("Completeeeeeeeeed")
})

publishSubject.onNext("Helllloooooo again")

publishSubject.onCompleted()



print("------------- BehaviorSubject -------------")
//BehaviorSubject: Starts with an initial value and replays it or the latest element to new subscribers.

let behaviorSubject = BehaviorSubject(value: "One")

behaviorSubject.subscribe(onNext : { element in
    print(element)
})

behaviorSubject.onNext("Two")

behaviorSubject.subscribe(onNext : { element in
    print(element)
})

behaviorSubject.subscribe(onNext : { element in
    print(element)
})

behaviorSubject.onNext("Three")


print("------------- ReplaySubject -------------")
//Replay subjects will temporarily cache, or buffer, the latest elements they emit, up to a
//specified size of your choosing. They will then replay that buffer to new subscribers.

let replaySubject = ReplaySubject<String>.create(bufferSize: 10)

replaySubject.subscribe(onNext :{ element in
    print("First Subscriber : " + element)
})

replaySubject.onNext("Clothes")
replaySubject.onNext("Toys")

replaySubject.subscribe( onNext :{ element in
    print("Second Subscriber : " + element)
})

replaySubject.onNext("Electronics")


print("------------- Variable -------------")
//Wrap BehsviorSubject but not throw complete or error events

let variable = Variable("Hello")

variable.asObservable().subscribe (onNext: { element in
    print(element)
})

variable.value = "Hello World"


