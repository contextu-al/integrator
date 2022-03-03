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
  projectname: TestIntegrator
  projectpath: /Users/hawks/Documents/projects/SampleiOSProjects
  giturl: https://gitlab.com/pointzi/sdks/ios/testintegrator.git
  appkey: APP_KEY
  controllers: ["*"]
```
## 

## Examples 


| Requirement                        |   Implemented        | Comments                                           |
| -------------                      |    :-------------:   | :-----                                             |
| projectname                        | :white_check_mark:    |     |
| projectpath 13                     | :white_check_mark:    |                     |
| giturl Patterns                    | :white_check_mark:    |  |
| appkey Management                  | :white_check_mark:    |    |
| controllers                        | :white_check_mark:    |  |


|    Key        |             Comments                                         | 
| ------------- :-------------------------------------------------------------:|                                              
| projectname   | Name of the Project                                          | 
| projectpath   | Path to the project                                          |                       
| giturl        | Path to the project repo. If provided will clone the project to `projectpath`|            
| appkey        | App key, It avialable in the dashboard   |                                         |       
| controllers   | Arrays of the UIViewControllers to replace   |
|               | Example:
|               |   `*` integrates PointSDK with all the UIViewControllers   |
|               |   `name` - integrates PointSDK with given controller eg: controllers: ["LoginViewController"]   | 
|               |   `pattern` - replaces the controllers matching the pattern eg controllers: ["Login*"]    |
                
                               
                  
               

                                                                                 
