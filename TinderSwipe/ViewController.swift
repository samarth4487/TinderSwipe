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
    @IBOutlet weak var thumbImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.layer.masksToBounds = true
        mainView.layer.cornerRadius = 10
    }
    
    // NOTE: By default the alpha of thumbs image view is set to zero
    
    @IBAction func mainViewPan(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        
        if point.x > 0 {
            thumbImageView.alpha = 1
            thumbImageView.image = #imageLiteral(resourceName: "up")
            thumbImageView.tintColor = UIColor.green
        } else if point.x < 0 {
            thumbImageView.alpha = 1
            thumbImageView.image = #imageLiteral(resourceName: "down")
            thumbImageView.tintColor = UIColor.red
        }
        
        thumbImageView.alpha = abs(point.x) / view.center.x
        
        if sender.state == UIGestureRecognizerState.ended {
            if card.center.x < 75 {
                UIView.animate(withDuration: 0.5, animations: { 
                    card.center = CGPoint(x: card.center.x - 300, y: card.center.y + 100)
                })
                return
            } else if card.center.x > (view.frame.width - 75) {
                UIView.animate(withDuration: 0.5, animations: {
                    card.center = CGPoint(x: card.center.x + 300, y: card.center.y + 100)
                })
                return
            } else {
                UIView.animate(withDuration: 0.2, animations: {
                    card.center = self.view.center
                    self.thumbImageView.alpha = 0
                })
            }
        }
    }
}

