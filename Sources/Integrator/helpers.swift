//
//  File.swift
//  
//
//  Created by Ganesh Faterpekar on 2/12/21.
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

func go_to_project_folder(path: String) {
    FileManager.default.changeCurrentDirectoryPath(path)
}

func createSampleProject(projectName: String) {
   _ = shell(command: "rm -rf \(projectName)")
   _ = shell(command: "unzip \(projectName)")
}

func check_If_file_exists_in_CWD(fileName: String) -> Bool {
    let fileManager = FileManager.default
    if fileManager.fileExists(atPath: fileName) {
        return true
    }
    
    return false
}

func gitInit() {
    _ = shell(command: "git init")
    _ = shell(command: "git add .")
    _ = shell(command: "git commit -m \"Initial commit\"")
    
}

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


func run_xcode_script(projectPath: String,projectName: String) {
   let bridgingHeader =  projectName + "-Bridging-Header.h"
   let projectFullPath = projectPath + "/" + projectName + "/" + projectName + ".xcodeproj"
   let r =  shell(command: "ruby xcodeconfigurer.rb \(projectFullPath) \(projectName) \(bridgingHeader)")
   print(r)
}

let xcoderhelpScripString = """
#import the xcodeproj ruby gem
require "xcodeproj"
#define the path to your .xcodeproj file

projectpath = ARGV[0]
projectname = ARGV[1]
bridgingheader = ARGV[2]
puts projectpath       #prints test1
puts projectname
puts bridgingheader

#open the xcode project
project = Xcodeproj::Project.open(project_path)
group = project.main_group[projectname]

#get the file reference for the file to add
file = group.new_file(bridgingheader)
#add the file reference to the projects first target
main_target = project.targets.first
main_target.add_file_references([file])
#finally, save the project
project.save
"""


/*
 let xcoderhelpScripString = """
 #import the xcodeproj ruby gem
 require "xcodeproj"
 #define the path to your .xcodeproj file

 projectpath = ARGV[0]
 projectname = ARGV[1]
 bridgingheader = ARGV[2]
 puts projectpath       #prints test1
 puts projectname
 puts bridgingheader

 #open the xcode project
 project = Xcodeproj::Project.open(project_path)
 group = project.main_group[projectname]

 #get the file reference for the file to add
 file = group.new_file(bridgingheader)
 #add the file reference to the projects first target
 main_target = project.targets.first
 main_target.add_file_references([file])
 #finally, save the project
 project.save
 """
 */
