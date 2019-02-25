//
//  SwitchingViewController.swift
//  ViewSwitcherBrianW
//
//  Created by Brian Wawczak on 2/24/19.
//  Copyright © 2019 Brian Wawczak. All rights reserved.
//

import UIKit

class SwitchingViewController: UIViewController {
    
private var blueViewController: BlueViewController!
private var yellowViewController: YellowViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // loads the BlueViewController instance from the same storyboard that contains the root view controller
        blueViewController = (storyboard?.instantiateViewController(withIdentifier: "Blue")as! BlueViewController)
        
        // sets the frame of the the blue view controller's view to be the same as that of the switch view controllers view
        blueViewController.view.frame = view.frame
        
        
        switchViewController(from: nil, to: blueViewController) //helper method
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        if blueViewController != nil && blueViewController!.view.superview == nil {
            blueViewController = nil
        }
        if yellowViewController != nil && yellowViewController!.view.superview == nil {
            yellowViewController = nil
        }
    }
    
    @IBAction func switchViews(sender: UIBarButtonItem){
        
        //checks for YellowView and creates new view, if required
        if yellowViewController?.view.superview == nil {
            if yellowViewController == nil {
                yellowViewController = (storyboard?.instantiateViewController(withIdentifier: "Yellow")
                    as! YellowViewController)
            }
            
        // checks for BlueView and creates new view, if required
        }else if blueViewController?.view.superview == nil{
            if blueViewController == nil {
                blueViewController = (storyboard?.instantiateViewController(withIdentifier: "Blue")
                    as! BlueViewController)
            }
        }
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        //Switch View Controllers
        if blueViewController != nil && blueViewController!.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            yellowViewController.view.frame = view.frame
            switchViewController(from: blueViewController, to: yellowViewController)
        } else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            blueViewController.view.frame = view.frame
            switchViewController(from: yellowViewController, to: blueViewController)
        }
        UIView.commitAnimations()
        
        
    }
    
    private func switchViewController(from fromVC:UIViewController?, to toVC:UIViewController?) {
        
        if fromVC != nil {
            fromVC!.willMove(toParent: nil)
            fromVC!.view.removeFromSuperview()
            fromVC!.removeFromParent()
        }
        
        if toVC != nil {
            self.addChild(toVC!)
            self.view.insertSubview(toVC!.view, at: 0)
            toVC!.didMove(toParent: self)
        }
    }
    
}
