//
//  ModulePathView.swift
//  Ribbit
//
//  Created by Jorge Urias on 12/2/24.
//

import SwiftUI

struct ModulePathView: View {
  @State private var scrollOffset: CGFloat = 0
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    // Spacer to push the image to the bottom initially
                    Spacer()

                    // The long image
                    Image("map") // Replace with your image name
                        .resizable()
                        .scaledToFill() // Make sure the image fills the available space while maintaining aspect ratio
                        .frame(width: UIScreen.main.bounds.width) // Fill the full width of the screen
                        .clipped() // Ensure any overflow is clipped
                        .edgesIgnoringSafeArea(.bottom) // Let the image extend below the safe area if needed

                }
            }
            .edgesIgnoringSafeArea(.all) // // Ignore safe area to allow the image to extend fully
  }
}
  struct ScrollableImageView_Previews: PreviewProvider {
      static var previews: some View {
          ModulePathView()
      }
  }
