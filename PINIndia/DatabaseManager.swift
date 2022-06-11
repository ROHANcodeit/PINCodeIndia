//
//  DatabaseManager.swift
//  ChatApp
//
//  Created by Rohan Tyagi on 10/06/22.
//

import Foundation
import FirebaseDatabase

class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    let database = Database.database().reference()
    
    func insertUser(with user :chatAppUser){
        
        database.child(user.safeEmail).setValue([
            "password": user.password
        ]
        )
    }
    public func getAllUsers(completion: @escaping (Result<[[String:String]], Error>)->Void)
    {
        database.child("users").observeSingleEvent(of: .value, with: { snapshot in
            
            guard let value = snapshot.value as? [[String:String]] else{
                completion(.failure(DatabaseError.failedToFetch))
                return
            }
            completion(.success(value))
        })
    }
    
    public enum DatabaseError: Error{
        case failedToFetch
    }
    
}

struct chatAppUser{
    
    let emailAddress : String
    let password : String
    
    var safeEmail: String {
        var safeEmail = emailAddress.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        return safeEmail
    }
    
    var safePassword: String {
        var safePassword = password.replacingOccurrences(of: ".", with: "-")
        safePassword = safePassword.replacingOccurrences(of: "@", with: "-")
        return safePassword
    }
    
}

