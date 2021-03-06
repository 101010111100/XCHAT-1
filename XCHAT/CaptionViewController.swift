//
//  CaptionViewController.swift
//  XCHAT
//
//  Created by Mateo Garcia on 5/24/15.
//  Copyright (c) 2015 Mateo Garcia. All rights reserved.
//

import UIKit

// FIXME: ALLOW USER TO GO BACK TO PHOTO SELECTION

// Communicates to presenter the caption entered for the given photo.
protocol CaptionViewControllerDelegate {
    func captionViewController(didEnterCaption caption: String?)
}

class CaptionViewController: UIViewController, UITextViewDelegate {
    
    var photo: UIImage!
    var delegate: CaptionViewControllerDelegate?

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var captionTextView: UITextView!
    
    
    // MARK: View Defaults
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPlaceholderText()
        photoImageView.image = photo
        captionTextView.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        captionTextView.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: TextView
    
    func setPlaceholderText() {
        captionTextView.text = "Why is this photo dope?"
        captionTextView.textColor = UIColor.lightGrayColor()
    }
    
    func textViewShouldBeginEditing(textView: UITextView) -> Bool {
        if textView.textColor == UIColor.lightGrayColor() {
            captionTextView.text = ""
            captionTextView.textColor = UIColor.blackColor()
        }
        return true
    }
    
    func textViewDidChange(textView: UITextView) {
        if count(captionTextView.text) == 0 {
            setPlaceholderText()
            captionTextView.resignFirstResponder()
        }
    }
    
    
    // MARK: Actions
    
    @IBAction func onPostButtonTapped(sender: AnyObject) {
        captionTextView.resignFirstResponder()
        
        // Avoids sending delegate placeholder text.
        if count(captionTextView.text) > 0 {
            delegate?.captionViewController(didEnterCaption: captionTextView.text)
        } else {
            delegate?.captionViewController(didEnterCaption: nil)
        }
        
        dismissViewControllerAnimated(true, completion: { () -> Void in
            
            // code
        })
    }
    
    @IBAction func onScreenTapped(sender: AnyObject) {
        view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
