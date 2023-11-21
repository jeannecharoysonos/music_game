//
//  TimerModel.swift
//  music_game
//
//  Created by Jeanne Charoy on 20/10/2023.
//

import Foundation

class TimerViewModel: ObservableObject {
    @Published var selectedMinutesAmount = 10
    @Published var selectedSecondsAmount = 10

    let minutesRange = 0...59
    let secondsRange = 0...59
}

struct TimerView: View {
    @StateObject private var model = TimerViewModel()

    var body: some View {
        HStack() {
            TimePickerView(title: "hours",
                range: model.hoursRange,
                binding: $model.selectedHoursAmount)
            TimePickerView(title: "min",
                range: model.minutesRange,
                binding: $model.selectedMinutesAmount)
            TimePickerView(title: "sec",
                range: model.secondsRange,
                binding: $model.selectedSecondsAmount)
        }
        .padding(.all, 32)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .foregroundColor(.white)
    }
}
