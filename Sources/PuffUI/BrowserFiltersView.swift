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

import SwiftUI

internal struct BrowserFiltersView: View {
    var body: some View {
        VStack(spacing: 8) {
            FilterCard(name: "Container", value: "com.com.com", hasOptions: false)
            Divider()
            FilterCard(name: "Database", value: "public", hasOptions: false)
            Divider()
            FilterCard(name: "Zone", value: "_default", hasOptions: false)
            Divider()
            FilterCard(name: "Type", value: "Resource", hasOptions: false)
        }
    }
}

internal struct FilterCard: View {
    let name: String
    let value: String
    let hasOptions: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(name)
                    .font(.subheadline)
                    .foregroundColor(Color(UIColor.secondaryLabel))
                Text(value)
                    .font(.headline)
            }
            Spacer()
            if hasOptions {
                Image(systemName: "chevron.right")
            }
        }
    }
}
