//
//  AddView.swift
//  TodoList
//
//  Created by Hasan Masrur on 7/1/25.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 10) {
                    TextField("Add Item", text: $textFieldText)
                        .padding()
                        .frame(height: 55)
                        .background(Color.gray.opacity(0.2))
                        .foregroundColor(.primary)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    Button(action: {
                        print("Item added: \(textFieldText)")
                    }) {
                        Text("Add")
                            .frame(maxWidth: .infinity, minHeight: 55)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                }
                .padding()
            }
            .navigationTitle("Todo List")
        }
    }
}

#Preview {
    AddView()
}
