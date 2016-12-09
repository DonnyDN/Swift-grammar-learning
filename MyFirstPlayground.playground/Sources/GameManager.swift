import Foundation

public class GameManager{
    
    public var score = 0
    public static let defaultGameManager = GameManager()//let类型不可变，只会实例化一次

    private init(){//只有自己可以初始化自己
        
    }
    
    public func addScore(){
        
    }
}
