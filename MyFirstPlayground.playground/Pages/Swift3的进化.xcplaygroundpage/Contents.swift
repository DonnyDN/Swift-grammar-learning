//: [Previous](@previous)

import UIKit
import PlaygroundSupport

/**弃用++ --
  :++ --使程序可读性差，Python里也没有
 */
var a = 3
//a++ a--
a += 1
a -= 1

/**弃用C风格for循环，创建灵活的for循环--------*/
for i in (1...10).reversed() {//倒序
    print(i)
}

for i in stride(from: 0, to: 10, by: 2) {//步长为2，[0,10）
    print("to \(i)")
}
for i in stride(from: 0, through: 10, by: 2) {//步长为2，[0,10]
    print("through \(i)")
}
for i in stride(from: 10, to: 0, by: -2) {//[10,0)
    print("倒序 \(i)")
}
for i in stride(from: 0.5, to: 0, by: -0.1) {//也可是小数
    print("小数 \(i)")
}

/**元组的变化-元组可以比较大小*/
let score1 = (chinese:90, math:95)
let score2 = (chinese:100, math:100)
let score3 = (chinese:100, math:100)

//从第一个维度开始向后依次比较大小
score1 < score2
score1 < score3

//当然重载运算符可以改变这个规则,在swift中运算符的本质是函数
func <(t1:(Int,Int), t2:(Int,Int)) -> Bool {
    if t1.1 != t2.1 {
        return t1.1 < t2.1
    }
    return t1.0 < t2.0
}

score2 < score3
/** #selector */
//Swift2
//button.addTarget(self, action: "click",          for: .touchUpInside)
//Swift3
//button.addTarget(self, action: #selector(click), for: .touchUpInside)


/**函数参数必须加括号表示*/
//(Int)->(Int)->Int
//((Int)->Int)->Int

//(Int,Int) -> Int
//((Int,Int)) ->Int 参数是个元组


/**尾缀 -ed 表示过去式， -ing表示名词：有返回值，不影响原对象*/
//没有这些尾缀，则为动作，直接作用于原对象
var scores = [98,73,45,67]

//enumerate遍历
for scoreInfo in scores.enumerated(){
    print(scoreInfo)
}
scores
scores.sorted()

scores
scores.sort() //Void sort() 无返回，会改变本身
scores

scores.sorted(by: >)
scores.sort(by: >)//无返回，会改变本身

var arr = [0,1,2,3,4]
arr.reversed()//倒序
arr.reverse()
for i in arr.reversed() {
    print(i)
}
//这种写法 可以打印出对应序号，和内容
for (index,item) in arr.reversed().enumerated() {
    print(index, item)
}

/**where的变化*/
let vector = (4,0)
if case (let x, 0) = vector , x>2 && x<5{
    print("It's the vector")
}

func doMath(a: Int?, b:Int?, c:Int?) -> Int? {
    
    //guard可以解包，同时用bool表达式确认参数的值时合法的，但是苹果不建议写在一起
//    guard
//        let a = a , a > 0,
//        let b = b, b <= 0,
//        let c = c, c%2 == 0 else{
//            return nil
//    }
    
    guard
        let a = a, let b = b, let c = c,
        a > 0 , b <= 0, c%2 == 0 else {
        return nil
    }
    
    return 0
}

//寻找相同的元素
func anyCommonElements<T: Sequence, U: Sequence>(lhs: T, _ rhs: U) -> Bool
    where
    T.Iterator.Element: Equatable,//T序列的元素类型需要遵守Equatable协议（可作相等比较）
    T.Iterator.Element == U.Iterator.Element//T序列的元素类型和U的事一致的
{
    return true
}

anyCommonElements(lhs: [2,3], [2,4])

