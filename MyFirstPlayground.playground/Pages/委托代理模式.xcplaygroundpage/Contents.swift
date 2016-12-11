//: [Previous](@previous)

import Foundation


protocol TurnBasedGame{//回合制游戏协议1
    
    var turn: Int{get set}
    
    func play()
}

@objc protocol TurnBasedGameDelegate{//回合制游戏协议2，指定具体游戏方法
    func gameStart()
    func playerMove()
    func gameEnd()
    
    //关键字optional 继承者可选实现本方法；若有此种方法，需要在协议开始加@objc，为了使该协议也能暴露给OC语言，和swift与OC桥接有关
    @objc optional func turnStart()
    @objc optional func turnEnd()
    
    func gameOver() -> Bool
}
class SinglePlayerTurnBasedGame: TurnBasedGame{
    
    var turn: Int = 0
    var delegate: TurnBasedGameDelegate!//此代理变量的构造函数来实例返回此变量，若要后续实例返回它，可以"!"返回确定非空的可选型
    
    func play() {
        delegate.gameStart()
        while !delegate.gameOver() {
            //因为delegate.turnStart方法是optional可选方法，故需要解包，解包失败说明遵从者未实现此方法
            if let turnStart = delegate.turnStart {
                turnStart()
            }else{
                print("ROUND", turn, ":")
            }
            
            print("ROUND",turn,":")
            delegate.playerMove()
            
            //因为delegate.turnEnd方法是optional可选方法，故需要解包，这是解包的另一种写法。解包成功就执行方法，失败说明遵从者未实现此方法，啥也不干；
            delegate.turnEnd?()
            turn += 1
        }
        delegate.gameEnd()
    }
}

class RollNumberGame: SinglePlayerTurnBasedGame, TurnBasedGameDelegate{
    
    var score = 0
    
    override init() {
        super.init()
        //在此把父类的TurnBasedGameDelegate类型的delegate变量指向自己，自己就要实现TurnBasedGameDelegate规定的方法，和OC一样
        delegate = self
    }
    
    func gameStart() {
        score = 0
        turn  = 0
        
        print("Welcome to Roll Number Game")
        print("Try to use least turn to make total 100 scores")
    }
    
    func turnStart() {
        print("==== ROUND START ====")
    }
    
//    func turnEnd() {
//        print("==================")
//    }
    func gameOver() -> Bool {
        return score >= 100
    }
    
    func playerMove() {
        let rollnumber = Int(arc4random()%6 + 1)
        score += rollnumber
        print("You rolled a",rollnumber, "The score is",score,"now!")
    }
    
    func gameEnd() {
        print("Congratulation! You win the game in", turn, "Round!")
    }
}

let rollNumberGame = RollNumberGame()
rollNumberGame.play()

















