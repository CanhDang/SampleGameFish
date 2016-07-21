//
//  GameManager.swift
//  SampleGameFish
//
//  Created by HuuLuong on 7/20/16.
//  Copyright © 2016 CanhDang. All rights reserved.
//

import UIKit

class GameManager: NSObject {
    var fishViews: NSMutableArray?
    var hookView: HookerView?
    
    override init() {
        self.fishViews = NSMutableArray()
        self.hookView = HookerView(frame: CGRectMake(0, -490, 20, 490))
        
    }
    
    func addFishToViewController(viewController: UIViewController, width: Int){
        let fishView = FishView(frame: CGRectMake(0,0, 100, 50))
        fishView.generateFish(width)
        self.fishViews?.addObject(fishView)
        viewController.view.addSubview(fishView)
    }
    
    func bite(fishView: FishView) {
        if (fishView.status != fishView.CAUGHT && self.hookView?.status != self.hookView?.DRAWINGUP) {
            fishView.caught()
            
            fishView.center = CGPointMake(self.hookView!.center.x, self.hookView!.frame.origin.y + self.hookView!.frame.height + fishView.frame.width/2)
            self.hookView?.status = self.hookView?.CAUGHTF
        }
    }
    func updateMove() {
        self.hookView?.updateMove()
        for fishView in self.fishViews! {
            fishView.updateMove()
            
            if (CGRectContainsPoint(fishView.frame, CGPointMake(self.hookView!.center.x, self.hookView!.frame.origin.y + self.hookView!.frame.height + fishView.frame.width/2)) && self.hookView?.isHavingFish == false) {
                bite(fishView as! FishView)
            }
        }
    }
    
    func dropHookerAtX(x: Int) {
        self.hookView?.dropDownAtX(x)
    }
}



