//
//  ContentView.swift
//  M25
//
//  Created by Nataly on 10.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var receiveNotifications = false
    @State private var newsNotifications = false
    @State private var friendUpdatesNotifications = false
    @State private var showingLogoutAlert = false
    @State private var date = Date()
    @State private var gender = "Мужской"
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Личные данные")) {
                    TextField("Имя", text: .constant(""))
                    TextField("Фамилия", text: .constant(""))
                    DatePicker("Дата рождения", selection: $date, displayedComponents: [.date])
                    NavigationLink(destination: GenderSelectionView(gender: $gender)) {
                        HStack {
                            Text("Пол")
                            Spacer()
                            Text(gender)
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                Section(header: Text("Нотификации")) {
                    Toggle("Получать нотификации", isOn: $receiveNotifications)
                    if receiveNotifications {
                        Toggle("Новости", isOn: $newsNotifications)
                        Toggle("Обновления друзей", isOn: $friendUpdatesNotifications)
                        
                    }
                }
                
                Section(header: Text("Документы")) {
                    Button(action: {}) {
                        Text("Личные данные")
                            .foregroundColor(.blue)
                    }
                    Button(action: {}) {
                        Text("Условия использования")
                            .foregroundColor(.blue)
                    }
                }
                
                Section {
                    Button(action: {
                        showingLogoutAlert = true
                    }) {
                        Text("Выход")
                            .foregroundColor(.red)
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Настройки")
            .alert(isPresented: $showingLogoutAlert) {
                Alert(title: Text("Выход"), message: Text("Вы уверены, что хотите выйти?"), primaryButton: .cancel(), secondaryButton: .destructive(Text("Exit"), action: {
                }))
            }
        }
    }
}
struct GenderSelectionView: View {
    
    @Binding var gender: String
    
    var body: some View {
        List {
            Button(action: {
                gender = "Мужской"
            }) {
                HStack {
                    Text("Мужской")
                    Spacer()
                    if gender == "Мужской" {
                        Image(systemName: "checkmark")
                            .foregroundColor(.blue)
                    }
                }
            }
            Button(action: {
                gender = "Женский"
            }) {
                HStack {
                    Text("Женский")
                    Spacer()
                    if gender == "Женский" {
                        Image(systemName: "checkmark")
                            .foregroundColor(.blue)
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
        .navigationTitle("Выберите пол")
    }
}
