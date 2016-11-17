//
//  ViewController.swift
//  RollingBall
//
//  Created by Pham Ngoc Hai on 11/16/16.
//  Copyright © 2016 pnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer = Timer()
    var ball = UIImageView()
    var radians = CGFloat()
    var ballRadious = CGFloat()
    var checkBien: Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        checkBien = true
        addBall()
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(rollBall), userInfo: nil, repeats: true)
        rollBall()
        
    }
    func addBall()
    {
    let mainViewSize = self.view.bounds.size
    ball = UIImageView(image: UIImage(named: "ball.png"))
    ballRadious = 32.0
    ball.center = CGPoint(x: 32, y: mainViewSize.height / 2)
        
        self.view.addSubview(ball)
    }
    func rollBall()
    {
        if (checkBien){
        commingBall()
        }else{
        comeBackBall()
        }

    }
    func commingBall()  {
        let delta: CGFloat = 0.1
        radians = radians + delta
        ball.transform = CGAffineTransform(rotationAngle: radians)
        ball.center = CGPoint(x: ball.center.x     + radians * delta, y: ball.center.y)
        if  ball.center.x > self.view.bounds.size.width - ballRadious {
            checkBien = !checkBien
            radians = 0.2
        }
        }
    func comeBackBall()  {
        let delta: CGFloat = -0.2
        radians = radians +  delta
        ball.transform = CGAffineTransform(rotationAngle: radians)
        ball.center = CGPoint(x: ball.center.x - radians * delta, y: ball.center.y  - radians * delta)
        if  ball.center.y <  ballRadious  {
            checkBien = true
            radians = -0.2
        }
    }
    
}
