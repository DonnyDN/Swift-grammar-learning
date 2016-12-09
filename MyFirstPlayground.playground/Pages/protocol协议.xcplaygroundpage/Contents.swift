//: [Previous](@previous)

import UIKit

//若只要类class遵守 - protocol Pet: class{

protocol Pet{
    //协议里的变量只能用var
    var name: String {get set}
    var birthPlace: String {get}
    
    func playWith()
    func fed(food: String)
    
    //若用结构体实现此方法，需要mutating修饰，需要改变结构体自身;
    //对于类class而言，没有mutating
    mutating func changeName(newName: String)
}

struct Dog: Pet{
    
    var name: String = "Puppy"
    
    //虽然protocol中是{get}只读的，这里也可以定义为var（可以理解为birthPlace遵从了协议只读，同时多加了一些实现，让它也可以写）。原来协议中的{get}仍是有意义的！如下aPet..
    var birthPlace: String = "Beijing"
    
    func playWith() {
        print("🐶")
    }
    
    func fed(food: String = "Bone") {
        
        if food == "Bone" {
            print("Happy")
        }
        else{
            print("I was a bone")
        }
    }
    
    mutating func changeName(newName: String) {
        name = newName
    }
}

var myDog: Dog = Dog()
myDog.birthPlace = "Shanghai"
var aPet: Pet = myDog//协议可作为一个类型，这里aPet指向myDog
//如下会报错，aPet.birthPlace在协议中定义为{get}只读
//aPet.birthPlace = "Hangzhou"
//理论上myDog和aPet指向的内存是一样的，但是他们声明的类型不一样

















