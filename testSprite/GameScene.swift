//
//  GameScene.swift
//  testSprite
//
//  Created by Ben Liu on 5/04/2016.
//  Copyright (c) 2016 Ben Liu. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    // instance WITH value
    let zombie1 = SKSpriteNode(imageNamed: "zombie1")
    
    var lastUpdateTime: NSTimeInterval = 0
    var dt: NSTimeInterval = 1
    let zombieMovePointsPerSec: CGFloat? = 480.0
    var velocity = CGPoint.zero
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        // original
        /*
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.addChild(myLabel)
        */
        
        
        
        /********************** Begin background ***********************/
        // background - black color
        //backgroundColor = SKColor.blackColor()
        
        
        // background is actually a sprite
        let background = SKSpriteNode(imageNamed: "background1")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x:0.5, y:0.5)
        //background.zRotation = CGFloat(M_PI) / 8
        background.zPosition = -1
        addChild(background)
        /********************** End background ***********************/
        
        
        /********************** Begin Zombie ***********************/
        
        zombie1.position = CGPoint(x:400, y:400)
        addChild(zombie1)
        
        moveSprite(zombie1, velocity: velocity)
        
    }

   
    override func update(currentTime: CFTimeInterval) {
        
        if lastUpdateTime > 0 {
            dt = currentTime - lastUpdateTime
        } else {
            dt = 0 }
        lastUpdateTime = currentTime
        print("\(dt*1000) milliseconds since last update")
        
        /* Called before each frame is rendered */
        //moveSprite(zombie1, velocity: CGPoint(x: zombieMovePointsPerSec!, y: 0))
        
        moveSprite(zombie1, velocity: velocity)
        boundsCheckZombie()
        
    }
    
    
    //// Very general function that can be used for other sprites as well
    func moveSprite(sprite: SKSpriteNode, velocity: CGPoint) {
        // 1
        let amountToMove = CGPoint(x: velocity.x * CGFloat(dt),
                                   y: velocity.y * CGFloat(dt))
        print("Amount to move: \(amountToMove)")
        // 2
        sprite.position = CGPoint(
            x: sprite.position.x + amountToMove.x,
            y: sprite.position.y + amountToMove.y)
    }
    
    ////
    func moveZombieToward(sprite: SKSpriteNode, location: CGPoint) {
        let offset = CGPoint(x: location.x - sprite.position.x,
                             y: location.y - sprite.position.y)
        
        let length = sqrt(
            Double(offset.x * offset.x + offset.y * offset.y))
        
        let direction = CGPoint(x: offset.x / CGFloat(length),
                                y: offset.y / CGFloat(length))
        velocity = CGPoint(x: direction.x * zombieMovePointsPerSec!,
                           y: direction.y * zombieMovePointsPerSec!)
    }
    

    // touch events
    func sceneTouched(touchLocation:CGPoint) {
        moveZombieToward(zombie1, location:touchLocation)
    }

    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /*
         /* Called when a touch begins */
         
         for touch in touches {
         let location = touch.locationInNode(self)
         
         let sprite = SKSpriteNode(imageNamed:"Spaceship")
         
         sprite.xScale = 0.5
         sprite.yScale = 0.5
         sprite.position = location
         
         let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
         
         sprite.runAction(SKAction.repeatActionForever(action))
         
         self.addChild(sprite)
         }
         */
        guard let touch = touches.first else {
            return
        }
        let touchLocation = touch.locationInNode(self)
        sceneTouched(touchLocation)
    }

    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let touchLocation = touch.locationInNode(self)
        sceneTouched(touchLocation)
    }
    
    
    func boundsCheckZombie() {
        let bottomLeft = CGPointZero
        let topRight = CGPoint(x: size.width, y: size.height)
        if zombie1.position.x <= bottomLeft.x {
            zombie1.position.x = bottomLeft.x
            velocity.x = -velocity.x
        }
        if zombie1.position.x >= topRight.x {
            zombie1.position.x = topRight.x
            velocity.x = -velocity.x
        }
        if zombie1.position.y <= bottomLeft.y {
            zombie1.position.y = bottomLeft.y
            velocity.y = -velocity.y
        }
        if zombie1.position.y >= topRight.y {
            zombie1.position.y = topRight.y
            velocity.y = -velocity.y
        }
    }
}

































