//
//  File.swift
//  
//
//  Created by Ganesh Faterpekar on 28/2/22.
//

import Foundation

func copy_xcode_helper_script() {
    let scriptdata = download_xcode_helper_string()
    _ = shell(command: "touch xcodeconfigurer.rb")
    let filname = FileManager.default.currentDirectoryPath.appending("/xcodeconfigurer.rb")
     do {
          try scriptdata.write(to: URL(string: "file://"+filname)!, atomically: true, encoding: String.Encoding.utf8)
     }
    catch { print("In error")
        print(error.localizedDescription)}
     
}

func download_xcode_helper_string() -> String {
    let results =  shell(command: "curl https://gitlab.com/pointzi/sdks/integratorscripts/-/raw/main/xcodehelper.rb")
    let strippedData = stripData(data: results)
    return strippedData
}

func stripData(data: String) -> String {
    guard let startIndex = data.range(of: "Start Script") else { return "" }
    guard let endIndex = data.range(of: "End Script") else { return "" }
    let substring = data[startIndex.upperBound..<endIndex.lowerBound]
    return String(substring)
}


