//
//  ViewController.swift
//  TinderSwipe
//
//  Created by Samarth Paboowal on 15/05/17.
//  Copyright © 2017 Junkie Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.layer.masksToBounds = true
        mainView.layer.cornerRadius = 10
    }
    
    @IBAction func mainViewPan(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        
        if sender.state == UIGestureRecognizerState.ended {
            UIView.animate(withDuration: 0.2, animations: { 
                card.center = self.view.center
            })
        }
    }
}

