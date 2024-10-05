//
//  ContentView.swift
//  NuwaApp
//
//  Created by happyo on 2024/10/5.
//

import SwiftUI
import Nuwa

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button {
                showUser()
            } label: {
                Text("show user")
            }
        }
        .padding()
    }
    
    private func showUser() {
        let rng = SystemRandomNumberGenerator()
        let (user, _) = Gen<User>.user().sample(using: rng)
        print(user)
        
        let otherUser = User.generate()
        print(otherUser)
        
        check("Test", using: Gen<Int>.int(in: 1...300)) { x in
            print(x)
            return x + x == x + x
        }
    }
}

struct User {
    let name: String
    let age: Int
}

extension User: Arbitrary {
    static var arbitrary: Gen<User> {
        return Gen<User> { rng in
            let (name, rng1) = Gen<String>.string(length: 5).sample(using: rng)
            let (age, rng2) = Gen<Int>.int(in: 18...60).sample(using: rng1)
            return (User(name: name, age: age), rng2)
        }
    }
}

extension Gen where T == User {
    static func user() -> Gen<User> {
        return Gen<User> { rng in
            let (name, rng1) = Gen<String>.string(length: 5).sample(using: rng)
            let (age, rng2) = Gen<Int>.int(in: 18...60).sample(using: rng1)
            return (User(name: name, age: age), rng2)
        }
    }
}

#Preview {
    ContentView()
}
