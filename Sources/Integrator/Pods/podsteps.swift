//
//  File.swift
//  
//
//  Created by Ganesh Faterpekar on 2/12/21.
//


import Foundation

func create_pod_file(){
    let result = shell(command: "pod init")
    print(result)
}

func pod_install() {
    let result = shell(command: "pod install")
    print(result)
}

func add_pointzi_to_pod()  throws {
    let pattern = "use_frameworks!"
    let replacemantString = "use_frameworks!\n pod 'pointzi'"
    try read_file(fileName: "Podfile", pattern: pattern, replacemantString: replacemantString)
}

func add_pointzi_initializer()  throws {
    
}

func create_bridging_header_file(projectName: String) {
    let protectFullName =  projectName.split(separator: ".")
    print("====create_bridging_header_file====")
    let result1 = shell(command: "pwd")
    print(result1)
    print(protectFullName)
    let filename = "\(protectFullName[0])-Bridging-Header.h"
    let result = shell(command: "touch \(filename)")
    _ = shell(command: "mv \(filename) \(projectName)")
    print(result)
}

func add_bridging_headers() {
    
}

func add_linker_files() {
    
}

