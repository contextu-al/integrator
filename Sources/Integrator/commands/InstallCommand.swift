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
        print(finalPath)
        go_to_project_folder(path: finalPath)
        
        //Copy the script from the remote
        copy_xcode_helper_script()
       
        //Pod Prechecking
        if check_If_file_exists_in_CWD(fileName: projectName) &&  !check_If_file_exists_in_CWD(fileName: "Podfile") {
            create_pod_file()
        }
        
        //Pod Step
        try add_pointzi_to_pod()
        pod_install()
        
        //Git -> Temporary step
        gitInit()
        
        // Bridging
        create_bridging_header_file(projectName: projectName)
        run_xcode_script(projectPath: projectpath, projectName: projectName)
       
    }
}
