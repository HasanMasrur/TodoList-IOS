//
//  ListRowView.swift
//  TodoList
//
//  Created by Hasan Masrur on 7/1/25.
//

import SwiftUI

struct ListRowView: View {
    let title: String
    var body: some View {
        HStack{
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
            
        }
    }
}

#Preview {
    ListRowView(title: "Sample Task")
}
