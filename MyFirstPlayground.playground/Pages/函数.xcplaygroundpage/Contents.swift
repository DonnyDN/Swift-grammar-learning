//: [Previous](@previous)

import Foundation

//（无返回值）Void是一个类型------------------------
func printhello() ->Void{
    
}
func printhello1() ->(){
    
}
//（有返回值）->String 是返回值------------------------
func sayHello(name: String?) ->String{
    return "Hello " + (name ?? "Guest")
}

var nickName:String? = nil
sayHello(name:nickName)

//（有返回，返回元组，含多个值）------------------------
func findMaxAndMin( numbers:[Int] ) ->(max:Int, min:Int)?{
    //防止numbers数组为空，返回的元组也应该是可选型
    //法1
    if numbers.isEmpty {
        return nil;
    }
    //法2 guard保卫，否则执行代码
    guard numbers.count > 0 else {
        return nil
    }
    
    var max = numbers[0]
    var min = numbers[0]
    for number in numbers {
        min = min < number ? min : number
        max = max > number ? max : number
    }
    
    return(max , min)
}

var scores:[Int]? = [12,4,5,14,5]//此数组若从网络获取，也可能为nil，故需可选型处理
scores = scores ?? []//若数组nil，则定义为空数组（nil和空数组甄别）
//返回的元组可选型，故需要解包(在这里是！强制解包，因为上面scores = scores ?? []确保数组不为nil)
//强制解包是不安全的，但是可被控制的
if let result = findMaxAndMin(numbers: scores!){
    result.0
    result.1
    result.max
    result.min
}

//（有返回，多参数）------------------------
func sayHelloTo(name:String , greeting:String) ->String{
    return "\(greeting),\(name)!"
}
sayHelloTo(name: "DNCoder", greeting: "Hello")

//外部参数名
func sayHelloTo1(of name:String , WithGreetingWord greeting:String) ->String{
    return "\(greeting),\(name)"
}
sayHelloTo1(of: "DNCoder", WithGreetingWord: "hello")

//"_"省略外部参数名()
func sayHelloTo2(_ name:String , _ greeting:String) ->String{
    return "\(greeting),\(name)"
}
sayHelloTo2("DNCoder", "hello")

//（参数设置默认值）------------------------
func sayHelloTo3(name:String , greeting:String = "Hi") ->String{
    return "\(greeting),\(name)!"
}
//调用的时候，提示有2种了，可不输入设置默认值的参数
sayHelloTo3(name: "Duning")


//（变长的参数类型）------------------------
/*
 每个函数最多只有一个变长参数类型
 */
//默认参数：separator分隔  terminator结尾
//第一个参数可以设置多个，称为变长的参数类型
print("Hello",1,2,3,separator:",",terminator:"!")
//print(<#T##items: Any...##Any#>, separator: <#T##String#>, terminator: <#T##String#>)

func mean( numbers:Double...) ->Double{
    var sum:Double = 0
    //将变长参数当做一个数组看待
    for number in numbers {
        sum += number
    }
    return sum / Double(numbers.count)
}

mean(numbers: 1,1)
mean(numbers: 1,2,3,4,5)

//（函数参数默认是let不可变类型）------------------------

func toBinary( num:Int ) -> String{//函数功能求二进制
    var num = num //需要重新创建个可变变量才行
    var res = ""
    repeat{
        res = String(num%2) + res;
        num /= 2;
    }while num != 0
    return res;
}
//以上原参数只在函数体内变化，其值没变，这也是“按值传入”copy进去的，不是引用传入，如果需要在函数内根本改变变量的值怎么办？
//关键字inout 进去还要出来
func swapTwoInts( a:inout Int , _ b: inout Int){//函数功能值互换
//    let t:Int = a
//    a = b
//    b = t
    (a,b) = (b,a)//元组写法，一步实现值互换
}
var x:Int = 1
var y:Int = 2
swapTwoInts(a: &x, &y)
x
y


//（函数作为参数传递）---------------------------
func add(a:Int , _ b: Int) -> Int{
    return a + b
}

let add2 = add
let add3:(Int , Int) ->Int = add
add2(2,3)
add3(1,2)
//----------
func hello(name: String){
    print("hello,\(name)")
}

let hello1 = hello
let hello2:(String) ->Void = hello
let hello3:(String) ->() = hello
//----------
func hi(){
    print("hi")
}
let hi1 = hi//无参数无返回都可以用（）和Void表示
let hi2:() ->() = hi
let hi3:() ->Void = hi
let hi4:(Void) ->() = hi
let hi5:(Void) -> Void = hi
//----------
//数组的arr.sort(by: <#T##(Int, Int) -> Bool#>)此方法就是把函数当做参数，实现特定功能
var arr:[Int] = []
for _ in 0..<100 {
    arr.append(Int(arc4random()%100))
}
arr
arr.sort()//数组的sort()方法自动从小到大排序,改变了自身
arr



func biggerNumFirst(a:Int , b:Int) ->Bool{
//    if a > b {
//        return true
//    }
//    return false;
    return a > b//以上逻辑可以直接写成这样
}
arr.sort(by: biggerNumFirst)

func near80(a:Int ,_ b:Int)->Bool{//离80更近
    return abs(a-80)<abs(b-80) ? true : false
}
arr.sort(by: near80)






