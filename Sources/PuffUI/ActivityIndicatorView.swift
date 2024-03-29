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

internal struct ActivityIndicatorView: UIViewRepresentable {
    internal let style: UIActivityIndicatorView.Style

    internal init(style: UIActivityIndicatorView.Style) {
        self.style = style
    }
    
    internal func makeUIView(context: UIViewRepresentableContext<ActivityIndicatorView>) -> UIActivityIndicatorView {
        let indicator =  UIActivityIndicatorView(style: style)
        indicator.startAnimating()
        return indicator
    }

    internal func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicatorView>) {

    }
}
