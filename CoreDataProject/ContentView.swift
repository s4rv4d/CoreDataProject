//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Sarvad shetty on 1/29/20.
//  Copyright © 2020 Sarvad shetty. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var filter = "A"
        
    var body: some View {
       //list
        
        VStack {
            
            FilteredList(filterKey: "lastName", filterValue: filter) { (singer:Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            Button("Add") {
                let taylor = Singer(context: self.moc)
                taylor.firstName = "Taylor"
                taylor .lastName = "Swift"
                
                let ed = Singer(context: self.moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: self.moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? self.moc.save()
            }
            
            Button("Filter A") {
                self.filter = "A"
            }
            
            Button("Filter S") {
                self.filter = "S"
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
