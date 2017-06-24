/*
 SlideOutMenu.swift
 version : beta
 MIT License
 
 Copyright (c) 2017 Hani Althubaiti on 6/22/17.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
*/

import UIKit

@IBDesignable class SideOutMenu: UIViewController {
    
    //represents menu status
    enum Status{
        case Opened
        case Closed
    }

    /* Controllers defintions */
    var main:UIViewController?
    var menu:UIViewController?
    var menuStatus:Status = .Closed
    /* General Settings */
    var _shadow:Bool = false
    var _shadowColor:UIColor = UIColor.black
    var _shadowOpacity:Float = 1
    var _shadowRadius:CGFloat = 3
    var byPercentage = true;
    var menuWidth:CGFloat = 90;
    var menuShift:CGFloat?
    var mainShift:CGFloat?
    var _menuImage = UIImage(named: "menu")
    /* Storyboard IDs */
    var _mainID = "main"
    var _menuID = "menu"
    
    override func viewDidLoad(){
        super.viewDidLoad()
        //get main & menu VCL
        main = storyboard!.instantiateViewController(withIdentifier: mainID)
        menu = storyboard!.instantiateViewController(withIdentifier: menuID)
        //Add BarButton
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: _menuImage, style: UIBarButtonItemStyle.plain, target: self, action: #selector(handelMenu))
        //create left & right gesture
        createGesture()
        if menu != nil && main != nil{
            //width calculation
            if(byPercentage){
                menuShift = view.frame.width * menuWidth / 100.0
                mainShift = menuShift! + 1
            }else{
                menuShift = menuWidth
                mainShift = menuWidth
            }

            /* Add menu to container & configurations */
            self.addChildViewController(menu!)
            menu!.view.frame.size.width = menuShift!
            self.view.addSubview(menu!.view)
//            menu!.didMove(toParentViewController: self)
            menuStatus = .Closed
            /* Add main to container & configurations */
            self.addChildViewController(main!)
            self.view.addSubview(main!.view)
            //shadow settings
            if(_shadow){
                main!.view.layer.masksToBounds = false
                main!.view.layer.shadowColor = _shadowColor.cgColor
                main!.view.layer.shadowOffset = CGSize.zero
                main!.view.layer.shadowOpacity = _shadowOpacity
                main!.view.layer.shadowRadius = _shadowRadius
            }
//            main!.didMove(toParentViewController: self)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* Handling the menu */
    @IBAction func handelMenu(){
        UIView.animate(withDuration: 0.5, animations: {
            if(self.menuStatus == .Closed){
                if self.menu != nil && self.main != nil{
                    /* put the menu first */
                    let y = self.view.frame.origin.y
                    let w = self.view.frame.size.width
                    let h = self.view.frame.size.height
                    self.main!.view.frame = CGRect(x: self.mainShift!, y: y, width: w, height: h)
                    self.menuStatus = .Opened
                }
            }else{
                if self.menu != nil && self.main != nil{
                    let x = self.view.frame.origin.y
                    let y = self.view.frame.origin.y
                    let w = self.view.frame.size.width
                    let h = self.view.frame.size.height
                    self.main!.view.frame = CGRect(x: x, y: y, width: w, height: h)
                    self.menuStatus = .Closed
                }
            }
        })
    }
    
    /* Handling Gesture */
    func createGesture(){
        //left side
        let leftScreenEdgeRecognizer = UIScreenEdgePanGestureRecognizer(target: self,action: #selector(self.leftGesture))
        leftScreenEdgeRecognizer.edges = .left
        //right side
        let rightScreenEdgeRecognizer = UIScreenEdgePanGestureRecognizer(target: self,action: #selector(self.rightGesture))
        rightScreenEdgeRecognizer.edges = .right
        //add to the view
        view.addGestureRecognizer(leftScreenEdgeRecognizer)
        view.addGestureRecognizer(rightScreenEdgeRecognizer)
        
    }
    
    func leftGesture(_ recognizer: UIScreenEdgePanGestureRecognizer){
        if(recognizer.state == .recognized && menuStatus == .Closed){
            handelMenu()
        }
    }
    
    func rightGesture(_ recognizer: UIScreenEdgePanGestureRecognizer){
        if(recognizer.state == .recognized && menuStatus == .Opened){
            handelMenu()
        }
    }
    /* End of handling gesture */
    
    override func viewWillDisappear(_ animated: Bool) {
        //in case of the menu is opend
        if(menuStatus == .Opened){
            handelMenu()
        }
    }
    
    /* General Settings */
    @IBInspectable public var enableShadow: Bool = false {
        didSet {
            _shadow = enableShadow
        }
    }
    
    @IBInspectable public var shadowColor: UIColor = UIColor.black {
        didSet {
            _shadowColor = shadowColor
        }
    }
    
    @IBInspectable public var shadowOpacity: Float = 1.0 {
        didSet {
            if(shadowOpacity > 1){
                shadowOpacity = 1
            }else if(shadowOpacity < 0){
                shadowOpacity = 0
            }
            _shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable public var shadowRadius: CGFloat = 3.0 {
        didSet {
            _shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable public var mainID: String = "main" {
        didSet {
            _mainID = mainID
        }
    }
    
    @IBInspectable public var menuID: String = "menu" {
        didSet {
            _menuID = menuID
        }
    }
    
    @IBInspectable public var shiftMenuByPercentage: Bool = true {
        didSet {
            byPercentage = shiftMenuByPercentage
        }
    }
    
    @IBInspectable public var shiftValue: CGFloat = 90 {
        didSet {
            if(byPercentage){
                if(shiftValue > 100){
                    shiftValue = 100
                }else if(shiftValue < 0){
                    shiftValue = 0
                }
            }
            menuWidth = shiftValue
        }
    }
    
    @IBInspectable public var menuImage: UIImage = UIImage(named:"menu")! {
        didSet {
            _menuImage = menuImage
        }
    }
}
