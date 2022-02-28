//
//  File.swift
//  
//
//  Created by Ganesh Faterpekar on 2/12/21.
//

import Foundation

func createSampleProject(projectName: String) {
   _ = shell(command: "rm -rf \(projectName)")
   _ = shell(command: "unzip \(projectName)")
}

func gitInit() {
    _ = shell(command: "git init")
    _ = shell(command: "git add .")
    _ = shell(command: "git commit -m \"Initial commit\"")
    
}


