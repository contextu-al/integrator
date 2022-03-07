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
    
    @Argument(help: "Yaml Config path")
    var configYmlPath: String
    
    func run() throws {
        try install_contextual_sdk(configFilePath: configYmlPath)

    }
    
    func install_contextual_sdk(configFilePath: String) throws {
    
        print("📦 Decoding the config file ...")
        
        let configYmlData = try? read_file(filePath: configFilePath)
        var configYml = ConfigDetails()
        
        if let ymlData = configYmlData {
            guard let result = try? decodeConfigYML(ymlString: ymlData)?.integrator else {
                return
            }
            
            configYml = result
        }
        print("🚀 Starting to integrate contexu.al sdk with the project : \(configYml.name)...")
        go_to_project_folder(path: configYml.path)
        
        if(configYml.git != "" ) {
           print("🌍 Cloning repo: \(configYml.git)")
           gitClone(url:configYml.git)
        }
       
        var finalPath = "\(configYml.path)/\(configYml.name)"
        
        if (!check_If_file_exists_at(fileName: finalPath + "/" + configYml.name + ".xcodeproj")) {
           let tempPath = "\(configYml.path)/\(configYml.name.lowercased())"
           if(check_If_file_exists_at(fileName: tempPath + "/" + configYml.name + ".xcodeproj")) {
               finalPath = tempPath
           } else {
                 print("Project Name doesn't exsists")
                 return ;
              }
        }
        
        
        go_to_project_folder(path: finalPath)
        copy_xcode_helper_script()
        
        performPodsPreCheck(projectName: configYml.name)
        
        print("☕ Adding cocoa pods")
        try addPodSteps()
        
        if (configYml.type == .Swift) {
           print("🔥 Adding Bridging Headers")
           try addBridgingHeaders(projectName: configYml.name, projectPath: configYml.path)
        }
        
        go_to_project_folder(path: finalPath+"/"+configYml.name)
        try performSwiftIntegraton(config: configYml)
        
        go_to_project_folder(path: finalPath)
        print("📁 Relacing base classes")
        replace_bases_classes (projetName: configYml.name,controllers: configYml.controller, type: configYml.type)
        
        print("📬 Opening the project")
        openXcodeProject(path: finalPath ,name: configYml.name)
        print("✅ All done! 🎉  Good luck with your project! 🙌")
        
    }
    
    
    func performPodsPreCheck(projectName: String) {

        if check_If_file_exists_at(fileName: projectName) &&
           !check_If_file_exists_at(fileName: "Podfile") {
            create_pod_file()
        }
    }
    
    func addPodSteps() throws {
        try add_pointzi_to_pod()
        pod_install()
    }
    
    func createTemporaryGitRepo() {
        gitInit()
    }
       
    func performSwiftIntegraton(config : ConfigDetails) throws {
        do {
            switch config.type {
                case .Swift:
                    try add_Intializer_In_Swift_AppDelegate (config: config)
                case .ObjC:
                    try add_Intializer_In_Obj_AppDelegate(config: config)
                case .SwiftUI:
                    break
                case .unknown:
                   break
            }
            
        } catch {
                print(error)
        }
    }
}

func addBridgingHeaders(projectName: String ,projectPath: String) throws {
    try create_bridging_header_file(projectName: projectName)
    add_headers_to_xcode_settings(projectPath: projectPath, projectName: projectName)
}

func openXcodeProject(path: String, name: String) {
    go_to_project_folder(path: path)
    _  = shell(command: "open \(path)/\(name).xcworkspace")
}
