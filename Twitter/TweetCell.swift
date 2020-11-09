//
//  TweetCell.swift
//  Twitter
//
//  Created by 万亦然 on 2020/11/2.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit 

class TweetCell: UITableViewCell {

    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var tweetContentLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
   
    @IBOutlet weak var profileView: UIImageView!
    
    
    var tweetId:Int = -1
    var favourited:Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func favTweet(_ sender: Any) {
        
        let toBeFavourited = !favourited// opposite of current state
        if (toBeFavourited){
            TwitterAPICaller.client?.favouriteTweet(tweetId: tweetId, success: {
                self.setFavourited(true)
            }, failure: { (error) in
                print("failed to favourite")
            })
        } else{
            TwitterAPICaller.client?.unfavouriteTweet(tweetId: tweetId, success: {
                self.setFavourited(false)
            }, failure: { (error) in
                print("failed to unfavourite")
            })
        }
 
    }
    
    
    
    func setFavourited(_ isFavourited:Bool){
        favourited = isFavourited
        if (favourited){
            favButton.setImage(UIImage(named: "favor_icon_red"), for: UIControl.State.normal)
        }else{
            favButton.setImage(UIImage(named: "favor_icon"), for: UIControl.State.normal)
        }
    }

    
    @IBAction func retweet(_ sender: Any) {
    }
}
