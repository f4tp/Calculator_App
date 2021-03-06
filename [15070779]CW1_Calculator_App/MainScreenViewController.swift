//
//  ViewController.swift
//  [15070779]CW1_Calculator_App
//
//  Created by Paul Treadwell on 16/10/2016.
//  Copyright © 2016 Paul Treadwell. All rights reserved.
//

import UIKit
import AVFoundation //framework that handles playing sounds in the app

//project global variables - all need to be accessed by other swift files so have been declared outside of class

//instance of audio player to handle sound playing
var audioPlayer: AVAudioPlayer!


//random integers to create the math formulae, randomised with viewDidLoad
var intRandNumber1: Int = 0
var intRandNumber2: Int = 0

//global variable set up to match user's answer to, will be assigned the correct value after Random numbers have been generated (viewDidLoad
var intTotal:Int = 0


/* variables for the flawed applesnap routine, not used now so commented out

//variables accessible outside of class as they are assigned in constrain apple movement swift file and used in this file
var draggedView: UIView!
var point = CGPoint (x: 0, y:0)

 */

class ViewController: UIViewController {


//@@@@@@@@ GLOBAL VARIABLES @@@@@@@@@@
    

    

   
    //variables for testing screen size to programmatically set up the layout, needs to be global as more than one function has access to these values (e.g. screen size function and animation)


    
    //@@@@@@@@@@ OUTLETS @@@@@@@@@@
    
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var lblFormulae: UILabel!
    @IBOutlet weak var plateImage: UIImageView!
    @IBOutlet weak var apple1: draggable_UIImageView!
    @IBOutlet weak var apple2: draggable_UIImageView!
    @IBOutlet weak var apple3: draggable_UIImageView!
    @IBOutlet weak var apple4: draggable_UIImageView!
    @IBOutlet weak var apple5: draggable_UIImageView!
    @IBOutlet weak var apple6: draggable_UIImageView!
    @IBOutlet weak var apple7: draggable_UIImageView!
    @IBOutlet weak var apple8: draggable_UIImageView!
    @IBOutlet weak var apple9: draggable_UIImageView!
    @IBOutlet weak var apple10: draggable_UIImageView!
    @IBOutlet weak var imgCloud1: UIImageView!
    @IBOutlet weak var imgCloud2: UIImageView!
    //instances of apples catches - to control to 'snap into place' action, these are UIImageViews
    @IBOutlet weak var UIIVappleCatcherLeft1: UIImageView!
    @IBOutlet weak var UIIVappleCatcherLeft2: UIImageView!
    @IBOutlet weak var UIIVappleCatcherLeft3: UIImageView!
    @IBOutlet weak var UIIVappleCatcherLeft4: UIImageView!
    @IBOutlet weak var UIIVappleCatcherRight1: UIImageView!
    @IBOutlet weak var UIIVappleCatcherRight2: UIImageView!
    @IBOutlet weak var UIIVappleCatcherRight3: UIImageView!
    @IBOutlet weak var UIIVappleCatcherRight4: UIImageView!
    
    

    //routines for the flawed gestureRecognizer routine for dragging apples (which worked) and the snapApples routine to snap them into place to stop over lapping (which was flawed)
    


    //instances of Pan gesture - to detect drag user interaction for each apple, and to controls state.ended to test to see if drag has ended to snap apples into place, have to be global as they are accessed in different procedures - e.g. dragUIImageView(), and snapToApples()
    
    /*
    var gesture1 = UIPanGestureRecognizer()
    var gesture2 = UIPanGestureRecognizer()
    var gesture3 = UIPanGestureRecognizer()
    var gesture4 = UIPanGestureRecognizer()
    var gesture5 = UIPanGestureRecognizer()
    var gesture6 = UIPanGestureRecognizer()
    var gesture7 = UIPanGestureRecognizer()
    var gesture8 = UIPanGestureRecognizer()
    var gesture9 = UIPanGestureRecognizer()
    var gesture10 = UIPanGestureRecognizer()
    
 
*/
    
    
//@@@@@@@@@@ OVERRIDDEN FUNCTIONS FROM SUPER CLASS @@@@@@@@@@
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
        
        
    //routines for the flawed gestureRecognizer routine for dragging apples (which worked) and the snapApples routine to snap them into place to stop over lapping (which was flawed)
        
/*
        
        //onload, initialise the panGesture routine, will test to see if the gesture state has ended later to snap apples into place
        gesture1 = UIPanGestureRecognizer(target: self, action: #selector(dragUIImageView))
        gesture2 = UIPanGestureRecognizer(target: self, action: #selector(dragUIImageView))
        gesture3 = UIPanGestureRecognizer(target: self, action: #selector(dragUIImageView))
        gesture4 = UIPanGestureRecognizer(target: self, action: #selector(dragUIImageView))
        gesture5 = UIPanGestureRecognizer(target: self, action: #selector(dragUIImageView))
        gesture6 = UIPanGestureRecognizer(target: self, action: #selector(dragUIImageView))
        gesture7 = UIPanGestureRecognizer(target: self, action: #selector(dragUIImageView))
        gesture8 = UIPanGestureRecognizer(target: self, action: #selector(dragUIImageView))
        gesture9 = UIPanGestureRecognizer(target: self, action: #selector(dragUIImageView))
        gesture10 = UIPanGestureRecognizer(target: self, action: #selector(dragUIImageView))
        
        
        apple1.addGestureRecognizer(gesture1)
        apple2.addGestureRecognizer(gesture2)
        apple3.addGestureRecognizer(gesture3)
        apple4.addGestureRecognizer(gesture4)
        apple5.addGestureRecognizer(gesture5)
        apple6.addGestureRecognizer(gesture6)
        apple7.addGestureRecognizer(gesture7)
        apple8.addGestureRecognizer(gesture8)
        apple9.addGestureRecognizer(gesture9)
        apple10.addGestureRecognizer(gesture10)
        
  */
        
        
        
        
        //random integer numbers generated for sum formulae, global as difference functions need access to these - e.g. sending across in the segue - used in  the view for both viewcontrollers
        intRandNumber1 = Int(arc4random_uniform(5))
        intRandNumber2 = Int(arc4random_uniform(5))
        
        
        //routines for basic functionality
        
        
        
