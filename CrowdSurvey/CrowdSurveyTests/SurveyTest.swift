//
//  SurveyTest.swift
//  CrowdSurvey
//
//  Created by Ian Fieldhouse on 19/01/2016.
//  Copyright © 2016 Edina. All rights reserved.
//

import XCTest

import Alamofire
import ObjectMapper
import SwiftyJSON

@testable import CrowdSurvey

class SurveyTest: CrowdSurveyTests {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCreateSurveyFromJson() {
        
        if let survey = self.survey {
            XCTAssert(survey.id == Constants.Survey.Id)
            XCTAssert(survey.title == Constants.Survey.Title)
        }
    }
    
    func testSurveyDescriptionJson() {
              
        if let jsonData = self.survey!.description.dataUsingEncoding(NSUTF8StringEncoding) {
            let json = JSON(data: jsonData)
            
            XCTAssert(json["id"].stringValue == Constants.Survey.Id)
            XCTAssert(json["title"].stringValue == Constants.Survey.Title)
        }
    }
    
}
