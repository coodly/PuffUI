/*
* Copyright 2019 Coodly LLC
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import Foundation
import CloudKit

internal class FetchConfiguration {
    private let container: CKContainer
    private let database: CKDatabase
    private let zone: CKRecordZone
    internal let recordType: String
    
    internal init(container: CKContainer, database: CKDatabase, zone: CKRecordZone, recordType: String) {
        self.container = container
        self.database = database
        self.zone = zone
        self.recordType = recordType
    }
    
    internal var containerIdentifier: String {
        container.containerIdentifier ?? "-"
    }
    
    internal var databaseScope: String {
        database.databaseScope.description
    }
    
    internal var zoneName: String {
        zone.zoneID.zoneName
    }
}

extension CKDatabase.Scope: CustomStringConvertible {
    public var description: String {
        switch self {
        case .public:
            return "public"
        case .private:
            return "private"
        case .shared:
            return "private"
        @unknown default:
            return "unknown-\(rawValue)"
        }
    }
}
