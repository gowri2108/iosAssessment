//
//  PostModelClass.swift
//  IOSAssessment
//
//  Created by Gowri Karthik on 29/05/24.
//

import UIKit

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