        intTotal = intRandNumber1 + intRandNumber2
        
        lblFormulae.text = String(intRandNumber1) + " + " + String(intRandNumber2) + " = ?"
        
        
        //play correct sound based on random integers generated
        playCorrectSound()
        
   
        
        //run routine to meause screen size when the view loads
        measureScreenSize()
        
        
    }
    
    //no routines in place to cater for memory errors
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //programmatically sets up the layout of this view
    override func viewWillLayoutSubviews() {
        
        
    //routines for the flawed gestureRecognizer routine for dragging apples (which worked) and the snapApples routine to snap them into place to stop over lapping (which was flawed)
        
        /*
        UIIVappleCatcherLeft1.layer.borderColor = UIColor.black.cgColor
        UIIVappleCatcherLeft1.layer.borderWidth = 1.0
        
        UIIVappleCatcherLeft2.layer.borderColor = UIColor.black.cgColor
        UIIVappleCatcherLeft2.layer.borderWidth = 1.0
        
        UIIVappleCatcherLeft3.layer.borderColor = UIColor.black.cgColor
        UIIVappleCatcherLeft3.layer.borderWidth = 1.0
        
        UIIVappleCatcherLeft4.layer.borderColor = UIColor.black.cgColor
        UIIVappleCatcherLeft4.layer.borderWidth = 1.0
        
        UIIVappleCatcherRight1.layer.borderColor = UIColor.black.cgColor
        UIIVappleCatcherRight1.layer.borderWidth = 1.0
        
        UIIVappleCatcherRight2.layer.borderColor = UIColor.black.cgColor
        UIIVappleCatcherRight2.layer.borderWidth = 1.0
        
        UIIVappleCatcherRight3.layer.borderColor = UIColor.black.cgColor
        UIIVappleCatcherRight3.layer.borderWidth = 1.0
        
        UIIVappleCatcherRight4.layer.borderColor = UIColor.black.cgColor
        UIIVappleCatcherRight4.layer.borderWidth = 1.0
 
 */
        
        if PhoneScreenType == "5" {
            
            var rect = button0.frame
            rect.origin.x = 10
            rect.origin.y = 20
            rect.size.width = 55
            rect.size.height = 55
            button0.frame = rect
            
            rect = button1.frame
            rect.origin.x = 70
            rect.origin.y = 20
            rect.size.width = 55
            rect.size.height = 55
            button1.frame = rect
            
            rect = button2.frame
            rect.origin.x = 130
            rect.origin.y = 20
            rect.size.width = 55
            rect.size.height = 55
            button2.frame = rect
            
            rect = button3.frame
            rect.origin.x = 190
            rect.origin.y = 20
            rect.size.width = 55
            rect.size.height = 55
            button3.frame = rect
            
            rect = button4.frame
            rect.origin.x = 250
            rect.origin.y = 20
            rect.size.width = 55
            rect.size.height = 55
            button4.frame = rect
            
            rect = button5.frame
            rect.origin.x = 10
            rect.origin.y = 100
            rect.size.width = 55
            rect.size.height = 55
            button5.frame = rect
            
            rect = button6.frame
            rect.origin.x = 70
            rect.origin.y = 100
            rect.size.width = 55
            rect.size.height = 55
            button6.frame = rect
            
            rect = button7.frame
            rect.origin.x = 130
            rect.origin.y = 100
            rect.size.width = 55
            rect.size.height = 55
            button7.frame = rect
            
            rect = button8.frame
            rect.origin.x = 190
            rect.origin.y = 100
            rect.size.width = 55
            rect.size.height = 55
            button8.frame = rect
            
            rect = button9.frame
            rect.origin.x = 250
            rect.origin.y = 100
            rect.size.width = 55
            rect.size.height = 55
            button9.frame = rect
            
            rect = lblFormulae.frame
            rect.origin.x = 5
            rect.origin.y = 165
            rect.size.width = 315
            rect.size.height = 100
            lblFormulae.frame = rect
            
            
            rect = plateImage.frame
            rect.origin.x = 0
            rect.origin.y = 375
            rect.size.width = 320
            rect.size.height = 250
            plateImage.frame = rect
            
            rect = apple1.frame
            rect.origin.x = 30
            rect.origin.y = 458
            rect.size.width = 55
            rect.size.height = 55
            apple1.frame = rect
            
            rect = apple2.frame
            rect.origin.x = 65
            rect.origin.y = 440
            rect.size.width = 55
            rect.size.height = 55
            apple2.frame = rect
            
            rect = apple3.frame
            rect.origin.x = 130
            rect.origin.y = 440
            rect.size.width = 55
            rect.size.height = 55
            apple3.frame = rect
            
            rect = apple4.frame
            rect.origin.x = 190
            rect.origin.y = 440
            rect.size.width = 55
            rect.size.height = 55
            apple4.frame = rect
            
            rect = apple5.frame
            rect.origin.x = 240
            rect.origin.y = 458
            rect.size.width = 55
            rect.size.height = 55
            apple5.frame = rect
            
            rect = apple6.frame
            rect.origin.x = 85
            rect.origin.y = 462
            rect.size.width = 55
            rect.size.height = 55
            apple6.frame = rect
            
            rect = apple7.frame
            rect.origin.x = 65
            rect.origin.y = 485
            rect.size.width = 55
            rect.size.height = 55
            apple7.frame = rect
            
            rect = apple8.frame
            rect.origin.x = 130
            rect.origin.y = 485
            rect.size.width = 55
            rect.size.height = 55
            apple8.frame = rect
            
            rect = apple9.frame
            rect.origin.x = 190
            rect.origin.y = 485
            rect.size.width = 55
            rect.size.height = 55
            apple9.frame = rect
            
            rect = apple10.frame
            rect.origin.x = 160
            rect.origin.y = 462
            rect.size.width = 55
            rect.size.height = 55
            apple10.frame = rect
            
            rect = imgCloud1.frame
            rect.origin.x = 0
            rect.origin.y = -26
            rect.size.width = 190
            rect.size.height = 90
            imgCloud1.frame = rect
            
            rect = imgCloud2.frame
            rect.origin.x = 0
            rect.origin.y = 65
            rect.size.width = 190
            rect.size.height = 90
            imgCloud2.frame = rect
            
            rect = UIIVappleCatcherLeft1.frame
            rect.origin.x = 0
            rect.origin.y = 255
            rect.size.width = 70
            rect.size.height = 80
            UIIVappleCatcherLeft1.frame = rect
            
            rect = UIIVappleCatcherLeft2.frame
            rect.origin.x = 0
            rect.origin.y = 345
            rect.size.width = 70
            rect.size.height = 80
            UIIVappleCatcherLeft2.frame = rect
            
            rect = UIIVappleCatcherLeft3.frame
            rect.origin.x = 83
            rect.origin.y = 255
            rect.size.width = 70
            rect.size.height = 80
            UIIVappleCatcherLeft3.frame = rect
            
            rect = UIIVappleCatcherLeft4.frame
            rect.origin.x = 83
            rect.origin.y = 345
            rect.size.width = 70
            rect.size.height = 80
            UIIVappleCatcherLeft4.frame = rect
            
            rect = UIIVappleCatcherRight1.frame
            rect.origin.x = 167
            rect.origin.y = 255
            rect.size.width = 70
            rect.size.height = 80
            UIIVappleCatcherRight1.frame = rect
            
            rect = UIIVappleCatcherRight2.frame
            rect.origin.x = 167
            rect.origin.y = 345
            rect.size.width = 70
            rect.size.height = 80
            UIIVappleCatcherRight2.frame = rect
            
            rect = UIIVappleCatcherRight3.frame
            rect.origin.x = 250
            rect.origin.y = 255
            rect.size.width = 70
            rect.size.height = 80
            UIIVappleCatcherRight3.frame = rect
            
            rect = UIIVappleCatcherRight4.frame
            rect.origin.x = 250
            rect.origin.y = 345
            rect.size.width = 70
            rect.size.height = 80
            UIIVappleCatcherRight4.frame = rect
            
 
        }
        
        if PhoneScreenType == "6.7" {
            
            var rect = button0.frame
            rect.origin.x = 20
            rect.origin.y = 20
            rect.size.width = 55
            rect.size.height = 55
            button0.frame = rect
            
            rect = button1.frame
            rect.origin.x = 90
            rect.origin.y = 20
            rect.size.width = 55
            rect.size.height = 55
            button1.frame = rect
            
            rect = button2.frame
            rect.origin.x = 160
            rect.origin.y = 20
            rect.size.width = 55
            rect.size.height = 55
            button2.frame = rect
            
            rect = button3.frame
            rect.origin.x = 230
            rect.origin.y = 20
            rect.size.width = 55
            rect.size.height = 55
            button3.frame = rect
            
            rect = button4.frame
            rect.origin.x = 300
            rect.origin.y = 20
            rect.size.width = 55
            rect.size.height = 55
            button4.frame = rect
            
            rect = button5.frame
            rect.origin.x = 20
            rect.origin.y = 100
            rect.size.width = 55
            rect.size.height = 55
            button5.frame = rect
            
            rect = button6.frame
            rect.origin.x = 90
            rect.origin.y = 100
            rect.size.width = 55
            rect.size.height = 55
            button6.frame = rect
            
            rect = button7.frame
            rect.origin.x = 160
            rect.origin.y = 100
            rect.size.width = 55
            rect.size.height = 55
            button7.frame = rect
            
            rect = button8.frame
            rect.origin.x = 230
            rect.origin.y = 100
            rect.size.width = 55
            rect.size.height = 55
            button8.frame = rect
            
            rect = button9.frame
            rect.origin.x = 300
            rect.origin.y = 100
            rect.size.width = 55
            rect.size.height = 55
            button9.frame = rect
            
            rect = lblFormulae.frame
            rect.origin.x = 5
            rect.origin.y = 190
            rect.size.width = 370
            rect.size.height = 100
            lblFormulae.frame = rect
            
            rect = plateImage.frame
            rect.origin.x = 0
            rect.origin.y = 420
            rect.size.width = 375
            rect.size.height = 300
            plateImage.frame = rect
            
            rect = apple1.frame
            rect.origin.x = 45
            rect.origin.y = 528
            rect.size.width = 55
            rect.size.height = 55
            apple1.frame = rect
            
            rect = apple2.frame
            rect.origin.x = 100
            rect.origin.y = 510
            rect.size.width = 55
            rect.size.height = 55
            apple2.frame = rect
            
            rect = apple3.frame
            rect.origin.x = 165
            rect.origin.y = 510
            rect.size.width = 55
            rect.size.height = 55
            apple3.frame = rect
            
            rect = apple4.frame
            rect.origin.x = 225
            rect.origin.y = 510
            rect.size.width = 55
            rect.size.height = 55
            apple4.frame = rect
            
            rect = apple5.frame
            rect.origin.x = 290
            rect.origin.y = 528
            rect.size.width = 55
            rect.size.height = 55
            apple5.frame = rect
            
            rect = apple6.frame
            rect.origin.x = 130
            rect.origin.y = 532
            rect.size.width = 55
            rect.size.height = 55
            apple6.frame = rect
            
            rect = apple7.frame
            rect.origin.x = 100
            rect.origin.y = 555
            rect.size.width = 55
            rect.size.height = 55
            apple7.frame = rect
            
            rect = apple8.frame
            rect.origin.x = 165
            rect.origin.y = 555
            rect.size.width = 55
            rect.size.height = 55
            apple8.frame = rect
            
            rect = apple9.frame
            rect.origin.x = 225
            rect.origin.y = 555
            rect.size.width = 55
            rect.size.height = 55
            apple9.frame = rect
            
            rect = apple10.frame
            rect.origin.x = 195
            rect.origin.y = 532
            rect.size.width = 55
            rect.size.height = 55
            apple10.frame = rect
            
            rect = imgCloud1.frame
            rect.origin.x = 0
            rect.origin.y = -26
            rect.size.width = 190
            rect.size.height = 90
            imgCloud1.frame = rect
            
            rect = imgCloud2.frame
            rect.origin.x = 0
            rect.origin.y = 65
            rect.size.width = 190
            rect.size.height = 90
            imgCloud2.frame = rect
            
            rect = UIIVappleCatcherRight3.frame
            rect.origin.x = 291
            rect.origin.y = 285
            rect.size.width = 84
            rect.size.height = 90
            UIIVappleCatcherRight3.frame = rect
            
            rect = UIIVappleCatcherRight1.frame
            rect.origin.x = 194
            rect.origin.y = 285
            rect.size.width = 84
            rect.size.height = 90
            UIIVappleCatcherRight1.frame = rect
            
            rect = UIIVappleCatcherLeft3.frame
            rect.origin.x = 97
            rect.origin.y = 285
            rect.size.width = 84
            rect.size.height = 90
            UIIVappleCatcherLeft3.frame = rect
            
            rect = UIIVappleCatcherLeft1.frame
            rect.origin.x = 0
            rect.origin.y = 285
            rect.size.width = 84
            rect.size.height = 90
            UIIVappleCatcherLeft1.frame = rect
            
            rect = UIIVappleCatcherRight4.frame
            rect.origin.x = 291
            rect.origin.y = 390
            rect.size.width = 84
            rect.size.height = 90
            UIIVappleCatcherRight4.frame = rect
            
            rect = UIIVappleCatcherRight2.frame
            rect.origin.x = 194
            rect.origin.y = 390
            rect.size.width = 84
            rect.size.height = 90
            UIIVappleCatcherRight2.frame = rect
            
            
            rect = UIIVappleCatcherLeft4.frame
            rect.origin.x = 97
            rect.origin.y = 390
            rect.size.width = 84
            rect.size.height = 90
            UIIVappleCatcherLeft4.frame = rect
            
            rect = UIIVappleCatcherLeft2.frame
            rect.origin.x = 0
            rect.origin.y = 390
            rect.size.width = 84
            rect.size.height = 90
            UIIVappleCatcherLeft2.frame = rect
           
            
        }
        
        if PhoneScreenType == "6.7.plus" {
            
            var rect = button0.frame
            rect.origin.x = 20
            rect.origin.y = 20
            rect.size.width = 60
            rect.size.height = 60
            button0.frame = rect
            
            rect = button1.frame
            rect.origin.x = 95
            rect.origin.y = 20
            rect.size.width = 60
            rect.size.height = 60
            button1.frame = rect
            
            rect = button2.frame
            rect.origin.x = 170
            rect.origin.y = 20
            rect.size.width = 60
            rect.size.height = 60
            button2.frame = rect
            
            rect = button3.frame
            rect.origin.x = 245
            rect.origin.y = 20
            rect.size.width = 60
            rect.size.height = 60
            button3.frame = rect
            
            rect = button4.frame
            rect.origin.x = 320
            rect.origin.y = 20
            rect.size.width = 60
            rect.size.height = 60
            button4.frame = rect
            
            rect = button5.frame
            rect.origin.x = 20
            rect.origin.y = 100
            rect.size.width = 60
            rect.size.height = 60
            button5.frame = rect
            
            rect = button6.frame
            rect.origin.x = 95
            rect.origin.y = 100
            rect.size.width = 60
            rect.size.height = 60
            button6.frame = rect
            
            rect = button7.frame
            rect.origin.x = 170
            rect.origin.y = 100
            rect.size.width = 60
            rect.size.height = 60
            button7.frame = rect
            
            rect = button8.frame
            rect.origin.x = 245
            rect.origin.y = 100
            rect.size.width = 60
            rect.size.height = 60
            button8.frame = rect
            
            rect = button9.frame
            rect.origin.x = 320
            rect.origin.y = 100
            rect.size.width = 60
            rect.size.height = 60
            button9.frame = rect
            
            rect = lblFormulae.frame
            rect.origin.x = 5
            rect.origin.y = 160
            rect.size.width = 409
            rect.size.height = 150
            lblFormulae.frame = rect
            
            rect = plateImage.frame
            rect.origin.x = 0
            rect.origin.y = 480
            rect.size.width = 425
            rect.size.height = 350
            plateImage.frame = rect
            
            rect = apple1.frame
            rect.origin.x = 55
            rect.origin.y = 612
            rect.size.width = 60
            rect.size.height = 60
            apple1.frame = rect
            
            rect = apple2.frame
            rect.origin.x = 110
            rect.origin.y = 590
            rect.size.width = 60
            rect.size.height = 60
            apple2.frame = rect
            
            rect = apple3.frame
            rect.origin.x = 175
            rect.origin.y = 590
            rect.size.width = 60
            rect.size.height = 60
            apple3.frame = rect
            
            rect = apple4.frame
            rect.origin.x = 235
            rect.origin.y = 590
            rect.size.width = 60
            rect.size.height = 60
            apple4.frame = rect
            
            rect = apple5.frame
            rect.origin.x = 300
            rect.origin.y = 612
            rect.size.width = 60
            rect.size.height = 60
            apple5.frame = rect
            
            rect = apple6.frame
            rect.origin.x = 140
            rect.origin.y = 612
            rect.size.width = 60
            rect.size.height = 60
            apple6.frame = rect
            
            rect = apple7.frame
            rect.origin.x = 110
            rect.origin.y = 635
            rect.size.width = 60
            rect.size.height = 60
            apple7.frame = rect
            
            rect = apple8.frame
            rect.origin.x = 175
            rect.origin.y = 635
            rect.size.width = 60
            rect.size.height = 60
            apple8.frame = rect
            
            rect = apple9.frame
            rect.origin.x = 235
            rect.origin.y = 635
            rect.size.width = 60
            rect.size.height = 60
            apple9.frame = rect
            
            rect = apple10.frame
            rect.origin.x = 205
            rect.origin.y = 612
            rect.size.width = 60
            rect.size.height = 60
            apple10.frame = rect
            
            rect = imgCloud1.frame
            rect.origin.x = 0
            rect.origin.y = -26
            rect.size.width = 190
            rect.size.height = 90
            imgCloud1.frame = rect
            
            rect = imgCloud2.frame
            rect.origin.x = 0
            rect.origin.y = 85
            rect.size.width = 190
            rect.size.height = 90
            imgCloud2.frame = rect
            
            rect = UIIVappleCatcherRight3.frame
            rect.origin.x = 321
            rect.origin.y = 306
            rect.size.width = 93
            rect.size.height = 104
            UIIVappleCatcherRight3.frame = rect
            
            rect = UIIVappleCatcherRight1.frame
            rect.origin.x = 213
            rect.origin.y = 306
            rect.size.width = 93
            rect.size.height = 104
            UIIVappleCatcherRight1.frame = rect
            
            rect = UIIVappleCatcherLeft3.frame
            rect.origin.x = 107
            rect.origin.y = 306
            rect.size.width = 93
            rect.size.height = 104
            UIIVappleCatcherLeft3.frame = rect
            
            rect = UIIVappleCatcherLeft1.frame
            rect.origin.x = 0
            rect.origin.y = 306
            rect.size.width = 93
            rect.size.height = 104
            UIIVappleCatcherLeft1.frame = rect
            
            
            
            rect = UIIVappleCatcherRight4.frame
            rect.origin.x = 321
            rect.origin.y = 440
            rect.size.width = 93
            rect.size.height = 104
            UIIVappleCatcherRight4.frame = rect
            
            rect = UIIVappleCatcherRight2.frame
            rect.origin.x = 213
            rect.origin.y = 440
            rect.size.width = 93
            rect.size.height = 104
            UIIVappleCatcherRight2.frame = rect
            
            
            rect = UIIVappleCatcherLeft4.frame
            rect.origin.x = 107
            rect.origin.y = 440
            rect.size.width = 93
            rect.size.height = 104
            UIIVappleCatcherLeft4.frame = rect
            
            rect = UIIVappleCatcherLeft2.frame
            rect.origin.x = 0
            rect.origin.y = 440
            rect.size.width = 93
            rect.size.height = 104
            UIIVappleCatcherLeft2.frame = rect
            
            
            //increase font size for plus sized screen
            lblFormulae.font = lblFormulae.font.withSize(72.0)
            
            
        }

        
        
    }
    
    //transfers formulae data (random numbers 1 and 2, and the total) to display on the next UIViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "mainToWin"){
            
            let DestViewController  = segue.destination as! WinScreenViewController
            
            DestViewController.stringRandNo1 = String(intRandNumber1)
            
            DestViewController.stringRandNo2 = String(intRandNumber2)
            
            DestViewController.stringAnswer = String(intTotal)
            
        }
            
        else {
            //error handling message for future developers
            print ("segue identifier not found")
        }
        
    }
    
