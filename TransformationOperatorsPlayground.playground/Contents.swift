//: Playground - noun: a place where people can play

import UIKit
import RxSwift

struct Employee {
    var  salary  = BehaviorSubject<Double>(value : 6000)
    var name : String = ""
}

let salariesObservable = Observable.of(100,200,300,400);

//map
//salariesObservable.map{ $0 + $0/15 }.subscribe(onNext : { print($0) })

//flatMap
//let employeesPublishSubject =  PublishSubject<Employee>()
//employeesPublishSubject.flatMap { $0.salary }.subscribe ( onNext : { print($0) })
//
//let employee1 = Employee(salary : BehaviorSubject(value : 5000), name : "Employee 1")
//let employee2 = Employee(salary : BehaviorSubject(value : 8000), name : "Employee 2")
//
//
//employeesPublishSubject.onNext(employee1)
//employeesPublishSubject.onNext(employee2)
//
//employee1.salary.onNext(6000)


//flatMapLatest

let employeesPublishSubject =  PublishSubject<Employee>()
employeesPublishSubject.flatMapLatest { $0.salary }.subscribe ( onNext : { print($0) })

let employee1 = Employee(salary : BehaviorSubject(value : 5000), name : "Employee 1")
var employee2 = Employee(salary : BehaviorSubject(value : 8000), name : "Employee 2")


employeesPublishSubject.onNext(employee1)
employeesPublishSubject.onNext(employee2)

employee1.salary.onNext(6000)
employee2.salary.onNext(6000)
