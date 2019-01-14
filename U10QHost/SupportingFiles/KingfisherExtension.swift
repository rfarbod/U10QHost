//
//  KingfisherExtension.swift
//  Trivia
//
//  Created by TEST on 12/15/18.
//  Copyright © 2018 TEST. All rights reserved.
//

import Foundation
import Kingfisher
func returnKingfisgerStuff(hash:String,completion:@escaping ((AnyModifier,URL)->())) {
    let modifier = AnyModifier { request in
        var r = request
        r.setValue(Constants.token, forHTTPHeaderField: "t")
        return r
    }
    let mediaURL = URL(string:MyURLs.media + hash + "?pt=m500")
    completion(modifier,mediaURL!)
    let mediaURLChat = URL(string:MyURLs.media + hash + "?pt=m100")
    completion(modifier,mediaURLChat!)
}
extension UIImageView {
    func setMedia(hash:String,completion:@escaping((Bool)->())) {
        
        returnKingfisgerStuff(hash: hash) { (modifier, mediaUrl) in
            self.kf.setImage(with: mediaUrl, options: [.requestModifier(modifier)]) { (image, error, type, url) in
                if error == nil && image != nil {
                    self.image = image
                    completion(true)
                } else {
                    print(error.debugDescription)
                    completion(false)
                }
            }
            
        }
    }
    
    func setMediaChat(hash:String,completion:@escaping((Bool)->())) {
        
        returnKingfisgerStuff(hash: hash) { (modifier, mediaUrlChat) in
            self.kf.setImage(with: mediaUrlChat, options: [.requestModifier(modifier)]) { (image, error, type, url) in
                if error == nil && image != nil {
                    self.image = image
                    completion(true)
                } else {
                    print(error.debugDescription)
                    completion(false)
                }
            }
            
        }
    }
}

