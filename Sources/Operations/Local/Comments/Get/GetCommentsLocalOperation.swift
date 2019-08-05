//
//  GetCommentsLocalOperation.swift
//  STPhotoDetails
//
//  Created by Dimitri Strauneanu on 02/08/2019.
//  Copyright © 2019 Streetography. All rights reserved.
//

import Foundation
import STPhotoCore

class GetCommentsLocalOperation: AsynchronousOperation {
    private let model: GetCommentsOperationModel.Request
    private var operationCompletionHandler: ((Result<GetCommentsOperationModel.Response, OperationError>) -> Void)
    
    var shouldFail: Bool = false
    var delay: Int = Int.random(in: 1...3)
    
    init(model: GetCommentsOperationModel.Request, completionHandler: @escaping ((Result<GetCommentsOperationModel.Response, OperationError>) -> Void)) {
        self.model = model
        self.operationCompletionHandler = completionHandler
        super.init()
    }
    
    override func main() {
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(self.delay)) {
            if self.shouldFail {
                self.noDataAvailableErrorBlock()
            } else {
                self.successBlock(response: GetCommentsOperationModel.Response(comments: self.comments()))
            }
        }
    }
    
    private func comments() -> [STComment] {
        let count: Int = Int.random(in: 20...40)
        var comments: [STComment] = []
        for i in 0..<count {
            var comment = STComment(id: String(i))
            comment.text = self.text(i: i)
            comment.user = self.user(i: i)
            comments.append(comment)
        }
        return comments
    }
    
    private func text(i: Int) -> String {
        return Bool.random() ? "\(i): Small text." : "\(i): All of the fields on this page are optional and can be deleted at any time, and by filling them out, you're giving us consent to share this data wherever your user profile appears."
    }
    
    private func user(i: Int) -> STUser {
        var user = STUser(id: "userId\(i)")
        user._firstName = Bool.random() ? "John Little Johnny \(i)" : "John \(i)"
        user._lastName = "Doe \(i)"
        return user
    }
    
    // MARK: - Success
    
    private func successBlock(response: GetCommentsOperationModel.Response) {
        self.operationCompletionHandler(Result.success(response))
        self.completeOperation()
    }
    
    // MARK: - Operation error
    
    private func noDataAvailableErrorBlock() {
        self.operationCompletionHandler(Result.failure(OperationError.noDataAvailable))
        self.completeOperation()
    }
}
