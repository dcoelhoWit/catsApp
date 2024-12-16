//
//  Coordinator.swift
//  CatsApp
//
//  Created by Diogo Coelho on 15/12/2024.
//

import SwiftUI

@Observable
class Coordinator {
    
    var path = NavigationPath()
    var fullScreenCover: FullScreenCover?
    
    let serviceFactory = ServiceFactory()
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func present(fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .catsList:
            buildCatsListView()
        case .catDetails(
            let catId
        ):
            buildCatDetailsView(catId: catId)
        }
    }
    
    @ViewBuilder
    func build(fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .readMe:
            NavigationStack {
                buildReadMeView()
            }
        }
    }
}
