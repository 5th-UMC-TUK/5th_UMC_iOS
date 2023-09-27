//
//  ExampleTests.swift
//  ExampleTests
//
//  Created by 정호진 on 2023/03/01.
//

import XCTest
@testable import TestCodePrac1

final class ExampleTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPlaceholder(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        vc.loadView()
        
        XCTAssertEqual(vc.lable1.text,"안녕1","에러")
    }

}
