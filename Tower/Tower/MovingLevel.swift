//
//  MovingLevel.swift
//  Tower
//
//  Created by Evil Cookie on 02/06/15.
//  Copyright (c) 2015 Evil Cookie. All rights reserved.
//

import Foundation
import SpriteKit

class MovingLevel : SKSpriteNode {
    
    let NUMBER_OF_SEGMENTS = 20
    var isMoving = true
    
    
    // make the height double size of the frame to extend it from the
    init(size: CGSize) {
        super.init(texture: nil, color: kColorLightBlue, size: CGSizeMake(size.width, size.height * 2))
        anchorPoint = CGPointMake(0.5, 0)
        
        for (var i = 0; i < NUMBER_OF_SEGMENTS; i++)
        {
            // make the color differ from segment to segment to distinguish them from another
            // even numbered segments get color one, odd segments get color two
            var segmentColor: UIColor!
            if (i % 2 == 0)
            {
                segmentColor = kColorLightBlue
            }else
            {
                segmentColor = kColorDarkBlue
            }
            
            // position segments one after another stacking according to their number and size height
            let segment = SKSpriteNode(color: segmentColor, size: CGSizeMake(self.size.width, self.size.height / CGFloat(NUMBER_OF_SEGMENTS)))
            segment.anchorPoint = CGPointMake(0, 0)
            segment.position = CGPointMake(0, CGFloat(i) * segment.size.height)
            segment.zPosition = 1
            addChild(segment)
        }
        
    }

    // do stuff upon beginning of the game
    func start(){
        isMoving = false
        progress()
    }
    
    // determine if the screen should 'move' or not
    func shouldProgress() -> Bool {
        
        if isMoving {
            return false
        } else {
            return true
        }
    
    }
    
    func progress() {
       // move the frame down over the screen and reset position to make illusion of neverending level
        
        let adjustedDuration = NSTimeInterval(frame.size.height / kDefaultXtoMovePerSecond)
        let moveUp = SKAction.moveByX(0.0, y: -frame.size.height / 2 , duration: adjustedDuration / 2)
        let resetPosition = SKAction.moveToY(0.0, duration: 0.1)
        
        runAction(SKAction.repeatActionForever(SKAction.sequence([moveUp, resetPosition])))
//        
//        self.runAction(moveUp, completion: { () -> Void in
//            self.runAction(resetPosition, completion: { () -> Void in
//                self.progress})
//            })
//    
       // isMoving = true
        
    }
    
    func stop(){
        self.removeAllActions()
    }
    
    
    func update(){
//        if (shouldProgress() == true)
//        {
//            progress()
//        }
//        
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}