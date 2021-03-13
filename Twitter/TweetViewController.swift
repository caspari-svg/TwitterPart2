//
//  TweetViewController.swift
//  Twitter
//
//  Created by Sebastian on 3/12/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {
    
    @IBOutlet weak var characterLabel: UILabel!
    @IBOutlet weak var tweetCell: UITextView!
    
    @IBAction func CancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweetButton(_ sender: Any) {
        if (!tweetTextView.text.isEmpty) {
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (Error) in
                print("Error posting tweet! \(Error)")
            })
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBOutlet weak var tweetTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextView.becomeFirstResponder()
        tweetCell.layer.cornerRadius = 5
        tweetCell.layer.borderWidth = 1.0
        tweetCell.layer.borderColor = UIColor.black.cgColor
        // Do any additional setup after loading the view.
    }


}
