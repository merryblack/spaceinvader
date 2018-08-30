//
//  GameOverScene.swift
//  SpaceInvaders
//
//  Created by Saopaulo Act on 2018. 8. 30..
//  Copyright © 2018년 Saopaulo Act. All rights reserved.
//

import UIKit
import SpriteKit

class GameOverScene: SKScene {

    // Private GameScene Properties
    
    var contentCreated = false
    
    // Object Lifecycle Management
    
    // Scene Setup and Content Creation
    
    override func didMove(to view: SKView) {
        
        if(!self.contentCreated) {
            self.createContent()
            self.contentCreated = true
        }
    }
    
    
    func createContent() {
        
        self.backgroundColor = SKColor.black
        
        let gameOverLabel = SKLabelNode(fontNamed: "Courier")
        gameOverLabel.fontSize = 50
        gameOverLabel.fontColor = SKColor.white
        gameOverLabel.text = "Game Over!"
        gameOverLabel.position = CGPoint(x: self.size.width/2, y: 2.0 / 3.0 * self.size.height)
        
        self.addChild(gameOverLabel)
        
        let tapLabel = SKLabelNode(fontNamed: "Courier")
        tapLabel.fontSize = 25
        tapLabel.fontColor = SKColor.white
        tapLabel.text = "탭하여 다시하기"
        tapLabel.position = CGPoint(x: self.size.width/2, y: gameOverLabel.frame.origin.y - gameOverLabel.frame.size.height - 40)
        
        self.addChild(tapLabel)
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)  {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let gameScene = GameScene(size: self.size)
        gameScene.scaleMode = .aspectFill
        
        self.view?.presentScene(gameScene, transition: SKTransition.doorsCloseHorizontal(withDuration: 1.0))
    }

}
