//
//  UnitTestCalc.swift
//  ExampleTests
//
//  Created by 정호진 on 2023/09/27.
//

import XCTest
@testable import TestCodePrac1

final class UnitTestCalc: XCTestCase {
    private var calculator = Calculator()
    
    override class func setUp() {
        super.setUp()
        print(#function)
        
        
    }
    
    override func setUpWithError() throws {
        print(#function)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        print(#function)
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        print(#function)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        print(#function)
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    override class func tearDown() {
        super.tearDown()
        print(#function)
    }
    
    
    func testAddNumber() {
        
        let result = calculator.plus(a: 2, b: 3)
        
        XCTAssertEqual(result, 5,"결과가 다름")
        print(#function)
    }
    
    func testSubtractNumber(){
        let result = calculator.minus(a: 2, b: 3)
        
        XCTAssertEqual(result, -1,"결과가 다름")
        print(#function)
    }
}
