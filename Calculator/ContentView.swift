//
//  ContentView.swift
//  Calculator
//
//  Created by Riyuan Liu on 12/26/23.
//

import SwiftUI

enum CalcButton: String{
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case clear = "C"
    case parenthesis = "( )"
    case divide = "/"
    case percent = "%"
    case multiplication = "X"
    case subtraction = "-"
    case addition = "+"
    case equal = "="
    case point = "."
    case invertsign = "+/-"
    
    var buttonColor: Color{
        switch self {
        case .clear, .parenthesis,.percent,.divide,.multiplication,.subtraction,.addition:
            return Color(.darkGray)
        case .equal:
            return .green
        default:
            return Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
        }
    }
    var textColor:Color{
        switch self{
        case .parenthesis,.percent,.divide,.multiplication,.subtraction,.addition:
            return .green
        case .clear:
            return .orange
        default:
            return .white
        }
    }
}
enum Operation{
    case add,subtract,multiplation,divide,none
}
struct ContentView: View {
    @State var value = "0"
    @State var temp = 0
    @State var currentOperation:Operation = .none;
    @State var currentfunction = ""
    @State var tempv = 0
    let buttons: [[CalcButton]]=[
        [.clear, .parenthesis, .percent, .divide],
        [.seven, .eight, .nine, .multiplication],
        [.four, .five, .six, . subtraction],
        [.one, .two, .three, .addition],
        [.invertsign, .zero, .point, .equal]
    ]
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Spacer()
                    Text(currentfunction)
                        .bold()
                        .font(.system(size: 72))
                        .foregroundColor(.white)
                }
                Spacer()
                //Text Display
                HStack{
                    Spacer()
                    Text(value)
                        .bold()
                        .font(.system(size: 50))
                        .foregroundColor(Color(.darkGray))
                }
                .padding()
                //Buttons
                
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12){
                        ForEach(row, id: \.self) { item in
                            Button(action: {
                                self.didTap(button: item)
                            }, label: {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .frame(
                                        width: self.buttonWidth(item: item),
                                        height: self.buttonHeight())
                                    .background(item.buttonColor)
                                    .foregroundColor(item.textColor)
                                    .cornerRadius(self.buttonWidth(item: item)/2)
                            })
                        }
                    }
                    .padding(.bottom,3)
                        
                }
                
                
            }
        }
    }
    func didTap(button:CalcButton){
        switch button{
        case .addition, .subtraction, .multiplication, .divide, .equal:
            if button == .addition{
                if self.currentOperation != .none{
                    let number = button.rawValue
                    self.currentfunction = "\(self.currentfunction)\(number)"
                    let tempvalue = self.temp
                    let curvalue = Int(self.value) ?? 0
                    switch self.currentOperation {
                    case .add:
                        self.value = "\(curvalue + tempvalue)"
                    case .subtract:
                        self.value = "\(tempvalue - curvalue)"
                    case .multiplation:
                        self.value = "\(curvalue * tempvalue)"
                    case .divide:
                        self.value = "\(tempvalue / curvalue)"
                    case .none:
                        break
                    }
                    self.currentOperation = .add
                    self.temp = Int(self.value) ?? 0
                }else{
                    let number = button.rawValue
                    self.currentfunction = "\(self.value)\(number)"
                    self.currentOperation = .add
                    self.temp = Int(self.value) ?? 0
                }
            }
            if button == .subtraction{
                if self.currentOperation != .none{
                    let number = button.rawValue
                    self.currentfunction = "\(self.currentfunction)\(number)"
                    let tempvalue = self.temp
                    let curvalue = Int(self.value) ?? 0
                    switch self.currentOperation {
                    case .add:
                        self.value = "\(curvalue + tempvalue)"
                    case .subtract:
                        self.value = "\(tempvalue - curvalue)"
                    case .multiplation:
                        self.value = "\(curvalue * tempvalue)"
                    case .divide:
                        self.value = "\(tempvalue / curvalue)"
                    case .none:
                        break
                    }
                    self.currentOperation = .subtract
                    self.temp = Int(self.value) ?? 0
                }else{
                    let number = button.rawValue
                    self.currentfunction = "\(self.value)\(number)"
                    self.currentOperation = .subtract
                    self.temp = Int(self.value) ?? 0
                }
            }
            if button == .multiplication{
                if self.currentOperation != .none{
                    let number = button.rawValue
                    self.currentfunction = "\(self.currentfunction)\(number)"
                    let tempvalue = self.temp
                    let curvalue = Int(self.value) ?? 0
                    switch self.currentOperation {
                    case .add:
                        self.value = "\(curvalue + tempvalue)"
                    case .subtract:
                        self.value = "\(tempvalue - curvalue)"
                    case .multiplation:
                        self.value = "\(curvalue * tempvalue)"
                    case .divide:
                        self.value = "\(tempvalue / curvalue)"
                    case .none:
                        break
                    }
                    self.currentOperation = .multiplation
                    self.temp = Int(self.value) ?? 0
                }else{
                    let number = button.rawValue
                    self.currentfunction = "\(self.value)\(number)"
                    self.currentOperation = .multiplation
                    self.temp = Int(self.value) ?? 0
                }
            }
            if button == .divide{
                if self.currentOperation != .none{
                    let number = button.rawValue
                    self.currentfunction = "\(self.currentfunction)\(number)"
                    let tempvalue = self.temp
                    let curvalue = Int(self.value) ?? 0
                    switch self.currentOperation {
                    case .add:
                        self.value = "\(curvalue + tempvalue)"
                    case .subtract:
                        self.value = "\(tempvalue - curvalue)"
                    case .multiplation:
                        self.value = "\(curvalue * tempvalue)"
                    case .divide:
                        self.value = "\(tempvalue / curvalue)"
                    case .none:
                        break
                    }
                    self.currentOperation = .divide
                    self.temp = Int(self.value) ?? 0
                }else{
                    let number = button.rawValue
                    self.currentfunction = "\(self.value)\(number)"
                    self.currentOperation = .divide
                    self.temp = Int(self.value) ?? 0
                }
            }
            if button == .equal{
                let number = button.rawValue
                let tempvalue = self.temp
                let curvalue = Int(self.value) ?? 0
                switch self.currentOperation {
                case .add: 
                    self.value = "\(curvalue + tempvalue)"
                case .subtract:
                    self.value = "\(tempvalue - curvalue)"
                case .multiplation:
                    self.value = "\(curvalue * tempvalue)"
                case .divide: 
                    self.value = "\(tempvalue / curvalue)"
                case .none:
                    break
                }
                self.currentfunction = self.value
                self.temp = Int(self.value) ?? 0
                self.value = ""
            }
            if button != .equal{
                self.value = "0"
            }
        case .clear:
            self.currentfunction = ""
            self.value = "0"
            self.currentOperation = .none
        case .point:
            break
        case .invertsign:
            let curvalue = Int(self.value) ?? 0
            self.value = "\(curvalue * -1)"
        case .percent:
            break
        default:
            let number = button.rawValue
            if self.value == "0"{
                if self.currentOperation != .none{
                    currentfunction = "\(self.currentfunction)\(number)"
                    value = number
                }
                else{
                    currentfunction = "\(self.currentfunction)\(number)"
                    value = number
                }
            }else{
                self.currentfunction = "\(self.currentfunction)\(number)"
                self.value = "\(self.value)\(number)"
            }
        }
    }
    func buttonWidth(item:CalcButton) -> CGFloat{
        return (UIScreen.main.bounds.width-(5*12)) / 4
    }
    func buttonHeight() -> CGFloat{
        return (UIScreen.main.bounds.width-(5*12)) / 4
    }
}

#Preview {
    ContentView()
}
