//
//  UserService.swift
//  Ribbit
//
//  Created by Jorge Urias on 10/30/24.
//

//import Foundation
//import FirebaseFirestore
//
//class UserService: UserServiceProtocol {
//    private let db = Firestore.firestore()
//    
//    func fetchUser(by id: String, completion: @escaping (Result<User, Error>) -> Void) {
//        db.collection("users").document(id).getDocument { (document, error) in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            
//            do {
//                if let user = try document?.data(as: User.self) {
//                    completion(.success(user))
//                } else {
//                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "User not found."])))
//                }
//            } catch {
//                completion(.failure(error))
//            }
//        }
//    }
//
//    func createUser(_ user: User, completion: @escaping (Error?) -> Void) {
//        do {
//            let userData = try Firestore.Encoder().encode(user)
//            db.collection("users").document(user.id ?? UUID().uuidString).setData(userData) { error in
//                completion(error)
//            }
//        } catch {
//            completion(error)
//        }
//    }
//    
//    func updateUserProgress(userId: String, progress: LessonProgress, completion: @escaping (Error?) -> Void) {
//        let updateData: [String: Any] = [
//            "currentModule": progress.lessonName,
//            "currentLesson": try? Firestore.Encoder().encode(progress)
//        ]
//        db.collection("users").document(userId).updateData(updateData) { error in
//            completion(error)
//        }
//    }
//}

import Foundation
import FirebaseFirestore

class UserService: UserServiceProtocol {
    private let db = Firestore.firestore()
    
    // Fetch user data asynchronously from Firebase.
    func fetchUser(by id: String) async throws -> User {
        try await withCheckedThrowingContinuation { continuation in
            db.collection("Users").document(id).getDocument { document, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    do {
                        if let user = try document?.data(as: User.self) {
                            continuation.resume(returning: user)
                        } else {
                            let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "User not found."])
                            continuation.resume(throwing: error)
                        }
                    } catch {
                        continuation.resume(throwing: error)
                    }
                }
            }
        }
    }

    // Add a new user to Firebase asynchronously.
    func createUser(_ user: User) async throws {
        return try await withCheckedThrowingContinuation { continuation in
            do {
                try db.collection("Users").document(user.id ?? UUID().uuidString).setData(from: user) { error in
                    if let error = error {
                        continuation.resume(throwing: error)
                    } else {
                        continuation.resume()
                    }
                }
            } catch {
                continuation.resume(throwing: error)
            }
        }
    }
    
    // Update user progress asynchronously in Firebase.
    func updateUserProgress(userId: String, progress: LessonProgress) async throws {
        let updateData: [String: Any] = [
            "currentModule": progress.lessonName,
            "currentLesson": [
                "lessonName": progress.lessonName,
                "totalStarsCollected": progress.totalStarsCollected,
                "accuracy": progress.accuracy,
                "feedback": progress.feedback
            ]
        ]
        
        return try await withCheckedThrowingContinuation { continuation in
            db.collection("Users").document(userId).updateData(updateData) { error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume()
                }
            }
        }
    }
  
 
    func deleteUser(by id: String) async throws {
        return try await withCheckedThrowingContinuation { continuation in
            db.collection("Users").document(id).delete { error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume()
                }
            }
        }
    }
}
