//
//  DogsListViewModelTests.swift
//  WhoLetTheDogsOutTests
//
//  Created by Guilherme Antunes on 30/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Quick
import Nimble
@testable import Promises
@testable import WhoLetTheDogsOut

class DogsListViewModelTests: QuickSpec {
    
    class DogsListDataAccessDummy: DogsListDataAccess {
        var shouldFulfill = true
        
        func getDog(for breed: String) -> Promise<Dog> {
            return Promise<Dog> { fulfill, reject in
                self.shouldFulfill ? fulfill(Dog(category: "Chiuaua", list: ["Some Kind Of Photo"])) : reject(CustomError.APIError("Not responding"))
            }
        }
    }
    
    class ViewDummy: DogsCollectionViewControllerPresentable {
        var startLoadingCalled = false
        var stopLoadingCalled = false
        var presentAlertWithCalled = false
        var reloadCalled = false
        
        func startLoading() {
            startLoadingCalled = true
        }
        
        func stopLoading() {
            stopLoadingCalled = true
        }
        
        func presentAlertWith(message: String) {
            presentAlertWithCalled = true
        }
        
        func reload() {
            reloadCalled = true
        }
        
    }
    
    override func spec() {
        var subject: DogsListViewModel!
        var viewDummy: ViewDummy!
        var repositoryDummy: DogsListDataAccessDummy!
        
        beforeEach {
            viewDummy = ViewDummy()
            repositoryDummy = DogsListDataAccessDummy()
            subject = DogsListViewModel(view: viewDummy, repository: repositoryDummy)
        }
        
        describe("#Dogs list fetch") {
            context("when screen load", {
                it("should test view model variables", closure: {
                    expect(subject.allBreeds[0]).to(equal("husky"))
                    expect(subject.allBreeds[1]).to(equal("hound"))
                    expect(subject.allBreeds[2]).to(equal("pug"))
                    expect(subject.allBreeds[3]).to(equal("labrador"))
                    expect(subject.dogsList.isEmpty).to(beTrue())
                })
                it("should test the fetching list successfully", closure: {
                    subject.loadDogsList()
                    expect(waitForPromises(timeout: 0.5)).to(beTrue())
                    expect(viewDummy.startLoadingCalled).to(beTrue())
                    expect(viewDummy.stopLoadingCalled).to(beTrue())
                    expect(viewDummy.reloadCalled).to(beTrue())
                    expect(viewDummy.presentAlertWithCalled).to(beFalse())
                    expect(subject.dogsList.isEmpty).to(beFalse())
                })
                
                it("should test the list failing to fetch", closure: {
                    repositoryDummy.shouldFulfill = false
                    subject.loadDogsList()
                    expect(waitForPromises(timeout: 0.5)).to(beTrue())
                    expect(viewDummy.startLoadingCalled).to(beTrue())
                    expect(viewDummy.stopLoadingCalled).to(beTrue())
                    expect(viewDummy.reloadCalled).to(beFalse())
                    expect(viewDummy.presentAlertWithCalled).to(beTrue())
                    expect(subject.dogsList.isEmpty).to(beTrue())
                })
            })
        }
        
    }
    
}
