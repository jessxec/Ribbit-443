//
//  HideTabsModifier.swift
//  Ribbit
//
//  Created by Jessie Chen on 12/9/24.
//


import SwiftUI

struct HideTabBarViewModifier: ViewModifier {
    var hide: Bool
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                UITabBar.appearance().isHidden = hide
            }
            .onDisappear {
                UITabBar.appearance().isHidden = false
            }
    }
}

extension View {
    func hideTabBar(_ hide: Bool) -> some View {
        self.modifier(HideTabBarViewModifier(hide: hide))
    }
}
