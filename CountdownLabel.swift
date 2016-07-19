//
//  CountdownLabel.swift
//  InstructorMaze
//
//  Created by Frank Chou on 7/16/16.
//  Copyright © 2016 Frank Chou. All rights reserved.
//

import Foundation
import SpriteKit

class CountdownLabel: SKLabelNode {
    
    var endTime: NSDate!
    
    func update() {
        
        let timeLeftInteger = Int(timeLeft())
        text = String(timeLeftInteger)
        
    }
    func startWithDuration(duration: NSTimeInterval) {
        let timeNow = NSDate();
        endTime = timeNow.dateByAddingTimeInterval(5)
        
    }
    func hasFinished() -> Bool {
        return timeLeft() == 0;
    }
    
    private func timeLeft() -> NSTimeInterval {
        
        let now = NSDate();
        let remainingSeconds = endTime.timeIntervalSinceDate(now)
        return max(remainingSeconds, 0)
    }

    
    

    
}
