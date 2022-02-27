//
//  File.swift
//  
//
//  Created by Ganesh Faterpekar on 2/12/21.
//

import Foundation
import ArgumentParser

struct InstallSDK: ParsableCommand {
    static var configuration: CommandConfiguration {
        .init(
          commandName: "install",
          abstract: "Install the SDK"
        )
    }
    
    @Argument(help: "Project Path")
    var projectpath: String
    
    @Argument(help: "Project Name")
    var projectName: String
    
    func run() throws {
        
        let finalPath = "\(projectpath)/\(projectName)"
        
        go_to_project_folder(path: projectpath)
        createSampleProject(projectName: projectName)
        go_to_project_folder(path: finalPath)
        copy_xcode_helper_script()
       
        
        performPodsPreCheck(projectName: projectName)
        try addPodSteps()
        createTemporaryGitRepo()
        addBridgingHeaders(projectName: projectName, projectPath: projectpath)
        go_to_project_folder(path: finalPath+"/"+projectName)
        try performSwiftIntegraton()
         
        
    }
    
    func performPodsPreCheck(projectName: String) {
        //Pod Prechecking
        if check_If_file_exists_in_CWD(fileName: projectName) &&  !check_If_file_exists_in_CWD(fileName: "Podfile") {
            create_pod_file()
        }
    }
    
    func addPodSteps() throws {
        try add_pointzi_to_pod()
        pod_install()
    }
    
    func createTemporaryGitRepo() {
        gitInit()
        
    }
    
   
   
    func performSwiftIntegraton() throws {
        do {
            try add_Intializer_In_AppDelegate(projectName : projectName)
            
        } catch {
                print(error)
        }
        
    }
}


func addBridgingHeaders(projectName: String ,projectPath: String) {
    create_bridging_header_file(projectName: projectName)
    run_xcode_script(projectPath: projectPath, projectName: projectName)
}
