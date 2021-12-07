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
       copy_xcode_helper_script(projectPath: projectpath)
       /*
       go_to_project_folder(path: projectpath)
       
        if check_If_file_exists_in_CWD(fileName: projectName) &&  !check_If_file_exists_in_CWD(fileName: "Podfile") {
            create_pod_file()
        }
        
        try add_pointzi_to_pod()
        pod_install()
        create_bridging_header_file(projectName: projectName)
       */
    }
}
