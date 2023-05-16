//
//  File.swift
//  
//
//  Created by Marcus Isaksson on 2023-05-15.
//

import PackagePlugin

@main
struct AssetCodeGenerator: BuildToolPlugin {
    func createBuildCommands(context: PackagePlugin.PluginContext, target: PackagePlugin.Target) async throws -> [PackagePlugin.Command] {
        var value = [PackagePlugin.Command]()
        guard let target = target as? SourceModuleTarget else { return value }
        
        value += try target.sourceFiles(withSuffix: "xcassets").map { assetCatalog in
            let base = assetCatalog.path.stem
            let input = assetCatalog.path
            let output = context.pluginWorkDirectory.appending(["\(base)Images.swift"])
            
            return .buildCommand(displayName: "Generate Images for \(base)",
                                 executable: try context.tool(named: "ImageCodeGenExec").path,
                                 arguments: [input.string, output.string],
                                 inputFiles: [input],
                                 outputFiles: [output])
        }
        
        value += try target.sourceFiles(withSuffix: "xcassets").map { assetCatalog in
            let base = assetCatalog.path.stem
            let input = assetCatalog.path
            let output = context.pluginWorkDirectory.appending(["\(base)Color.swift"])
            
            return .buildCommand(displayName: "Generate Color for \(base)",
                                 executable: try context.tool(named: "ColorCodeGenExec").path,
                                 arguments: [input.string, output.string],
                                 inputFiles: [input],
                                 outputFiles: [output])
        }
        
        return value
    }
}
