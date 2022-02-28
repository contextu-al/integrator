//
//  File.swift
//  
//
//  Created by Ganesh Faterpekar on 28/2/22.
//

import Foundation


func read_file(fileName: String ,pattern:String , replacemantString: String) throws {
      let contents = try String(contentsOfFile: fileName)
      var newcontent = ""
      if contents.contains(pattern) {
        newcontent =  contents.replacingOccurrences(of: pattern, with: replacemantString)
        let fileHandle = try FileHandle(forUpdating: URL(fileURLWithPath: fileName))
        fileHandle.write(newcontent.data(using: .utf8)!)
        try fileHandle.close()
      }
}

func replace_content(fileName: String,fileContent: String,pattern:String , replacemantString: String) throws {
        let newcontent =  fileContent.replacingOccurrences(of: pattern, with: replacemantString)
        let fileHandle = try FileHandle(forUpdating: URL(fileURLWithPath: fileName))
        fileHandle.write(newcontent.data(using: .utf8)!)
        try fileHandle.close()
      
}

func file_append(fileName: String,fileContent: String) throws {
    let fileHandle = try FileHandle(forUpdating: URL(fileURLWithPath: fileName))
    fileHandle.write(fileContent.data(using: .utf8)!)
    try fileHandle.close()
}

func search_pattern(fileName: String ,pattern:String , replacemantString: String) throws {
    let contents = try String(contentsOfFile: fileName)
    let result  = contents.range(of: pattern,options: .regularExpression)
   
    if let resultRange = result {
        let range = resultRange.lowerBound..<resultRange.upperBound
        let matchedContent  = contents[range]
        try replace_content(fileName: fileName, fileContent: contents, pattern: String(matchedContent), replacemantString: replacemantString)
        
        
        print(contents[range])
    }
}

func go_to_project_folder(path: String) {
    FileManager.default.changeCurrentDirectoryPath(path)
}

func check_If_file_exists_at(fileName: String) -> Bool {
    let fileManager = FileManager.default
    if fileManager.fileExists(atPath: fileName) {
        return true
    }
    
    return false
}
