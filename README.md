# Integrator

Command-line utility for integrating Pointzi sdk

## Overview
Integrator is a Command-line utility for integrating Pointzi sdk into your apps. 

It performs the all the neccessary integration steps mention here https://dashboard.pointzi.com/docs/sdks/ios/integration/ 

## System Requirements
* Xcode 13.x
* iOS 13
* Swift Package Manager

## Setup

```
git clone https://gitlab.com/pointzi/sdks/ios/integrator.git

```

## Usage
After cloning the project , CD to the integrator project and run the following commands
```
swift build
swift run Integrator install "path_to_config.yml"

```

## Config Yml
```
integrator:
  projectname: IntegratorSwift
  projectType: Swift
  projectpath: /Users/hawks/Documents/projects/SampleiOSProjects
  giturl: https://gitlab.com/pointzi/sdks/ios/sampleapps/integratorswift.git
  appkey: APP_KEY
  controllers: ["*"]
```

### Config yml details  

| Key                        |   Comments        |
| -------------                      |    :-------------:   | 
| projectname                        | Name of the Project     |    
| projectpath                        | Path to the project      | 
| projectType                        | Swift, Objc
| giturl                             | Path to the project repo. If provided will clone the project into `projectpath`    |  
| appkey                             | App key, It's avialable in the dashboard    |    
| controllers                        | Arrays of the UIViewControllers that integrates PointziSDK   |  

### Congfiurations

| Key - controllers            |   Example        |
| -------------  | :-------------:   | 
|  `*`           |  integrates Pointzi SDK with all the UIViewControllers     |     
|  `name`        |  integrates Point SDK with the given controller eg: controllers: ["LoginViewController"]  |                     
|  `pattern`     |  replaces the controllers matching the pattern eg controllers: ["Login*"]     |  

### Integrator Output
📦 Decoding the config file ...

🚀 Starting to integrate contexu.al sdk with the project : IntegratorSwift...

🌍 Cloning repo: https://gitlab.com/pointzi/sdks/ios/sampleapps/integratorswift.git

☕ Adding cocoa pods\n

🔥 Adding Bridging Headers

📁 Replacing base classes

📬 Opening the project

✅ All done! 🎉  Good luck with your project! 🙌                
                               
                  
               

                                                                                 
