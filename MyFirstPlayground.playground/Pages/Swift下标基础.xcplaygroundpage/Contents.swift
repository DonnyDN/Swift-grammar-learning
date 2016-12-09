//: [Previous](@previous)

import Foundation
//-----------下标(更丰富地获取自定义数据的方式)----------------
//定义一个结构体
struct Vector3{
    var x:Double = 0.0
    var y:Double = 0.0
    var z:Double = 0.0
    
    subscript(index:Int) ->Double?{
        get{
            switch index{
            case 0: return x
            case 1: return y
            case 2: return z
            default: return nil
            }
        }
        set{//ye可以set(newValue)
            //newValue是系统默认的可选型值，可为nil，故需解包
            guard let newValue = newValue else{return}
            
            switch index{
            case 0: x = newValue
            case 1: y = newValue
            case 2: z = newValue
            default: return
            }
        }
    }
    //也可以定义多个下标的使用方法
    subscript(axis:String) -> Double?{
        switch axis{
        case "x","X": return x
        case "y","Y": return y
        case "z","Z": return z
        default: return nil
        }
    }
    //返回向量的模（长度）
    func length() -> Double {
        return sqrt(x*x + y*y + z*z)
    }
    
}
var v = Vector3(x: 1, y: 2, z: 3)
v.x
v[0]

v["z"]
v["hello"]

v[0] = 2
v[0]


//----------------多维下标-----------------------
struct Matrix{
    var data: [[Double]]
    let r:Int
    let c:Int
    
    init(row:Int , col:Int) {
        self.r = row
        self.c = col
        data = [[Double]]()
        for _ in 0..<r {
            let aRow = Array(repeatElement(0.0, count: col))
            data.append(aRow)
        }
    }
    //可以m[1,1]
    subscript(x:Int , y:Int) -> Double{
        //断言崩溃提示/也可以返回可选型
        get{
            assert(x >= 0 && x < r && y >= 0 && y < c , "Index Out of Range")
            return data[x][y]
        }
        set{
            //断言查错
            assert(x >= 0 && x < r && y >= 0 && y < c , "Index Out of Range")
            data[x][y] = newValue
        }
    }
    //可以m[0]
    subscript(row:Int) -> [Double]{
        get{
            assert(row >= 0 && row < r , "Index Out of Range")
            return data[row]
        }
        set(vector){
            assert(vector.count == c , "Column Number does Not match")
            data[row] = vector
        }
    }
}

var m = Matrix(row: 2, col: 2)
m.data
m[1,1] = 100
m.data

m[0] = [1.2,1.3]
m[0][1]


//-----------运算符重载（运算符相当函数）-----------------------
func + (left:Vector3 , right:Vector3) -> Vector3{
    return Vector3(x: left.x + right.x, y: left.y + right.y, z: left.z + right.z)
}
var va = Vector3(x: 1, y: 1, z: 1)
let vb = Vector3(x: 2, y: 2, z: 2)
va + vb

let array = [1,2,3,4]
array.reduce(0, +)
array.reduce(0, -)


func * (left: Vector3 , a:Double) -> Vector3{
    return Vector3(x: left.x * a, y: left.y * a, z: left.z * a)
}
//多聪明的设计，实现了va * 2，但2 * va不实现也是无法执行的
func * (a:Double , right:Vector3) -> Vector3{
    return right * a;//只需重载之前的函数
}

func * (left:Vector3 , right:Vector3) -> Double{
    return left.x * right.x + left.y * right.y + left.z * right.z
}

//参数进去还出来inout
func += (left: inout Vector3 , right:Vector3){
    left = left + right
}
va += vb

//"-"和双目运算符(+=)不一样,单目运算符有放在左边还是右边2选择
//关键字prefix 表示当一个前缀使用，当然后缀postfix也有，使用不多
prefix func - (vector:Vector3) -> Vector3{
    return Vector3(x: -vector.x, y: -vector.y, z: -vector.z)
}


//----------------比较运算符重载----------------
func == (left:Vector3 , right:Vector3) -> Bool{
    return left.x == right.x && left.y == right.y && left.z == right.z
}

va == vb

func != (left:Vector3 , right:Vector3) -> Bool{
//    return left.x != right.x || left.y != right.y || left.z != right.z
    
    return !(left == right)
}

va != vb

func < (left:Vector3 , right:Vector3) -> Bool{
    if left.x != right.x { return left.x < right.x}
    if left.y != right.y { return left.y < right.y}
    if left.z != right.z { return left.z < right.z}
    
    return false
}

func <= (left:Vector3 , right:Vector3) -> Bool{
    return left < right || left == right
}

func > (left:Vector3 , right:Vector3) -> Bool{
    return !(left <= right)
}

func >= (left:Vector3 , right:Vector3) -> Bool{
    return !(left < right)
}


let a = [2,4,1,7,3]
a.sorted()//数组的sort()方法自动从小到大排序,改变了自身
a.sorted(by: <)


//----------------自定义运算符----------------
/**
 prefix 前置运算符
 infix 中间运算符
 postfix 后置运算符
 配置
 associativity 结合性 （包含 left，right和none）
 precedence 优先级 （0-255）
 */
//a+++ 使向量每个元素+1(单目运算符)
//关键字operator 定义单目运算符
prefix operator +++
prefix func +++(vector: inout Vector3) -> Vector3{
    vector += Vector3(x: 1, y: 1, z: 1)
    return vector
}

postfix operator +++
postfix func +++(vector: inout Vector3) -> Vector3{
    let ret = vector
    vector += Vector3(x: 1, y: 1, z: 1)
    return ret
}

var v1 = Vector3(x: 1, y: 1, z: 1)
v1+++

+++v1
v1

//关键字infix 定义双目运算符
//计算2个向量的夹角值
//https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Declarations.html#//apple_ref/swift/grammar/operator-declaration
//声明一个运算符，并指定优先级组，优先级组中已经指定了结合性和优先级.主要有Bitwise shift，Multiplication，Addition，Range formation，Casting，Nil coalescing，Comparison，Logicalconjunction，Ternary，Assignment. 这些优先级组
infix operator ^ :DNPrecedence
precedencegroup DNPrecedence {
    associativity: left //从左向右的结合性（left,right,none）
    higherThan :LogicalConjunctionPrecedence
}
//https://developer.apple.com/reference/swift/1851035-swift_standard_library_operators#//apple_ref/doc/uid/TP40016054

func ^ (left:Vector3 , right:Vector3) -> Double{
    return acos((left * right) / (left.length() * right.length()))
}

let v2 = Vector3(x: 4, y: 5, z: 6)

v1 ^ v2

//定义一个x的p幂次方
infix operator ** :group111
precedencegroup group111{
    associativity: left
    higherThan: AdditionPrecedence,//比加法优先级高
                MultiplicationPrecedence//比乘法优先级高
}

func **(x:Double , p:Double) -> Double{
    return pow(x, p)
}

2**3
//group111规定了优先级规则，从左往右；2**3=8，8**2=64
2**3**2
1+2**3**2
2*2**3**2








