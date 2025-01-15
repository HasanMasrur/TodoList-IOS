//
//  AddView.swift
//  TodoList
//
//  Created by Hasan Masrur on 7/1/25.
//

import SwiftUI

struct AddView: View {
    
    @EnvironmentObject var listModelView: ListViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var textFieldText: String = ""
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
    
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
                        addItem()
                        
                    }) {
                        Text("Save")
                            .frame(maxWidth: .infinity, minHeight: 55)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                }
                .padding()
            }
            .navigationTitle("Todo List").alert(isPresented: $showAlert,
                                                content:getAlert
             )
        }
    }
    func addItem() {
        if(!textisAppropriate()){
            return
        }
        listModelView.addItem(title: textFieldText)
        presentationMode.wrappedValue.dismiss()
    }
    func textisAppropriate() -> Bool {
      if  textFieldText.count < 3{
          alertTitle = "Title must be at least 3 characters long"
          showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert()->Alert {
        return Alert(title:Text(alertTitle))
      
    }
}

#Preview {
    AddView().environmentObject(ListViewModel())
}
