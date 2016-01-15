//
//  Record.swift
//  CrowdSurvey
//
//  Created by Ian Fieldhouse on 15/01/2016.
//  Copyright © 2016 Edina. All rights reserved.
//

import Foundation
import GeoJSON
import ObjectMapper

class Record: Mappable, CustomStringConvertible {
    
    var id: String?
    var name: String?
    var feature: String?
    var geometry: [String: AnyObject]?
    
    // properties
    var editor: String?
    var fields: [Field]?
    var timestamp: NSDate?
    
    
    init(survey: Survey){
        // TODO: create id and name
        self.id = "SOME_AUTO_GENERATED_ID"
        self.name = "SOME_AUTO_GENERATED_NAME"
        self.editor = survey.id
        self.fields = survey.fields
        for field in self.fields! {
            field.persistent = nil
            field.properties = nil
            field.required = nil
            field.type = nil
        }
        self.timestamp = NSDate()
        print("Record created")
    }
    
    
    // MARK: - ObjectMapper
    
    required init?(_ map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        id        <- map["id"]
        name      <- map["name"]
        editor    <- map["properties.editor"]
        fields    <- map["properties.fields"]
        timestamp <- (map["properties.timestamp"], ISO8601DateTransform())
    }
    
    var description: String {
        get {
            return Mapper().toJSONString(self, prettyPrint: true)!
        }
    }
}