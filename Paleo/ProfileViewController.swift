//
//  ProfileViewController.swift
//  Paleo
//
//  Created by Adam Wilkie on 4/24/23.
//

import SwiftUI

import SwiftUI

struct ProfileViewController: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(user.profileImageUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(10)
                
                Text(user.name)
                    .font(.title)
                    .bold()
                    .padding(.top)
                
                Text(user.email)
                    .font(.body)
                    .padding()
                
                Text(user.bio)
                    .font(.body)
                    .padding()
                
                Button(action: {
                    // Update user profile
                }) {
                    Text("Update Profile")
                }
            }
        }
        .navigationBarTitle("Profile")
    }
}

