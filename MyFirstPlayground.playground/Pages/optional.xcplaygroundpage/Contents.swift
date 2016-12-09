//: [Previous](@previous)

import Foundation

//---------------------------可选型(Optionals)-----------------------------
//这样不初始化，会报错！Swift中没有被初始化的值，不能被使用
var a1:Int = 2
print(a1,terminator:"")

//加问号，可选值，可为nil
var optional:String?
var optional2:String?
//以下会报错，强制类型转换要求是一个确定值，不能是可选值
//Int(optional)

optional = "1"
optional
//加“!”说明已确保有值,称为解包(unwrap)。
//不加!的话，会打印出optional提示此值是可选值
print(optional!)

optional2 = "233"

if let opti = optional, let optional2 = optional2 ,optional2 == "233"{
    "对optional解包，optional非空才进入此if语句"
}


var age1 = Int(optional!)//右面打印空，说明Int()返回的是可选值

if (age1 != nil){
    // \(变量名) 插值打印
    print("your age is \(age1!)")
    print("your age is " + String(describing: age1))
}




var errorMess : String? = "Not Found"
if let error = errorMess{
    error.uppercased()
}else{
    "No Error"
}
//?的作用：尝试在此判断errorMess是否为空，若为空在此停止，非空继续执行，与if let一样
errorMess?.uppercased()

errorMess!.uppercased()//不安全，若errorMess为nil

if let errorM = errorMess?.uppercased() {
    errorM
}

let message = errorMess == nil ? "No Error" : errorMess
//三目运算就相当于,更简洁（若errorMess为nil，设置个默认值）
let message1 = errorMess ?? "No Error"




var error1 : (errorCode: Int , errorMesage: String)? = (404 , "Not Found")
error1 = nil

//age是个可选型
var ageInput: String = "2"
var age = Int(ageInput)

if let age = Int(ageInput) , age < 20 {
    print("teenager")
}

//  2..<4  前闭后开
var string1 = "hello"
string1.range(of: "e")

//-------------------隐式可选型------------------------
//可以暂时为空nil，当真正使用时，又可以非空
var message2: String! = nil
message2 = "Not Found"
"Tht Message is " + message2
