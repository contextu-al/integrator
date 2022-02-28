//
//  File.swift
//  
//
//  Created by Ganesh Faterpekar on 28/2/22.
//

import Foundation

func create_bridging_header_file(projectName: String) throws{
    let protectFullName =  projectName.split(separator: ".")
    let filename = "\(protectFullName[0])-Bridging-Header.h"
    let importStatment = "#import \"StreetHawkCore_Pointzi.h\""
    
    _ = shell(command: "touch \(filename)")
    try file_append(fileName: filename, fileContent: importStatment)
    _ = shell(command: "mv \(filename) \(projectName)")
}

func add_headers_to_xcode_settings(projectPath: String,projectName: String) {
   let bridgingHeader =  projectName + "-Bridging-Header.h"
   let projectFullPath = projectPath + "/" + projectName + "/" + projectName + ".xcodeproj"
   let r =  shell(command: "ruby xcodeconfigurer.rb \(projectFullPath) \(projectName) \(bridgingHeader)")
   print(r)
}

