//
//  GameScene.swift
//  InstructorMaze
//
//  Created by Frank Chou on 7/16/16.
//  Copyright (c) 2016 Frank Chou. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene, SKPhysicsContactDelegate {
    var timeLeft = 30
    var timer = NSTimer()
    var block1: SKSpriteNode?
    var bars: [SKSpriteNode] = []
    let manager = CMMotionManager()
    let scoreLabel = SKLabelNode(fontNamed: "Noteworthy")
    let timerLabel = SKLabelNode(fontNamed: "Noteworthy")
    
    //SKSpriteNode_1
    override func didMoveToView(view: SKView) {
        block1 = self.childNodeWithName("block1") as? SKSpriteNode
        
        for child in self.children {
            if child.name == "SKSpriteNode_1" {
                if let child = child as? SKSpriteNode {
                    bars.append(child)
                }
            }
        }
        
        self.physicsWorld.contactDelegate = self
        
        timer =  NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("updateTimer"), userInfo: nil, repeats: true)
        
        let center = CGPoint(x:CGRectGetMidX(frame), y: frame.size.height/15*14)
        timerLabel.position = center
        timerLabel.fontSize = 80;
        timerLabel.text = String(timeLeft)
        addChild(timerLabel)
        manager.startAccelerometerUpdates()
        manager.accelerometerUpdateInterval = 0.1
        manager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue()) {
            (data, error) in
            
            self.physicsWorld.gravity = CGVectorMake(CGFloat((data?.acceleration.x)!) * 10, CGFloat((data?.acceleration.y)!) * 10)
            
        }
        
    }
    
    func updateTimer() {
        timeLeft = timeLeft - 1
        timerLabel.text = String(timeLeft)
        if timeLeft == 0 {
            print("Game Over")
            timer.invalidate()
            runGameOver()
            
        }
    }
    
    
    func didBeginContact(contact: SKPhysicsContact) {
        
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        
        if bodyA.categoryBitMask == 1 && bodyB.categoryBitMask == 2 || bodyA.categoryBitMask == 2 && bodyB.categoryBitMask == 1 {
            print("Success")
            runGameOver()
        }
        
    }
    
    func runGameOver() {
            //implement what happens when Game is over
        let sceneToMoveTo = GameOverScene(size: self.size)
        sceneToMoveTo.scaleMode = self.scaleMode
        let sceneTransition = SKTransition.fadeWithDuration(0.2)
        self.view!.presentScene(sceneToMoveTo, transition: sceneTransition)
        
    }
    
//    override func update(currentTime: CFTimeInterval) {
//    }
}
