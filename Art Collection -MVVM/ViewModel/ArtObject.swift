//
//  File.swift
//  Art Collection -MVC
//
//  Created by Dayton on 02/09/20.
//  Copyright © 2020 Dayton. All rights reserved.
//

import Foundation


class ArtObject {
    let title:String?
    let creationDate:String?
    let creator:String?
    let biography:String?
    let description:String?
    let urlImages:String
    let technique:String?
    var isExpanded:Bool
    
    
    init(title:String?, creationDate:String?, creator:String?, biography:String?, description:String?, urlImages:String, isExpanded:Bool, technique:String?) {
        self.title = title
        self.creationDate = creationDate
        self.creator = creator
        self.biography = biography
        self.description = description
        self.urlImages = urlImages
        self.isExpanded = isExpanded
        self.technique = technique
    }
    
    var getTitle:String {
        return title ?? "No title Available"
    }
    
    var getDate:String {
        return creationDate ?? "Dates Unknown"
    }
    
    var getCreator:String {
        return creator ?? "Artist Unknwown"
    }
    
    var getBio:String {
        return biography ?? "Artist's Biography Unknown"
    }
    
    var getDescription:String {
        return description ?? "No Description Available"
    }
    
    var getImagesUrl:URL? {
        let imageURL:URL? = URL(string: urlImages)
        
        if let url = imageURL{
            return url
        }
        return nil
    }
    var expandedTable:String {
        let textDisplayed = isExpanded ? getBio : "Select For Artist's Biography >"
        
        return textDisplayed
    }
    
    var getTechnique:String {
        return "Technique: \(technique?.capitalized ?? "Unknown Technique Used")"
    }
    
}
