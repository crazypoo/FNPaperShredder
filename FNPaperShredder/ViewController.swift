//
//  ViewController.swift
//  FNPaperShredder
//
//  Created by Fnoz on 16/7/14.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @objc var paperShredder:FNPaperShredder!
    var mode:FNPaperShredderMode = .Bar
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.init(red: 42/255.0, green: 49/255.0, blue: 67/255.0, alpha: 1)
        
        paperShredder  = FNPaperShredder.init(frame: CGRect.init(x: 0, y: 0, width: 200, height: 200))
        paperShredder.center = CGPoint.init(x: view.frame.size.width / 2 - 40, y: view.frame.size.height / 2)
        view.addSubview(paperShredder)
        
        let startBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 40, height: 40))
        startBtn.backgroundColor = UIColor.init(red: 37/255.0, green: 171/255.0, blue: 22/255.0, alpha: 1)
        startBtn.layer.cornerRadius = 20
        startBtn.center = CGPoint.init(x: paperShredder.center.x + 140, y: paperShredder.center.y - 77)
        startBtn.addTarget(self, action: #selector(start), for: UIControl.Event.touchUpInside)
        view.addSubview(startBtn)
        
        let resetBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 40, height: 40))
        resetBtn.backgroundColor = UIColor.init(red: 225/255.0, green: 65/255.0, blue: 65/255.0, alpha: 1)
        resetBtn.layer.cornerRadius = 20
        resetBtn.center = CGPoint.init(x: paperShredder.center.x + 140, y: paperShredder.center.y - 27)
        resetBtn.addTarget(self, action: #selector(reset), for: UIControl.Event.touchUpInside)
        view.addSubview(resetBtn)
        
        let modeBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 40, height: 40))
        modeBtn.backgroundColor = .orange
        modeBtn.layer.cornerRadius = 20
        modeBtn.center = CGPoint.init(x: paperShredder.center.x + 140, y: paperShredder.center.y + 23)
        modeBtn.addTarget(self, action: #selector(modeChange(btn:)), for: UIControl.Event.touchUpInside)
        view.addSubview(modeBtn)
    }
    
    @objc func start() {
        paperShredder.start()
    }
    
    @objc func reset() {
        paperShredder.reset(animate: true)
    }
    
    @objc func modeChange(btn:UIButton) {
        if mode == .Bar {
            mode = .Piece
            btn.backgroundColor = UIColor.init(red: 94/255.0, green: 89/255.0, blue: 151/255.0, alpha: 1)
        }
        else {
            mode = .Bar
            btn.backgroundColor = .orange
        }
        paperShredder.mode = mode
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

