//: Playground - noun: a place where people can play

import UIKit
import RxSwift


    //create an observable that contains one element
    let observable1 = Observable.just("Hello")
    //create an observable from another sequence
    let observable2 = Observable.from([1,2,3,4,5])
    //create observable from elements
    let observable3 = Observable.of("Ahmed","Osama","Ali")
    //create observable from range
    let observable4 = Observable.range(start: 1, count: 20)
    

observable1.subscribe{ event in
        print(event)
    }

print("----------------------------------")

observable2.subscribe { event in
    print(event)
    
}

print("----------------------------------")

observable3.subscribe(onNext : { element in
    print(element)
}, onCompleted : {
    print("Completed")
})

print("----------------------------------")

let subscription = observable4.subscribe(onNext: { element in
    print(element)
}
    , onCompleted: {
        print("Range Completed")
    
}, onDisposed: {
    print("Disposed")
})

subscription.dispose()//deallocate the resources



