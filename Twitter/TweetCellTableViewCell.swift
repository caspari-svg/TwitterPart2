//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Sebastian on 3/12/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit


class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    
    var favorited:Bool = false
    var tweetID:Int = -1
    var retweeted:Bool = false
    
    func setFavorite(_ isFavorited:Bool) {
        favorited = isFavorited
        if (favorited) {
            likeButton.setImage(UIImage(named:"icons8-heart-100 (1)"), for: UIControl.State.normal)
        } else {
            likeButton.setImage(UIImage(named:"icons8-heart-100"), for: UIControl.State.normal)
        }
    }
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if (toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetID, success: {
                self.setFavorite(true)
            }, failure: { (Error) in
                print("Favorite error.");
            })
        } else {
            TwitterAPICaller.client?.unFavoriteTweet(tweetId: tweetID, success: {
                self.setFavorite(false)
            }, failure: { (Error) in
                print("Unfavorite error")
            })
        }
    }
    @IBAction func retweetTweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetID, success: {
            self.setRetweeted(true)
        }, failure: { (Error) in
            print("Error retweeting")
        })
    }
    
    func setRetweeted(_ isRetweeted:Bool) {
        if (isRetweeted) {
            retweetButton.setImage(UIImage(named: "icons8-retweet-100 (1)"), for: UIControl.State.normal)
            retweetButton.isEnabled = false;
        } else {
            retweetButton.setImage(UIImage(named: "icons8-retweet-100"), for: UIControl.State.normal)
            retweetButton.isEnabled = true;
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
