//
//  BreakingBadCharacterExplorerAppTests.swift
//  BreakingBadCharacterExplorerAppTests
//
//  Created by Muhammad Luqman on 11/30/20.
//

import XCTest
@testable import BreakingBadCharacterExplorerApp

class BreakingBadCharacterExplorerAppTests: XCTestCase {

    func testValidateBreakingBad() {
        
        let expct = expectation(description: "Returns all fields to create valid image url")
        
        SearchService().request() { (result) in
            
            switch result {
            case .Success(let results):
                
                guard let resultCount = results?.count else {
                    XCTFail("No Breaking Bad returned")
                    return
                }
                
                if resultCount > 0 {
                    XCTAssert(true, "Returned Breaking Bad")
                    
                    // Pick first breaking bad record
                    
                    let breakingBad = results?.first
                    
                    if breakingBad?.img == nil {
                        XCTFail("No image id returned")
                    }
                    
                    if breakingBad?.name == nil {
                        XCTFail("No name id returned")
                    }
                    
                    if breakingBad?.nickname == nil {
                        XCTFail("No nick name id returned")
                    }
                    
                    if breakingBad?.status == nil {
                        XCTFail("No status id returned")
                    }
                    
                    if let appearance = breakingBad?.appearance{
                        if appearance.count == 0{
                            XCTFail("No appearance id returned")
                        }
                    }else{
                        
                        XCTFail("No appearance id returned")
                    }
                    
                    XCTAssert(true, "Success")
                    expct.fulfill()
                }
            case .Failure(let message):
                XCTFail(message)
            case .Error(let error):
                XCTFail(error)
            }
        }
        
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
            }
        }
    }
}