//@@@@@@@@ FUNCTIONS I CREATED @@@@@@@@@@
    
    
//routines for the flawed gestureRecognizer routine for dragging apples (which worked) and the snapApples routine to snap them into place to stop over lapping (which was flawed)
    

    
    //clouds animation - random timing, all relative to screen size so should work on all screen sizes. Cannot create independent class for this yet as the routine is relative to screen size and working inside of the UIImageView sub class and getting values out of the viewcontroller class into these might be tricky (maybe working with delegates) - if I get time I will look at doing this, but for now - leave them in here
    
    override func viewWillAppear(_ animated: Bool) {
        //set the x value of each cloud image to whatever it is at the moment + the width of the screen it is being viewed on >moves it off of the screen to the right
        
        imgCloud1.center.x += screenWidth!
        imgCloud2.center.x += screenWidth!
  
        //animation routine, one for first cloud, one for second cloud. It animates the cloud by reducing the x value of each on screen by the width of the screen > moves them from off the screen from the right to the left back on the screen
        
        UIView.animate(withDuration: TimeInterval(randomBetweenNumbers(firstNum: 1.0,secondNum: 10.0)), delay: 0.0, options: [.repeat, .curveLinear], animations: {
            self.imgCloud1.center.x -= self.view.bounds.width
         
            })
        
        UIView.animate(withDuration: TimeInterval(randomBetweenNumbers(firstNum: 1.0,secondNum: 10.0)), delay: TimeInterval(randomBetweenNumbers(firstNum: 1.0,secondNum: 10.0)), options: [.repeat, .curveLinear], animations: {
                self.imgCloud2.center.x -= self.view.bounds.width
            })

        
        
    }

