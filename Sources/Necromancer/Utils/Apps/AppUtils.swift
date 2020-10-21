//
//  AppUtils.swift
//  
//
//  Created by Wisanu Paunglumjeak on 24/9/2563 BE.
//

import Foundation

public class AppUtils {
    
    /**
     - Description
     Informs of the type of update that is available so that
     the appropriate ruleset is used to present the update alert.
     - major: Major release available: A.b.c.d
     - minor: Minor release available: a.B.c.d
     - patch: Patch release available: a.b.C.d
     - revision: Revision release available: a.b.c.D
     - unknown: No information available about the update.
     */
    
    public enum UpdateType: String {
        case major
        case minor
        case patch
        case revision
        case unknown
    }
    
    /**
     
     - Description
     Check version app with apple store
     
     ex.
     - installedVersion is `1.0.0` appStoreVersion `2.0.0` will be return `UpdateType.major`
     - installedVersion is `1.0.0` appStoreVersion `1.1.0` will be return `UpdateType.minor`
     - installedVersion is `1.0.0` appStoreVersion `1.0.1` will be return `UpdateType.patch`
     - installedVersion is `1.0.0.0` appStoreVersion `1.0.0.1` will be return `UpdateType.revision`
     - installedVersion greater or equal than appStoreVersion will be return `UpdateType.unknown`
     
     - Parameters:
        - installedVersion: current version of applicaiton install
        - appStoreVersion: current version of applicaiton on apple store
     
     - Returns:
        - AppUtils.UpdateType?: enum of update type app
     
     - Author:
     wisanu.pljk
     */
    public class func checkVersion(with installedVersion: String?, appStoreVersion: String?) -> UpdateType{
        guard let installedVersion = installedVersion,
              let appStoreVersion = appStoreVersion else {
            return .unknown
        }
        
        guard installedVersion.compare(appStoreVersion, options: .numeric) == .orderedAscending else {
            return .unknown
        }
        
        let installedVersions = split(version: installedVersion)
        let appStoreVersions = split(version: appStoreVersion)
        
        guard let newVersionFirst = appStoreVersions.first,
              let oldVersionFirst = installedVersions.first else {
            return .unknown
        }
        
        if newVersionFirst > oldVersionFirst {
            return .major
        } else if appStoreVersions.count > 1 && (installedVersions.count <= 1 || appStoreVersions[1] > installedVersions[1]) {
            return .minor
        } else if appStoreVersions.count > 2 && (installedVersions.count <= 2 || appStoreVersions[2] > installedVersions[2]) {
            return .patch
        } else if appStoreVersions.count > 3 && (installedVersions.count <= 3 || appStoreVersions[3] > installedVersions[3]) {
            return .revision
        } else {
            return .unknown
        }
    }
    
    private static func split(version: String) -> [Int] {
        return version.lazy.split {$0 == "."}.map { String($0) }.map {Int($0) ?? 0}
    }
}
