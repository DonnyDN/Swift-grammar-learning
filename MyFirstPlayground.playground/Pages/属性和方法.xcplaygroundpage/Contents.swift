//: [Previous](@previous)

import UIKit

struct Point{
    var x = 0.0
    var y = 0.0
}
struct Size{
    var width = 0.0
    var height = 0.0
}

class Rectangle{
    var origin = Point()
    var size = Size()
//静态属性Type Propety--------（定义在Rectangle类型上，而不是实例上）-----------
    static var defaultSize = 100
    
//    var center:Point = Point()
//    center定义为计算型属性（依赖于其他属性，必须显式声明出类型，需声明var可变）
    var center:Point {
        
        get{//getter获取
            let centerX = origin.x + size.width/2;
            let centerY = origin.y + size.height/2;
            return Point(x:centerX, y:centerY)
        }
        /*
        set(newCenter){//setter赋值
            origin.x = newCenter.x - size.width/2;
            origin.y = newCenter.y - size.height/2;
        }
        */
        set{//新值默认叫newValue，
            origin.x = newValue.x - size.width/2;
            origin.y = newValue.y - size.height/2;
        }
    }
    
    var area: Double{
        get{
            return size.width * size.height
        }
        //赋值无法反推其他变量值，故不用写setter
    }

    
    init(origin:Point, size:Size) {
        self.origin = origin;
        self.size = size;
    }
}

var rect = Rectangle(origin: Point(), size: Size(width: 10, height: 5))
rect.center

rect.origin = Point(x: 10, y: 10)
rect.center

rect.center = Point(x: 6, y: 6)


//静态方法Type Method--------------------
struct Matrix{
    var m: [[Int]]//二维数组
    var row: Int//行
    var col:Int//列
    
    init?(_ arr2d:[[Int]]) {
        guard arr2d.count > 0 else {
            return nil
        }
        
        let row = arr2d.count
        let col = arr2d[0].count
        for i in 1..<row {
            if arr2d[i].count != col {
                return nil
            }
        }
        
        self.m = arr2d
        self.row = row
        self.col = col
        
    }
    
    func printMatrix(){//打印每个元素
        for i in 0..<row {
            for j in 0..<col {
                print(m[i][j],terminator:"\t")//\t制表符距离
            }
            print()//换行
        }
    }
    
    //2*2、3*3、100*100 单位矩阵
    //单位矩阵和实例无关，应该和类关联
    static func identityMatrix(n:Int) -> Matrix? {
        if n <= 0 {
            return nil
        }
        
        var arr2d:[[Int]] = []
        for i in 0..<n {
            var row = [Int](repeating: 0, count: n)
            row[i] = 1
            arr2d.append(row)
        }
        
        return Matrix(arr2d)
    }
}

if let m = Matrix([[1,2],[3,4]]) {
    m.printMatrix()
}

if let e = Matrix.identityMatrix(n: 5) {
   e.printMatrix()
}


//-------Property Observer 属性观察器---------------------------

class LightBulb{
    static let maxCurrent = 30
    var current = 0{
        // 我们需要在current属性变化前做什么
        willSet{
            print("Will set an new value \(newValue) to current")
        }
        // 我们需要在age属性变化后做什么
        didSet{
            if current == LightBulb.maxCurrent {
                print("相等了！！")
            } else if(current > LightBulb.maxCurrent){
                print("超过了！！")
                current = oldValue//oldValue是默认旧值
            }
        }
    }
}

enum Theme{
    case DayMode
    case NightMode
}
class UI{
    var fontColor: UIColor!
    var bgColor:UIColor!
    var themeMode:Theme = .DayMode{
        //注意，didset和willset不会在初始化阶段init调用；变量设置了初始值，且设置成let，也不会调用
        didSet{
            self.chengeTheme(themeMode:themeMode)
        }
    }
    
    init(themeMode:Theme) {
        self.themeMode = themeMode
        self.chengeTheme(themeMode: themeMode)
    }
    
    func chengeTheme(themeMode:Theme) {
        switch themeMode {
        case .DayMode:
            self.fontColor = UIColor.black
            self.bgColor = UIColor.white
        case .NightMode:
            self.fontColor = UIColor.white
            self.bgColor = UIColor.black
        }
    }
}

let ui = UI(themeMode: .DayMode)
ui.themeMode
ui.fontColor
ui.bgColor

//-------Lazy Property 延迟属性---------------------------
class Book{
    let name: String
    //需要调用的时候才加载，调用一次后，下次不重复计算
    //相当于block
    lazy var content: String? = {
        //本地读取书的内容
        return nil
    }()
    
    init(name:String) {
        self.name = name
    }
    
}

//-------访问控制---------------------------
/*
 public:可被模块外访问
 internal:可被本模块访问
 private:可被本文件访问
 */
class UI2{
    //不希望外界修改fontColor
    private var fontColor: UIColor!
    var bgColor:UIColor!
    var themeMode:Theme = .DayMode{
        //注意，didset和willset不会在初始化阶段init调用；变量设置了初始值，且设置成let，也不会调用
        didSet{
            self.chengeTheme(themeMode:themeMode)
        }
    }
    
    init(themeMode:Theme) {
        self.themeMode = themeMode
        self.chengeTheme(themeMode: themeMode)
    }
    //不希望外界修改chengeTheme
    private func chengeTheme(themeMode:Theme) {
        switch themeMode {
        case .DayMode:
            self.fontColor = UIColor.black
            self.bgColor = UIColor.white
        case .NightMode:
            self.fontColor = UIColor.white
            self.bgColor = UIColor.black
        }
    }
}

let ui2 = UI2(themeMode: .DayMode)
ui2.themeMode
//private 修饰的不可访问
//ui2.fontColor
ui2.bgColor












