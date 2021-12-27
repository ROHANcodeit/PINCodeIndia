//
//  MainData.swift
//  PINIndia
//
//  Created by Rohan Tyagi on 27/12/21.
//

import Foundation

struct MainData:Decodable {
    let PostOffice:[PostOffice]
}
struct PostOffice:Decodable{
    let Name:String
    let Pincode:String
}
