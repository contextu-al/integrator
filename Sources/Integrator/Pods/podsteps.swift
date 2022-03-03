//
//  File.swift
//  
//
//  Created by Ganesh Faterpekar on 2/12/21.
//


import Foundation

func create_pod_file(){
    _ = shell(command: "pod init")
   
}

func pod_install() {
    _  = shell(command: "pod install")
    
}

func add_pointzi_to_pod()  throws {
    let pattern = "use_frameworks!"
    let replacemantString = "use_frameworks!\n pod 'pointzi'"
    try read_n_replace_file(fileName: "Podfile", pattern: pattern, replacemantString: replacemantString)
}




