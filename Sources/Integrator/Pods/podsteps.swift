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
    try read_n_replace_file(fileName: "Podfile", pattern: pattern, replacemantString: replacemantString)
}




