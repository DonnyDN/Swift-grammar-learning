//: [Previous](@previous)

import Foundation

//Raw Value 初始值（与Associate Value是互斥的）-----------------
enum Grade:Int{
    case A = 1
    case B = 3
    case C = 7
    case D = 11
}
enum GradeStr:String{//若枚举类型是String，不定义其他的话默认字符串就是本身
    case A = "AA"
    case B = "B"
    case C
    case D
}
func gradeCaculate(gradeValue: Grade) -> Int{
    return gradeValue.rawValue
}
if let gra = Grade(rawValue:3){
    gradeCaculate(gradeValue: gra)
}


//Associate Value 关联值 -----------------
enum ATMStatus{
    case Success(Int)//枚举关联了值，可关联多个值
    case Error(String)
    case Waiting
}

var balance = 1000
func withdraw(amount: Int) -> ATMStatus{
    if balance >= amount {
        balance -= amount
        return ATMStatus.Success(balance)//返回带参数的枚举类型
    }else{
        return .Error("Not enough money")
    }
}

let result = withdraw(amount: 1100)
switch result {
case let ATMStatus.Success(newBalance)://类似解包
    print("\(newBalance)￥ left in your account")
case let .Error(errorMessage):
    print("Error:\(errorMessage)")
case .Waiting:
    print("Waiting")
}

switch result {
case .Success:
    print("Success")
default:
    print("Error")
}


//Associate Value 关联多个值(其实是一个值，元组)----------------------------
enum Shape{
    case Square(side:Double)
    case Rectangle(width:Double, height:Double)
    case Circle(centerx:Double, centery:Double, radius:Double)
    case Point
}

let square = Shape.Square(side: 10)
let rectangle = Shape.Rectangle(width: 20, height: 30)
let circle = Shape.Circle(centerx: 0, centery: 0, radius: 15)
let point = Shape.Point

func area(shapeValue: Shape) -> Double{
    //注意shapeValue是Shape类型的某个值，所以不能shapeValue.Square这么用，因为是平级的
    switch shapeValue {
    case let .Square(side):
        return side*side
    case let .Rectangle(width, height)://参数直接传入，可不写名字
        return width*height
    case let Shape.Circle(_ , _ , r):
        return M_PI*r*r
    default:
        return 0
    }
}
area(shapeValue: square)

//-----------------可选型实质是枚举-----------------------

var age: Int? = 22
print(age)
age = nil


var age1: Optional<Int> = Optional.some(22)
print(age1)
age1 = Optional.none
age1 = Optional.some(999)

switch age1 {
case .none:
    print("no age")
case let .some(age1):
    print("age is \(age1)")
}
//-----------------枚举递归-----------------------
//写法1
//indirect enum ArithmeticExpression{
//    case Number(Int)
//    case Add(ArithmeticExpression , ArithmeticExpression)
//    case Multiply(ArithmeticExpression , ArithmeticExpression)
//}
//写法2
enum ArithmeticExpression{
    case Number(Int)
    indirect case Add(ArithmeticExpression , ArithmeticExpression)
    indirect case Multiply(ArithmeticExpression , ArithmeticExpression)
}

let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Add(five, four)
let two = ArithmeticExpression.Number(2)
let product = ArithmeticExpression.Multiply(sum, two)

func evaluate(_ express: ArithmeticExpression) -> Int{
    //参数名前加_,调用时就可省略函数名了，但要考虑是否这样做，参数不提示影响可读性~
    switch express {
    case let .Number(value):
        return value
    case let .Add(left , right):
        return evaluate(left) + evaluate(right)
    case let .Multiply(left , right):
        return evaluate(left) * evaluate(right)
    }
}
//-----------------枚举中定义方法-----------------------
enum Shape1{
    case Square(side:Double)
    case Rectangle(width:Double, height:Double)
    case Circle(centerx:Double, centery:Double, radius:Double)
    case Point
    
    func area() -> Double {
        switch self {
        case let Shape1.Square(side):
            return side*side
        case let .Rectangle(width, height)://参数直接传入，可不写名字
            return width*height
        case let .Circle(_ , _ , r):
            return M_PI*r*r
        default:
            return 0
        }
    }
}
let square1 = Shape1.Square(side: 10)
let rectangle1 = Shape1.Rectangle(width: 20, height: 30)

square1.area()
rectangle1.area()

