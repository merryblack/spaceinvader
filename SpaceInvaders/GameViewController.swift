//
//  GameViewController.swift
//  SpaceInvaders
//
//  Created by Saopaulo Act on 2018. 8. 30..
//  Copyright © 2018년 Saopaulo Act. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
            
            let scene = GameScene(size: view.frame.size)
            scene.scaleMode = .aspectFill
            
            view.presentScene(scene)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(GameViewController.handleApplicationWillResignActive(_:)), name: NSNotification.Name.UIApplicationWillResignActive, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(GameViewController.handleApplicationDidBecomeActive(_:)), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
    }

    

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    
    @objc func handleApplicationWillResignActive(_ note: Notification) {
        let view = self.view as! SKView
        view.isPaused = true
    }
    
    @objc func handleApplicationDidBecomeActive(_ note: Notification) {
        let view = self.view as! SKView
        view.isPaused = false
    }
}
