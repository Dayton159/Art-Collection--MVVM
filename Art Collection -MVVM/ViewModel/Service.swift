//
//  Service.swift
//  Art Collection -MVC
//
//  Created by Dayton on 01/09/20.
//  Copyright © 2020 Dayton. All rights reserved.
//
import Foundation

protocol FetchingDelegate {
    func addData(_ object:[ArtObject])
}

class Service: NSObject {
    var currentIndexObject:Int = 0
    var upcomingObjectRefreshed:Int = 0
    var isFirstFetch:Bool = false
    var delegate:FetchingDelegate?
    static let shared = Service()
    
    var object = [ArtObject]()
    
    func fetchCourse(){
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                print(err)
                return
            }
            
            guard let safeData = data else {return}
            
            do{
                let courses = try JSONDecoder().decode(Picture.self, from: safeData)
                
                for course in courses.data{
                    if course.creators?.count != 0 {
                    let title = course.title
                    let date = course.creation_date
                        let creator = course.creators?[0].description
                        let biography = course.creators?[0].biography
                    let description = course.wall_description
                    let image = course.images.print.url
                    let technique = course.technique
                    
                    let artObject = ArtObject(title: title, creationDate: date, creator: creator, biography: biography, description: description, urlImages: image, isExpanded: false, technique: technique)
                    
                    DispatchQueue.main.async {
                        self.object.append(artObject)
                        self.firstFetch()
                    }
                }
                }
                
            }catch let jsonError{
                print("Failed to decode \(jsonError)")
            }
            
        }.resume()
        
    }
    
    func fetchMoreObject(){
        if upcomingObjectRefreshed <= object.count - 1 && currentIndexObject >= 0{
            for refreshObject in currentIndexObject...upcomingObjectRefreshed{
                var array:[ArtObject] = []
                array.append(object[refreshObject])
                self.delegate?.addData(array)
            }
        }else{
            return
        }
    }
    func firstFetch(){
        if isFirstFetch {
            self.fetchMoreObject()
        }else{
            return
        }
    }
}
