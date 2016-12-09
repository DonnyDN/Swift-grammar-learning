//: [Previous](@previous)

import Foundation

//----------------泛型函数---------------------------
//以下函数可以交换两个Int型变量，若要交换两个Double类型的呢，得另写一个函数了，用泛型（通用类型）可以解决
func swapTwoInts(_ a:inout Int , _ b: inout Int){//函数功能值互换
    //    let t:Int = a
    //    a = b
    //    b = t
    (a,b) = (b,a)//元组写法，一步实现值互换
}
var x:Int = 1
var y:Int = 2
swapTwoInts(&x, &y)
x
y

//<>里是一个通用类型，一般表示为T(template),也可以随便定义
func swapTwoThings<T>(_ a: inout T , _ b: inout T){
    (a,b) = (b,a)//元组写法，一步实现值互换
}

var hello = "hello"
var bye   = "bye"
swapTwoThings(&hello, &bye)
hello
bye

//----------------泛型类型---------------------------
let arr:Array<Int> = Array<Int>()
let dict = Dictionary<String,Int>()
let set = Set<Float>()

struct Stack<T>{
    //此结构体内部只有一个items数组，数组可空，故var s = Stack<Int>()不用给数组赋值；
    var items = [T]()
    
    func isEmpty() -> Bool {
        return items.count == 0
    }
    
    mutating func push(_ item: T) {
        items.append(item)
    }
    
    mutating func pop() -> T?{
        guard !self.isEmpty() else {
            return nil
        }
        return items.removeLast()
    }
}

var s = Stack<Int>()
s.push(1)
s.push(2)
s.pop()

//扩展结构体Stack
extension Stack{
    func top() -> T? {//可以直接使用T类型
        return items.last
    }
}
//结构体Stack的存储类型是泛型
var s1 = Stack<String>()
s1.top()

//----------------多个泛型类型---------------------------

struct Pair<T1, T2>{
    //此结构体和上面Stack不同，此结构的俩变量需要实例化，不像数组可空
    var a: T1
    var b: T2
}

var pair = Pair<Int, String>(a:0, b:"Hello")
pair








