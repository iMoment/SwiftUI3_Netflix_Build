//
//  ActivityIndicator.swift
//  Netflix Build
//
//  Created by Stanley Pan on 2021/12/27.
//

import Foundation
import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    
    let style: UIActivityIndicatorView.Style
    @Binding var animate: Bool
    
    private let spinner: UIActivityIndicatorView = {
        $0.hidesWhenStopped = true
        return $0
    }(UIActivityIndicatorView(style: .medium))
    
    // Connects UIKit with SwiftUI
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        spinner.style = style
        return spinner
    }
    
    // Connects UIKit with SwiftUI, refresh mechanism
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        animate ? uiView.startAnimating() : uiView.stopAnimating()
    }
    
    func configure(_ indicator: (UIActivityIndicatorView) -> Void) -> some View {
        indicator(spinner)
        return self
    }
}
