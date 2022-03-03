//
//  File.swift
//  
//
//  Created by Ganesh Faterpekar on 2/3/22.
//

import Foundation
import Yams

struct ConfigYml: Codable {
    var integrator: ConfigDetails?
}

struct ConfigDetails : Codable {
    var projectname: String?
    var projectpath: String?
    var giturl: String?
    var appkey: String?
    var controllers: [String]?
    
    var name: String {
        if let projetName = projectname {
            return projetName
        }
        return ""
    }
    var path: String {
        if let path = projectpath {
            return path
        }
        return ""
    }
    var git: String {
        if let giturl = giturl {
            return giturl
        }
        return ""
    }

    var key: String {
        if let key = appkey {
            return key
        }
        return ""
    }
    var controller: [String] {
        if let controller = controllers {
            return controller
        }
        return []
    }
    
}

func decodeConfigYML(ymlString : String) throws -> ConfigYml? {
    let decodeCoder = YAMLDecoder()
    let result = try decodeCoder.decode(ConfigYml.self, from: ymlString)
    
    guard let _ = result.integrator?.projectname ,
          let _ = result.integrator?.projectpath ,
          let _ = result.integrator?.appkey else {
         print("failed")
         return nil
    }
    
    return result
}

