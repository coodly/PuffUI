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

internal class FetchCursor: ObservableObject {
    private let config: FetchConfiguration
    internal init(config: FetchConfiguration) {
        self.config = config
    }
    
    @Published internal var loadingInProgress = false
    @Published internal var hasMore = false
    @Published internal var records = [CKRecord]()
    
    private var cursor: CKQueryOperation.Cursor? {
        didSet {
            self.hasMore = cursor != nil
        }
    }
    
    internal func fetchRecords() {
        if loadingInProgress {
            return
        }
        
        records.removeAll()
        fetch(with: nil)
    }
    
    internal func loadMore() {
        fetch(with: cursor)
    }
    
    private func fetch(with cursor: CKQueryOperation.Cursor?) {
        loadingInProgress = true

        let fetchOperation: CKQueryOperation
        if let cursor = cursor {
            fetchOperation = CKQueryOperation(cursor: cursor)
        } else {
            let query = CKQuery(recordType: config.recordType, predicate: NSPredicate(format: "TRUEPREDICATE"))
            fetchOperation = CKQueryOperation(query: query)
        }
        
        fetchOperation.zoneID = config.zone.zoneID
        fetchOperation.resultsLimit = 200
        fetchOperation.recordFetchedBlock = {
            record in
            
            DispatchQueue.main.async {
                self.records.append(record)
            }
        }
        
        fetchOperation.queryCompletionBlock = {
            cursor, error in
            
            print("completed: \(String(describing: cursor)) : \(String(describing: error))")
            self.mark(cursor: cursor)
        }
        
        config.database.add(fetchOperation)
    }
    
    private func mark(cursor: CKQueryOperation.Cursor?) {
        DispatchQueue.main.async {
            self.loadingInProgress = false
            self.cursor = cursor
        }
    }
}
