//
//  File.swift
//  
//
//  Created by Ganesh Faterpekar on 2/12/21.
//

import Foundation

func shell(command: String) -> String {
    let task = Process()
       let pipe = Pipe()
    
       task.standardOutput = pipe
       task.standardError = pipe
       task.arguments = ["-c", command]
       task.launchPath = "/bin/zsh"
       task.launch()
       let data = pipe.fileHandleForReading.readDataToEndOfFile()
       let output = String(data: data, encoding: .utf8)!
       return output
}
