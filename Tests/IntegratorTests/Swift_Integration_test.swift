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
    
    func testAdd_Initalizer_Step_Updated_AppDelegate() throws {
        go_to_project_folder(path:projectPath)
       // try add_Intializer_In_Swift_AppDelegate(projectName: "TestIntergrator", app_key: "Ganesh_test")
        
    }
   
    func testAdd_BridgingHeader() throws {
        go_to_project_folder(path:projectPath)
        let filename = "TestIntergrator-Bridging-Header.h"
        let importStatment = "#Import \"StreetHawkCore_Pointzi.h\""
        //let imr = shell(command: "echo \"\(importStatment)\">> \(filename)")
        
       try file_append(fileName: filename, fileContent: importStatment)
    }
    
    func test_replace_controller() throws{
        go_to_project_folder(path: projectPath)
        let _ = shell(command: "sed -i '' 's/UIViewController/StreetHawkBaseViewController/g' ViewController.swift")
    }
    
    func test_open_project() throws {
        
        go_to_project_folder(path: projectPath)
        let r  = shell(command: "open \(projectPath)/TestIntergrator.xcworkspace")
        print(r)
    }
    
    func test_git_clone() {
        go_to_project_folder(path: "/Users/ganeshfaterpekar/Documents/SaiProjects/Development/Pointzi_SH/ios_sdk_packages/")
        gitClone(url:"https://gitlab.com/pointzi/sdks/ios/testintegrator.git")
    }
    
    func test_yml_parsing() throws{
        //go_to_project_folder(path: "/Users/ganeshfaterpekar/Documents/SaiProjects/Development/Pointzi_SH/ios_sdk_packages/integrator")
        //let r  = shell(command: "sh process_yaml.sh config.yml")
        //read_file_from_bundle()
        
        let configYmlData = try? read_file(filePath: "/Users/ganeshfaterpekar/Desktop/config.yml")
         let  result = try decodeConfigYML(ymlString: configYmlData!)
        
        switch result?.integrator?.type {
        case .Swift :
             print("Swift")
        default :
            break;
        }
    }
    
    func test_install_from_git() throws {
        try InstallSDK().install_contextual_sdk(configFilePath: "/Users/ganeshfaterpekar/Desktop/config.yml")
    }
    
    
}
