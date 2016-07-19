//
//  MainMenuScene.swift
//  InstructorMaze
//
//  Created by Frank Chou on 7/18/16.
//  Copyright © 2016 Frank Chou. All rights reserved.
//

import Foundation
import SpriteKit

class MainMenuScene: SKScene{
    
//    let clickSoundEffect = SKAction.playSoundFileNamed("Click.wav", waitForCompletion: false)
    
    override func didMoveToView(view: SKView) {
        
        let background = SKSpriteNode()
        background.color = UIColor.blackColor()
        background.size = self.size
        background.zPosition = 0
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        self.addChild(background)
        
        let gameTitleLabel1 = SKLabelNode(fontNamed: "Noteworthy")
        gameTitleLabel1.text = "Instructor Maze!"
        gameTitleLabel1.fontSize = 90
        gameTitleLabel1.fontColor = SKColor.whiteColor()
        gameTitleLabel1.position = CGPoint(x: self.size.width/2, y:self.size.height*0.75)
        gameTitleLabel1.zPosition = 1
        self.addChild(gameTitleLabel1)
        
        let howToPlayLabel = SKLabelNode(fontNamed: "Noteworthy")
        howToPlayLabel.text = "Move your iPhone to help the instructors find their way back to the Dojo"
        howToPlayLabel.fontSize = 40
        howToPlayLabel.fontColor = SKColor.whiteColor()
        howToPlayLabel.position = CGPoint(x:self.size.width/2, y:self.size.height*0.5)
        howToPlayLabel.zPosition = 1
        self.addChild(howToPlayLabel)
        
        let startLabel = SKLabelNode(fontNamed: "Noteworthy")
        startLabel.text = "Play"
        startLabel.fontSize = 150
        startLabel.fontColor = SKColor.whiteColor()
        startLabel.position = CGPoint(x:self.size.width/2, y:self.size.height*0.35)
        startLabel.zPosition = 1
        startLabel.name = "startButton"
        self.addChild(startLabel)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch: AnyObject in touches {
            
            let pointOnTouch = touch.locationInNode(self)
            let tappedNode = nodeAtPoint(pointOnTouch)
            let tappedNodeName = tappedNode.name
            
            if tappedNodeName == "startButton" {
                

                
                print("Start button touched")

                        if let scene = GameScene.unarchiveFromFile("GameScene") as? GameScene {
                            // Configure the view.
                            let skView = self.view! as SKView
                            skView.showsFPS = true
                            skView.showsNodeCount = true
                
                            /* Sprite Kit applies additional optimizations to improve rendering performance */
                            skView.ignoresSiblingOrder = true
                
                            /* Set the scale mode to scale to fit the window */
                            scene.scaleMode = .AspectFill
                            
                            skView.presentScene(scene)
                        }

            }
        }
    }
    
}
