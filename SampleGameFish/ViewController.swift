//
//  ViewController.swift
//  SampleGameFish
//
//  Created by HuuLuong on 7/20/16.
//  Copyright © 2016 CanhDang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var gameManager: GameManager?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.gameManager = GameManager()
        self.view.addSubview((self.gameManager?.hookView)!)
        self.gameManager?.addFishToViewController(self, width: Int(self.view.bounds.width))
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapHandle)))
            NSTimer.scheduledTimerWithTimeInterval(0.025, target: self.gameManager!, selector: "updateMove", userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tapHandle(sender: UIGestureRecognizer) {
        let tapPoint = sender.locationInView(self.view)
        self.gameManager?.dropHookerAtX(Int(tapPoint.x))
    }
    
    
    @IBAction func action_reset(sender: AnyObject) {
        self.gameManager?.fishViews?.removeAllObjects()
        for object in self.view.subviews {
            if (object .isKindOfClass(FishView)) {
                object .removeFromSuperview()
            }
        }
        self.gameManager?.addFishToViewController(self, width: Int(self.view.bounds.width))
    }

    @IBAction func action_AddFish(sender: AnyObject) {
        self.gameManager?.addFishToViewController(self, width: Int(self.view.bounds.width))
    }
}

