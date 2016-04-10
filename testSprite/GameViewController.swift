//
//  GameViewController.swift
//  testSprite
//
//  Created by Ben Liu on 5/04/2016.
//  Copyright (c) 2016 Ben Liu. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        /*
        // whether assign a scene is real or not
        // GameScene here is the GameScene.sks
        
        if let scene = GameScene(fileNamed:"GameScene") {
            
            
            // Configure the view.
            // my understanding on this is 
            // 1. as is a keyword that can downcast view to SKView
            // 2. ! make sure self.view has value
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            skView.presentScene(scene)
        }
         */
        
        
        let scene = GameScene(size:CGSize(width: 2048, height: 1536))
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true   // 这个是啥意思
        scene.scaleMode = .AspectFill
        skView.presentScene(scene)
        
        
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
