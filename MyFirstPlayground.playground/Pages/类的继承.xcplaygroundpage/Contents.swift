//: [Previous](@previous)

import Foundation

class Avatar{
    var name: String
    var life = 100{
        didSet{
            if self.life <= 0 {
                self.isAlive = false
            }
            if self.life > 100 {
                self.life = 100
            }
        }
    }
    var isAlive: Bool = true
    var description: String{
        return "I'm Avatar \(name)"
    }
    
    init(name: String) {
        self.name = name;
    }
    //convenience关键字 方便的构造函数，没有把整个对象构造出来，而是把构造任务交给本身的init函数（只能调用自己的init）；与之对应的就是指定的构造函数
    convenience init(firstName: String , lastName: String) {
        self.init(name:firstName + " " + lastName)
    }
    //不让子类覆盖此方法 可以final关键字修饰
    func beAttacked(attack: Int) {
        life -= attack
        if life <= 0 {
            isAlive = false
        }
    }
}
//继承
class User: Avatar{
    var score = 0
    var level = 0
    var  group: String
    //此构造函数和父类的不一样 故不需要override重载
    init(name: String , group: String = "") {
        //构造初值
        self.group = group
        super.init(name: name)
        
        //父类super也初始化完成后 进一步完善
        if group == "" {
            self.getScore(score: -10)
        }
    }
    
    func getScore(score: Int) {
        self.score += score;
        if score > level * 100 {//达到100分level加1
            level += 1
        }
    }
    //override关键字 重载父类方法-----------------
    override var description: String{
        return "I'm Avatar \(name)"
    }
    
    
    override func beAttacked(attack: Int) {
        self.life -= attack/2
    }
    
}

let player  = User(name: "DN")
let player2 = User(name: "DN" , group: "AAA")

player.name
player.score

player.getScore(score: 1)
player.level


//final关键字 禁止此类被继承
final class Magician: Avatar{
    var  magic = 100
    var group: String
    
    init(name: String , group: String) {
        //先
        self.group = group//子类所有量初始化完成，才能进一步初始化父类所有量
        //后
        super.init(name: name)
        
        //父类super也初始化完成后 进一步完善
        if group == "" {
            
        }
    }
    
    
}
let magician = Magician(name: "magician" , group: "")

//多态------------------------------------------------------
func printBasicInfo(avatar:Avatar){
    print("The avatar's name is \(avatar.name)")
}

printBasicInfo(avatar: magician)
printBasicInfo(avatar: player)

final class Warrior: User{
    static let weapons = ["Sword","Axe","Spear"]
    var weapon: String
    
    override var description: String{
        return "I'm Warrior \(name)"
    }
    
    init(name: String , group: String , weapon: String) {
        self.weapon = weapon
        super.init(name: name , group: group)
    }
    //这个不需要convenience 因为不是个方便的构造函数
//    override init(name: String , group: String) {
//        self.weapon = Warrior.weapons[Int(arc4random() % 3)]
//        super.init(name: name, group: group)
//    }

    convenience override init(name: String , group: String) {
        let weapon = Warrior.weapons[Int(arc4random() % 3)]
        self.init(name: name, group: group , weapon: weapon)
    }
    
}

class Monster:Avatar{
    
}
//Monster的指定构造函数 全部从父类继承而来
//let monster = Monster(name: <#T##String#>)
//let monster = Monster(firstName: <#T##String#>, lastName: <#T##String#>)

class Monster1:Avatar{
    
    init(name: String , g: String) {
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name:name)
    }
}
/*
 若子类未实现任何父类指定构造函数，则自动继承父类的所有“指定”构造函数；
 若子类实现了父类所有指定构造函数，则自动继承父类的所有“便利”构造函数。
 */
//let  monster1 = Monster1(name: <#T##String#>)
//let  monster1 = Monster1(name: <#T##String#>, g: <#T##String#>)
//let  monster1 = Monster1(firstName: <#T##String#>, lastName: <#T##String#>)

