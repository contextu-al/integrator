//
//  File.swift
//  
//
//  Created by Ganesh Faterpekar on 31/1/22.
//
import XCTest
import Foundation
@testable import Integrator

let projectPath = "/Users/ganeshfaterpekar/Documents/SaiProjects/Development/Pointzi_SH/ios_sdk_packages/SampleiOSProject/TestIntergrator/TestIntergrator"

final class Swift_Integraton_test : XCTestCase {
    
    func xtestAdd_Initalizer_Step_Updated_AppDelegate() throws {
        go_to_project_folder(path:projectPath)
        try add_Intializer_In_AppDelegate(projectName: "TestIntergrator")
        
    }
   
    func testAdd_BridgingHeader() {
        go_to_project_folder(path:projectPath)
        let filename = "TestIntergrator-Bridging-Header.h"
        let importStatment = "\"StreetHawkCore_Pointzi.h\""
        let imr = shell(command: "echo \"\(importStatment)\">> \(filename)")
    }
    
}
