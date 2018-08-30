//
//  GameScene.swift
//  SpaceInvaders
//
//  Created by Saopaulo Act on 2018. 8. 30..
//  Copyright © 2018년 Saopaulo Act. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // Private GameScene Properties
    
    var contentCreated = false
    
    enum InvaderType {
        case a
        case b
        case c
        
        static var size: CGSize {
            return CGSize(width: 24, height: 16)
        }
        
        static var name: String {
            return "invader"
        }
    }

    let kInvaderGridSpacing = CGSize(width: 12, height: 12)
    let kInvaderRowCount = 6
    let kInvaderColCount = 6
    
    // Object Lifecycle Management
    
    // Scene Setup and Content Creation
    override func didMove(to view: SKView) {
        
        if (!self.contentCreated) {
            self.createContent()
            self.contentCreated = true
        }
    }
    
    func createContent() {
        
//        let invader = SKSpriteNode(imageNamed: "InvaderA_00.png")
//
//        invader.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
//
//        self.addChild(invader)
        
        // black space color
        self.backgroundColor = SKColor.black
        
        setupInvaders()
    }
    
    
    
    func makeInvader(ofType invaderType: InvaderType) -> SKNode {
        
        var invaderColor: SKColor
        
        switch(invaderType) {
        case .a:
            invaderColor = SKColor(red: 199, green: 219, blue: 237, alpha: 1)
        case .b:
            invaderColor = SKColor(red: 237, green: 199, blue: 221, alpha: 1)
        case .c:
            invaderColor = SKColor(red: 218, green: 199, blue: 237, alpha: 1)
        }
        
        let invader = SKSpriteNode(color: invaderColor, size: InvaderType.size)
        invader.name = InvaderType.name
        
        return invader
    }
    
    func setupInvaders() {
        
        let baseOrigin = CGPoint(x: size.width / 3, y: size.height / 2)
        
        for row in 0..<kInvaderRowCount {
            
            var invaderType: InvaderType
            
            if row % 3 == 0 {
                invaderType = .a
            } else if row % 3 == 1 {
                invaderType = .b
            } else {
                invaderType = .c
            }
            
            let invaderPositionY = CGFloat(row) * (InvaderType.size.height * 2) + baseOrigin.y
            
            var invaderPosition = CGPoint(x: baseOrigin.x, y:invaderPositionY)
            
            for _ in 1..<kInvaderColCount {
                
                let invader = makeInvader(ofType: invaderType)
                invader.position = invaderPosition
                
                addChild(invader)
                
                invaderPosition = CGPoint(
                    x: invaderPosition.x + InvaderType.size.width + kInvaderGridSpacing.width,
                    y: invaderPositionY
                )
            }
        }
    }
    
    
    // Scene Update
    
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
    }
    
    // Scene Update Helpers
    
    // Invader Movement Helpers
    
    // Bullet Helpers
    
    // User Tap Helpers
    
    // HUD Helpers
    
    // Physics Contact Helpers
    
    // Game End Helpers
    
}
