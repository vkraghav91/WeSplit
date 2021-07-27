//
//  ContentView.swift
//  WeSplit
//
//  Created by Varun Kumar Raghav on 27/07/21.
//

import SwiftUI

struct ContentView: View {
    let students = ["Ankit","Varun","Deepak","Sunil","Vivek","Balram"]
    @State private var selectedStudent = 0
    var body: some View {
        VStack {
            Picker("Select Student", selection: $selectedStudent){
                ForEach(0 ..< students.count){
                    Text(self.students[$0])
                }
            }
             Text("Selected Student is \(students[selectedStudent])")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

