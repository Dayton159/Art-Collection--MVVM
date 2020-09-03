//
//  Picture.swift
//  Art Collection -MVC
//
//  Created by Dayton on 01/09/20.
//  Copyright © 2020 Dayton. All rights reserved.
//

import Foundation

struct Picture:Decodable {
    let data:[PictureData]
}

struct PictureData:Decodable {
    let title:String? // "La Vie",
    let creation_date:String? //"1903",
    let creators:[Creators]?
    let wall_description:String? // "In 1901, depressed over the suicide of a close friend, Picasso launched into the melancholic paintings of his Blue period (1901–4). Only 21 years old and desperately poor, he restricted his palette to cold colors suggestive of night, mystery, dreams, and death. His obsession with themes of human misery and social alienation reached its climax with this painting. The subject has been interpreted variously as an allegory of sacred and profane love, a symbolic representation of the cycle of life, and a working-class couple facing the hazards of real life.",
    
    let images:Images
    let technique:String?
    
}

struct Creators:Decodable {
    let description:String? //"Pablo Picasso (Spanish, 1881-1973)",
    let biography:String? // "Pablo Ruiz Picasso (1881-1973), the most prolific and influential artist of the 20th century, shifted the emphasis of art from its traditional concern with beauty toward radical innovation. The son of an art teacher, Picasso demonstrated remarkable talents as a child and entered the royal art academy in Madrid at age sixteen. Less than a year later, he abandoned his studies and soon joined several avant-garde artist and anarchist groups in Barcelona and Paris. After passing through a succession of stylistic periods, most notably the Blue (1901-1904) and Rose (1904-1906) Periods, he collaborated with Georges Braque (1882-1963) in 1908 to invent Cubism, a revolutionary method of restructuring pictorial space. Picasso remained active until his death in 1973. Although his art still appears radical, many of his works are over one hundred years old. Cubism, perhaps the most important development in 20th-century art, was invented around 1908 by Pablo Picasso (1881-1973) and Georges Braque (1882-1963). The most revolutionary aspect of the style was not its obvious emphasis on geometric form; rather, it was the introduction of a radically new approach to configuring pictorial space. Since the Renaissance, artists had used various methods to create the illusion of distant space receding behind the canvas surface. The Cubists rejected that idea and collapsed space by compressing foreground, middle ground, and background into a continuous web of overlapping, intersecting planes. During the 1910s, other painters and sculptors embraced or adapted Cubism to their own ends. This revolutionary approach inspired a host of related movements and continues to influence the visual language of artists, architects, and designers throughout the world.",
}

struct Images:Decodable {
    let print:Print
}

struct Print:Decodable {
    let url:String // "https://openaccess-cdn.clevelandart.org/1998.78.10/1998.78.10_print.jpg",
}
