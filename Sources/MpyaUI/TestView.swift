//
//  SwiftUIView.swift
//  
//
//  Created by Marcus Isaksson on 2023-05-15.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        Logo()
            .foregroundColor(Color.mpyaBrown)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
            .padding()
    }
}
