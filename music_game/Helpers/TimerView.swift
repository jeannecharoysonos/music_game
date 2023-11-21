//
//  Timer.swift
//  music_game
//
//  Created by Jeanne Charoy on 20/10/2023.
//

import SwiftUI


struct TimerView: View {
    
    @EnvironmentObject var modelData: ModelData
    @Binding var userIndex: Int
    
    @State var currentDate = Date.now
   //  @State var timeRemaining = 60
    @State var isRunning = false
     
     //@State var dateTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect() // date timer update the time for every second
     
     @State var counTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect() // updates the counter.

     var body: some View {
         VStack(spacing: 20) {
             //Text("Date: \(currentDate.formatted(date: .numeric, time: .standard))")
               //  .font(.title)
                 //.onReceive(dateTimer) { input in
                   //  currentDate = input
                 //}
             
             Text("\(modelData.users[userIndex].timeRemaining)")
                .font(.largeTitle)
                .frame(width: 100, height: 100, alignment: .center)
                .padding()
                .overlay(
                    Circle()
                     .stroke(Color.pink, lineWidth: 4)
                     .padding(2)
                    )
                .foregroundColor(.black)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                //.background(.black.opacity(0.50))
                 .onReceive(counTimer) { time in
                     if isRunning{
                         if modelData.users[userIndex].timeRemaining > 0 {
                             modelData.users[userIndex].timeRemaining -= 1
                         }
                     }
             }
                 
             
             HStack {
                 Button("Stop") {
                     counTimer.upstream.connect().cancel()
                     self.isRunning=false
                 }.foregroundColor(.pink)
                     .font(.system(size: 20))

                 
                 Button("Start") {
                     self.counTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                     self.isRunning=true
                     
                 }.foregroundColor(.pink)
                     .font(.system(size: 20))
                 
                 Button("Reset") {
                   //  self.dateTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                     modelData.users[userIndex].timeRemaining = 60

                 }.foregroundColor(.pink)
                     .font(.system(size: 20))

             }
             
           
             
          
             
         
         }
     }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(userIndex: .constant(0))
            .environmentObject(ModelData())
    }
}
