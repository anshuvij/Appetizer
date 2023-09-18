//
//  AccountView.swift
//  Appetizers
//
//  Created by Anshu Vij on 12/09/23.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusedTextField : FormTextField?
    
    enum FormTextField {
        
        case firstName,lastName,email
    }
    
    var body: some View {
        
        NavigationView {
            
            Form {
                Section {
                    
                    TextField(text: $viewModel.user.firstName) {
                        Text("First Name")
                    }.autocorrectionDisabled()
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit {
                            focusedTextField = .lastName
                        }
                        .submitLabel(.next)
                    
                    TextField(text: $viewModel.user.lastName) {
                        Text("Last Name")
                    }.focused($focusedTextField, equals: .lastName)
                        .onSubmit {
                            focusedTextField = .email
                        }
                        .submitLabel(.next)
                    .autocorrectionDisabled()
                    
                    TextField(text: $viewModel.user.email) {
                        Text("Email")
                    }
                    .focused($focusedTextField, equals: .email)
                    .onSubmit {
                        focusedTextField = nil
                    }
                    .submitLabel(.continue)
                    .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    
                    DatePicker("Birthday", selection: $viewModel.user.dateDate, displayedComponents: .date)
                    
                    Button {
                        viewModel.saveChanges()
                       
                        
                    } label: {
                        
                        Text("Save Changes")
                    }
                    
                    
                } header: {
                    Text("Personal Info")
                }
                
                Section {
                
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                       
                    Toggle("Frequent Refils", isOn: $viewModel.user.frequentRefils)
                        
                    
                } header: {
                    Text("Requests")
                    
                }
                .toggleStyle(SwitchToggleStyle.init(tint: .brandPrimary))

                
                
                   
            } .navigationTitle("🤪 Account")
                .toolbar(content: {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button("Dismiss") {
                            focusedTextField = nil
                        }
                    }
                })
                .alert(item: $viewModel.alertValue, content: { alertItem in
                    Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
                })
        }.onAppear {
            viewModel.retrieveUser()
        }
       
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