//@@@@@@@@@@ BUTTON CLICK EVENTS @@@@@@@@@@
    
    //all handles button clicks to submit answer. Causes segue to WinScreen when answer is correct, or plays a 'boing' sound if they are not
    @IBAction func tuButton0(_ sender: AnyObject) {
        if (intTotal == 0) {
            self.performSegue(withIdentifier: "mainToWin", sender: nil)
        }
        
        else {
            
            playsound(soundTitle: "Boing", soundOfType: "wav")
            
        }
    }
    
    @IBAction func tuButton1(_ sender: AnyObject) {
        if (intTotal == 1) {
            self.performSegue(withIdentifier: "mainToWin", sender: nil)
        }
        
        else {
            
            playsound(soundTitle: "Boing", soundOfType: "wav")
            
        }
    }
    
    @IBAction func tuButton2(_ sender: AnyObject) {
        if (intTotal == 2) {
            self.performSegue(withIdentifier: "mainToWin", sender: nil)
        }
        
        else {
            
            playsound(soundTitle: "Boing", soundOfType: "wav")
            
        }
    }
    
    @IBAction func tuButton3(_ sender: AnyObject) {
        if (intTotal == 3) {
            self.performSegue(withIdentifier: "mainToWin", sender: nil)
        }
        
        else {
            
            playsound(soundTitle: "Boing", soundOfType: "wav")
            
        }
    }
    
    @IBAction func tuButton4(_ sender: AnyObject) {
        if (intTotal == 4) {
            self.performSegue(withIdentifier: "mainToWin", sender: nil)
        }
        
        else {
            
            playsound(soundTitle: "Boing", soundOfType: "wav")
            
        }
    }
    
    @IBAction func tuButton5(_ sender: AnyObject) {
        if (intTotal == 5) {
            self.performSegue(withIdentifier: "mainToWin", sender: nil)
        }
        
        else {
            
            playsound(soundTitle: "Boing", soundOfType: "wav")
            
        }
    }
    
    @IBAction func tuButton6(_ sender: AnyObject) {
        if (intTotal == 6) {
            self.performSegue(withIdentifier: "mainToWin", sender: nil)
        }
        
        else {
            
            playsound(soundTitle: "Boing", soundOfType: "wav")
            
        }
    }
    
    @IBAction func tuButton7(_ sender: AnyObject) {
        if (intTotal == 7) {
            self.performSegue(withIdentifier: "mainToWin", sender: nil)
        }
        
        else {
            
            playsound(soundTitle: "Boing", soundOfType: "wav")
            
        }
    }
    
    @IBAction func tuButton8(_ sender: AnyObject) {
        if (intTotal == 8) {
            self.performSegue(withIdentifier: "mainToWin", sender: nil)
        }
        
        else {
            
            playsound(soundTitle: "Boing", soundOfType: "wav")
            
        }
    }
    
    @IBAction func tuButton9(_ sender: AnyObject) {
         if (intTotal == 9) {
            self.performSegue(withIdentifier: "mainToWin", sender: nil)
        }
        
        else {
            
            playsound(soundTitle: "Boing", soundOfType: "wav")
            
        }
    }
    
    /*
     
     //routine allows you to drag apples / constrains them
     public func dragUIImageView (_sender: UIPanGestureRecognizer){
     
     point = _sender.location(in: view)
     draggedView = _sender.view!
     
     //calls 2 procedures, constrainAppleMovement is called all the time the drag is going on, snap apples when the state of the panGestureRec. ended is true
     
     constrainAppleMovement()
     snapApples()
     
     
     }
     
     
     
     
     //routine allows you to snap apples into place so they don't overlap, forgiving, easier to be counted, still has problems though - tried implementing a routine to stop apples overlapping in each pot, but no luck - not enough time
     public func snapApples(){
     if gesture1.state == UIGestureRecognizerState.ended {
     if draggedView.frame.intersects(UIIVappleCatcherLeft1.frame){
     draggedView.center = UIIVappleCatcherLeft1.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherLeft2.frame){
     draggedView.center = UIIVappleCatcherLeft2.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherLeft3.frame){
     draggedView.center = UIIVappleCatcherLeft3.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherLeft4.frame){
     draggedView.center = UIIVappleCatcherLeft4.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight1.frame){
     draggedView.center = UIIVappleCatcherRight1.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight2.frame){
     draggedView.center = UIIVappleCatcherRight2.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight3.frame){
     draggedView.center = UIIVappleCatcherRight3.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight4.frame){
     draggedView.center = UIIVappleCatcherRight4.center
     }
     }
     if gesture2.state == UIGestureRecognizerState.ended {
     if draggedView.frame.intersects(UIIVappleCatcherLeft1.frame){
     draggedView.center = UIIVappleCatcherLeft1.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherLeft2.frame){
     draggedView.center = UIIVappleCatcherLeft2.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherLeft3.frame){
     draggedView.center = UIIVappleCatcherLeft3.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherLeft4.frame){
     draggedView.center = UIIVappleCatcherLeft4.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight1.frame){
     draggedView.center = UIIVappleCatcherRight1.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight2.frame){
     draggedView.center = UIIVappleCatcherRight2.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight3.frame){
     draggedView.center = UIIVappleCatcherRight3.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight4.frame){
     draggedView.center = UIIVappleCatcherRight4.center
     }
     }
     if gesture3.state == UIGestureRecognizerState.ended {
     if draggedView.frame.intersects(UIIVappleCatcherLeft1.frame){
     draggedView.center = UIIVappleCatcherLeft1.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherLeft2.frame){
     draggedView.center = UIIVappleCatcherLeft2.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherLeft3.frame){
     draggedView.center = UIIVappleCatcherLeft3.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherLeft4.frame){
     draggedView.center = UIIVappleCatcherLeft4.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight1.frame){
     draggedView.center = UIIVappleCatcherRight1.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight2.frame){
     draggedView.center = UIIVappleCatcherRight2.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight3.frame){
     draggedView.center = UIIVappleCatcherRight3.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight4.frame){
     draggedView.center = UIIVappleCatcherRight4.center
     }
     }
     if gesture4.state == UIGestureRecognizerState.ended {
     if draggedView.frame.intersects(UIIVappleCatcherLeft1.frame){
     draggedView.center = UIIVappleCatcherLeft1.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherLeft2.frame){
     draggedView.center = UIIVappleCatcherLeft2.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherLeft3.frame){
     draggedView.center = UIIVappleCatcherLeft3.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherLeft4.frame){
     draggedView.center = UIIVappleCatcherLeft4.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight1.frame){
     draggedView.center = UIIVappleCatcherRight1.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight2.frame){
     draggedView.center = UIIVappleCatcherRight2.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight3.frame){
     draggedView.center = UIIVappleCatcherRight3.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight4.frame){
     draggedView.center = UIIVappleCatcherRight4.center
     }
     }
     if gesture5.state == UIGestureRecognizerState.ended {
     if draggedView.frame.intersects(UIIVappleCatcherLeft1.frame){
     draggedView.center = UIIVappleCatcherLeft1.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherLeft2.frame){
     draggedView.center = UIIVappleCatcherLeft2.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherLeft3.frame){
     draggedView.center = UIIVappleCatcherLeft3.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherLeft4.frame){
     draggedView.center = UIIVappleCatcherLeft4.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight1.frame){
     draggedView.center = UIIVappleCatcherRight1.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight2.frame){
     draggedView.center = UIIVappleCatcherRight2.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight3.frame){
     draggedView.center = UIIVappleCatcherRight3.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight4.frame){
     draggedView.center = UIIVappleCatcherRight4.center
     }
     }
     if gesture6.state == UIGestureRecognizerState.ended {
     if draggedView.frame.intersects(UIIVappleCatcherLeft1.frame){
     draggedView.center = UIIVappleCatcherLeft1.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherLeft2.frame){
     draggedView.center = UIIVappleCatcherLeft2.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherLeft3.frame){
     draggedView.center = UIIVappleCatcherLeft3.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherLeft4.frame){
     draggedView.center = UIIVappleCatcherLeft4.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight1.frame){
     draggedView.center = UIIVappleCatcherRight1.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight2.frame){
     draggedView.center = UIIVappleCatcherRight2.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight3.frame){
     draggedView.center = UIIVappleCatcherRight3.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight4.frame){
     draggedView.center = UIIVappleCatcherRight4.center
     }
     }
     if gesture7.state == UIGestureRecognizerState.ended {
     if draggedView.frame.intersects(UIIVappleCatcherLeft1.frame){
     draggedView.center = UIIVappleCatcherLeft1.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherLeft2.frame){
     draggedView.center = UIIVappleCatcherLeft2.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherLeft3.frame){
     draggedView.center = UIIVappleCatcherLeft3.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherLeft4.frame){
     draggedView.center = UIIVappleCatcherLeft4.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight1.frame){
     draggedView.center = UIIVappleCatcherRight1.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight2.frame){
     draggedView.center = UIIVappleCatcherRight2.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight3.frame){
     draggedView.center = UIIVappleCatcherRight3.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight4.frame){
     draggedView.center = UIIVappleCatcherRight4.center
     }
     }
     if gesture8.state == UIGestureRecognizerState.ended {
     if draggedView.frame.intersects(UIIVappleCatcherLeft1.frame){
     draggedView.center = UIIVappleCatcherLeft1.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherLeft2.frame){
     draggedView.center = UIIVappleCatcherLeft2.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherLeft3.frame){
     draggedView.center = UIIVappleCatcherLeft3.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherLeft4.frame){
     draggedView.center = UIIVappleCatcherLeft4.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight1.frame){
     draggedView.center = UIIVappleCatcherRight1.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight2.frame){
     draggedView.center = UIIVappleCatcherRight2.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight3.frame){
     draggedView.center = UIIVappleCatcherRight3.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight4.frame){
     draggedView.center = UIIVappleCatcherRight4.center
     }
     }
     if gesture9.state == UIGestureRecognizerState.ended {
     if draggedView.frame.intersects(UIIVappleCatcherLeft1.frame){
     draggedView.center = UIIVappleCatcherLeft1.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherLeft2.frame){
     draggedView.center = UIIVappleCatcherLeft2.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherLeft3.frame){
     draggedView.center = UIIVappleCatcherLeft3.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherLeft4.frame){
     draggedView.center = UIIVappleCatcherLeft4.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight1.frame){
     draggedView.center = UIIVappleCatcherRight1.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight2.frame){
     draggedView.center = UIIVappleCatcherRight2.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight3.frame){
     draggedView.center = UIIVappleCatcherRight3.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight4.frame){
     draggedView.center = UIIVappleCatcherRight4.center
     }
     }
     if gesture10.state == UIGestureRecognizerState.ended {
     if draggedView.frame.intersects(UIIVappleCatcherLeft1.frame){
     draggedView.center = UIIVappleCatcherLeft1.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherLeft2.frame){
     draggedView.center = UIIVappleCatcherLeft2.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherLeft3.frame){
     draggedView.center = UIIVappleCatcherLeft3.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherLeft4.frame){
     draggedView.center = UIIVappleCatcherLeft4.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight1.frame){
     draggedView.center = UIIVappleCatcherRight1.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight2.frame){
     draggedView.center = UIIVappleCatcherRight2.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight3.frame){
     draggedView.center = UIIVappleCatcherRight3.center
     }
     if draggedView.frame.intersects(UIIVappleCatcherRight4.frame){
     draggedView.center = UIIVappleCatcherRight4.center
     }
     }
     }
     
     */
    

 
}