/**函数变化*/
class View: UIView{
    override func draw(_ rect: CGRect) {
        self.backgroundColor = UIColor.yellow
        
        guard let context = UIGraphicsGetCurrentContext() else {
            print("Error")
            return
        }
        
        //swift2:
        //CGContextSetStrokeColorWithColor(context, UIColor.redColor().CGColor)
        context.setStrokeColor(UIColor.red.cgColor)
        
        let strokeWidth: CGFloat = 3.0
        //swift2:
        //CGContextSetLineWidth(context, strokeWidth)
        context.setLineWidth(strokeWidth)
        
        //swift2:
        //let center = CGPointMake(self.frame.midX, self.frame.midY)
        let center = CGPoint(x: self.frame.midX, y: self.frame.midY)
        let radius = self.frame.midX - strokeWidth
        let startAngle: CGFloat = 0.0
        //swift2: let endAngle = CGFloat(2 * M_PI)
        let endAngle = 2 * CGFloat.pi
        //swift2:
        //CGContextAddArc(context, center.x, center.y, radius, startAngle, endAngle, 0)
        context.addArc(center: center,
                       radius: radius,
                       startAngle: startAngle,
                       endAngle: endAngle,
                       clockwise: false)
        
        //swift2: CGContextDrawPath(context, kCGPathStroke)
        context.drawPath(using: .stroke)
        
    }
}
let view = View(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
PlaygroundPage.current.liveView = view

/**GCD*/
// old way, Swift 2
//let queue = dispatch_queue_create("com.test.myqueue", nil)
//dispatch_async(queue) {
//    print("Hello World")
//}

let queue = DispatchQueue(label: "com.test.myqueue")
queue.async {
    print(Thread.current)//子线程
}

// 一些NS前缀的类进行了重新编写

//swift2:
//NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

//swift2: NSBundle.mainBundle()
Bundle.main

//swift2: NSJSONSerialization.JSONObjectWithData(data, options: [])
//swift3: JSONSerialization.jsonObject(with: data, options: [])


/** Never */
//正常情况下此函数有返回值，但是该返回值永远不会返回
func myFatalError() -> Never{
    print("!!!!!")
    fatalError()
}

func mod(_ a:Int , _ b: Int) -> Int{
    
    guard b != 0 else{
        myFatalError()//在此需要（break，return）跳出当前作用域
    }
    
    return a%b
}

//mod(10,0)

/**隐式可选型*/
//Int! 可以承载一个nil，但通常不该是个nil，尽管如此很多情况下仍是个nil
let aa: Int! = 5
let b = aa //b是Int?型,使用时需要解包
let c: Int = aa//c是Int型，确定了aa是有值的
let d = aa + 0//d是Int型，确定了aa是有值的


/** keyPath */
//通过keyPath的方式获得一个对象的value
let superviewColor = #keyPath(UIView.superview.backgroundColor)

let view1 = UIView(frame:CGRect(x: 0, y: 0, width: 100, height: 100))
let label = UILabel(frame:CGRect(x:0, y:0, width:10, height:10))
view1.backgroundColor = UIColor.blue
view1.addSubview(label)

label.value(forKeyPath: superviewColor)
label.superview?.backgroundColor


/** FloatingPoint协议：遵循此协议即为浮点数 */
func hypotenuse<T: FloatingPoint>(_ a: T, _ b: T) -> T {
    return (a*a + b*b).squareRoot()
}
//这样函数的a，b参数就可以是任意浮点数了（Float,CGFloat,Double..）


/** 不再用M_PI，用CGFloat.pi */
let alpha: Float = 2.0
alpha * Float.pi
alpha * .pi//Swift会自动识别类型

/** .infinity无穷大 */
func findMin<T: FloatingPoint>(values: [T]) -> T? {
    
    guard values.count > 0  else { return nil }
    
    var res = T.infinity//T元素是个无穷大的数
    for v in values {
        //遍历values数组中的值，比较其与外部res变量的大小，每次留下小的那个赋给res
        res = v < res ? v : res
    }
    
    return res
}

/** NaN (Not a Number)*/
let myNaN = Double.nan //myNaN不是一个数字，虽然定义在基本数据类型上
let myNaN2 = CGFloat.nan

func divide<T: FloatingPoint>(_ a: T, _ b: T) -> T {
    if b.isZero {//如果b为0，就需要返回T.nan(Not a Number)
        return T.nan
    }
    return a/b
}

let temperatureData = ["21.2","14.4","27","no data","33","no data","22"]
let tempsCelsius = temperatureData.map{Double($0) ?? .nan}
let validTemps = tempsCelsius.filter{ !$0.isNaN }

/** 只对整数可以求余操作 */

//3.4%1.2 错误

/** @autoclosure */
print("=========================")
func login(username:String, password:String) -> String? {
    //复杂的登录逻辑
    print("login..")
    return username
}

func generateNickName() -> String {
    //服务器复杂的随机生成昵称逻辑
    print("generate..")
    return "DNCoder"
}

//这种正常的情况，login函数返回了值后，就不会执行generateNickName函数
let screenname = login(username: "DN", password: "123456") ?? generateNickName()

infix operator ???
//()->T函数，无參有返回，作为参数，只有被调用的时候才会执行
//defaultValue: @autoclosure ()->T 如果写为 defaultValue: T 的话，普通表达式在作为参数传入的时候，会马上被执行，然后将执行的结果作为参数传递给函数，作为参数的函数都被执行了一遍，造成资源浪费
//@autoclosure修饰的函数是可以被自动转换的，值可以转为闭包的形式。使用 @autoclosure 标记的参数，虽然我们传入的也是一个表达式，但这个表达式不会马上被执行，而是要由调用的函数内来决定它具体执行的时间。
func ???<T>(optional: T? , defaultValue: @autoclosure ()->T) -> T {
    if let value = optional {
        return value
    }
    return defaultValue()
}
print("=========================")

let screenname1 = login(username: "DN", password: "123456") ??? generateNickName()
//"Guest" 自动转化为闭包：{return "Guest"}
let screenname2 = login(username: "DN", password: "123456") ??? "Guest"





