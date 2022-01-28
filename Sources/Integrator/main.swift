#!/usr/bin/env swift
import ArgumentParser
import Foundation

struct Integrator: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName:"contextual",
        abstract: "Integrator SDK Integrator",
        version: "0.0.1",
        subcommands: [Add.self,InstallSDK.self])

    init() { }
}
Integrator.main()







