//
//  ContentView.swift
//  WeSplit
//
//  Created by Varun Kumar Raghav on 27/07/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
  //  @State private var numberOfPeople = 2
    @State private var numberOfPeople = 1
    @State private var tipPercentage = 2
    var isZeroTip: Bool{
                        if(Double(tipPercentages[tipPercentage]) == 0) {
                            return false
                        }
                        else{
                            return true
                        }
        
                }
    let tipPercentages = [10, 15, 20, 25, 0]
    var totalValue:Double{
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandValue = orderAmount + tipValue
        return grandValue
    }
    var totalPerPerson:Double {
        // calculate the total per person here
        let peopleCount = Double(numberOfPeople + 2)
//        let peopleCount = Double(numberOfPeople)
        return totalValue / peopleCount
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Enter the amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
//                    Picker("Number of Peopl2e", selection: $numberOfPeople){
//                        ForEach(2 ..< 100){
//                            Text("\($0) people")
//                        }
//                    }
                    
                    TextField("No. of people", value: $numberOfPeople, formatter: NumberFormatter()).keyboardType(.numberPad)
                }
                Section(header: Text("How much tip do you want to leave?")){
                    Picker("Tip Percentage", selection: $tipPercentage){
                        ForEach(0 ..< tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                        
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Total Amount")){
                    if isZeroTip{
                            Text("$ \(totalValue, specifier: "%.2f")")
                                .foregroundColor(.blue)}
                    else{
                            Text("$ \(totalValue, specifier: "%.2f")")
                            .foregroundColor(.red)}
                    
                }
                Section(header: Text("Amount Per Person")){
                    Text("$ \(totalPerPerson, specifier: "%.2f")")
                }
                
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


