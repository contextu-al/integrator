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
    
    func run() throws {
        //shell(command: "cd \(projectpath)")
        //Go the project folder
        //Check if Podfile Exisits
        // if No then create_a_pod_file
        // If exsists then update the pod_file
        // run the pod install command
        //go_to_project_folder(path: projectpath)
        //create_pod_file(path: projectpath)
        //try add_pointzi_to_pod(fileName: "Podfile")
        //pod_install()
        //run_ruby_script()
        
        print("Install sdk at \(projectpath)")
      
    }
}
