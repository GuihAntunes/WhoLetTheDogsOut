//
//  SignInViewModelTests.swift
//  WhoLetTheDogsOutTests
//
//  Created by Guilherme Antunes on 28/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Quick
import Nimble
@testable import Promises
@testable import WhoLetTheDogsOut

class SignInViewModelTests: QuickSpec {
    
    class SignInDataAccessDummy: SignInDataAccess {
        func alreadyLogged() -> Bool {
            return true
        }
        
        var signInCalled = false
        var emailInserted: String?
        var shouldReject = false
        func signInWith(email: String) -> Promise<Bool> {
            return Promise<Bool> { fulfill, reject in
                self.signInCalled = true
                self.emailInserted = email
                guard self.shouldReject else {
                    fulfill(true)
                    return
                }
                reject(CustomError.generalError("Returned Error!"))
            }
        }
    }
    
    class ViewDummy: SignInViewControllerPresentable {
        var startLoadingCalled = false
        var stopLoadingCalled = false
        var presentHomeScreenCalled = false
        var presentAlertWithCalled = false
        
        func startLoading() {
            startLoadingCalled = true
        }
        
        func stopLoading() {
            stopLoadingCalled = true
        }
        
        func presentHomeScreen() {
            presentHomeScreenCalled = true
        }
        
        func presentAlertWith(message: String) {
            presentAlertWithCalled = true
        }
        
    }
    
    override func spec() {
        var subject: SignInViewModel!
        var viewDummy: ViewDummy!
        var repositoryDummy: SignInDataAccessDummy!
        
        beforeEach {
            viewDummy = ViewDummy()
            repositoryDummy = SignInDataAccessDummy()
            subject = SignInViewModel(repository: repositoryDummy, view: viewDummy)
        }
        
        describe("#sign in action") {
            context("when button ENTRAR is clicked", {
                it("should test the log in action successful", closure: {
                    subject.signInUserWith(email: "email@email.com")
                    expect(waitForPromises(timeout: 5.0)).to(beTrue())
                    expect(repositoryDummy.emailInserted).to(equal("email@email.com"))
                    expect(repositoryDummy.emailInserted).notTo(equal("EMAIL@email.com"))
                    expect(repositoryDummy.emailInserted).notTo(beNil())
                    expect(viewDummy.startLoadingCalled).to(beTrue())
                    expect(viewDummy.stopLoadingCalled).to(beTrue())
                    expect(viewDummy.presentHomeScreenCalled).to(beTrue())
                    expect(viewDummy.presentAlertWithCalled).to(beFalse())
                })
                
                it("should test the log in action failing", closure: {
                    repositoryDummy.shouldReject = true
                    subject.signInUserWith(email: "email@email.com")
                    expect(waitForPromises(timeout: 5.0)).to(beTrue())
                    
                    expect(repositoryDummy.emailInserted).notTo(beNil())
                    expect(viewDummy.startLoadingCalled).to(beTrue())
                    expect(viewDummy.stopLoadingCalled).to(beTrue())
                    expect(viewDummy.presentHomeScreenCalled).to(beFalse())
                    expect(viewDummy.presentAlertWithCalled).to(beTrue())
                })
            })
        }
    }
    
}
