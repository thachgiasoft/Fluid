//
//  ProgressBarView.swift
//  Fluid
//
//  Created by Aidan Pendlebury on 27/04/2020.
//  Copyright © 2020 Aidan Pendlebury. All rights reserved.
//

import SwiftUI

struct ProgressBarView: View {
    
    @Binding var counter: Int
    var maxCounter: Int
    
    var ajpProgress: CGFloat {
        guard counter < maxCounter else { return 1 }
        return CGFloat(counter) / CGFloat(maxCounter)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .cornerRadius(5)
                    .opacity(0.3)
                    .foregroundColor(Color(UIColor.systemTeal))
                Rectangle().frame(width: self.ajpProgress * geometry.size.width, height: geometry.size.height)
                    .cornerRadius(5)
                    .foregroundColor(Color(UIColor.green))
                    .opacity(0.5)
                    .animation(.linear)
            }
        }
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView(counter: .constant(50), maxCounter: 120)
            .padding()
            .frame(width: 300, height: 40)
            .previewLayout(.sizeThatFits)
    }
}
