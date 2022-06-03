//
//  ProfileView.swift
//  Gotcha
//
//  Created by Blake Ankner on 5/19/22.
//

import SwiftUI
import FirebaseFirestore

struct ProfileView: View {
    
//    @EnvironmentObject private var bool: dead
    
    let backgroundGradient = LinearGradient(
        colors: [Color("lightBlue"), Color("secondBlue")],
        startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        List{
            Section(){
                VStack {
                    VStack(alignment: .leading){
                        Label("Profile", systemImage: "person.circle.fill")
                            .foregroundColor(Color("lightGrey"))
                    }
                    .padding(.bottom, 8)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    
                    VStack (alignment: .center){
                        HStack{
                            Image("blakeProfile")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .frame(width: 150, height: 150)
                        }
                        HStack{
                            Text("Blake")
        //                        .padding()
                                .font(.title)
                                .foregroundColor(Color("white"))
        //                        .background(Color("lightPurple"))
                                .cornerRadius(20)
                        }
                    }
//                    Spacer(minLength: 50)
                    VStack{
                        Text("🎯 YAMAN HABIP")
                            .fixedSize()
                            .multilineTextAlignment(.center)
//                            .padding()
                            .font(.title3)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(Color("lightGrey"))
    //                        .background(Color("offGrey"))
                            .cornerRadius(20)
//                            .shadow(color: Color("darkRed"), radius: 4, x: 4, y: 4)
                        
                        Text("#️⃣ 5 tags")
                            .multilineTextAlignment(.center)
                            .fixedSize()
//                            .padding()
                            .font(.title3)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .foregroundColor(Color("lightGrey"))
    //                        .background(Color("offGrey"))
                            .cornerRadius(20)
//                            .shadow(color: Color("darkBlue"), radius: 4, x: 4, y: 4)
                        
        //                .shadow(color: .white, radius: 2, x: 2, y: 2)
                    }
    //
                }
//                .padding()
            }
            .padding()
//            I WANTED HEXAGON BUTTON BUT IDC ENOUGH ANYMORRE
            Section(){
                VStack{
                    VStack(alignment: .leading){
                        Label("Tag Out", systemImage: "xmark.seal.fill")
                            .foregroundColor(Color("lightGrey"))
                    }
                    .padding(.bottom, 8)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
//                if dead
                    HalvedCircularBar()
                        .padding()
                }
            }
            .padding(.top ,15)
            .padding(.leading ,15)
        }
    }
}

struct HalvedCircularBar: View {
    
    @State private var pressing: Bool = false
    @State var progress: CGFloat = 0.0
    @State var circleProgress: CGFloat = 0.0
//    @StateObject var dead: Bool = false
    
    var body: some View {
            VStack {
                ZStack {
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    Circle()
                        .foregroundColor(Color("offGrey"))
                    Circle()
                        .trim(from: 0.0, to: circleProgress)
                        .stroke(Color("salmon"), lineWidth: 5)
                        .frame(width: 150-15*2, height: 150-15*2)
                        .rotationEffect(Angle(degrees: -90))
                             //...
                    Button("Tag Out"){}
                        ._onButtonGesture { pressing in
                                        self.pressing = pressing
                                    } perform: {
                                        impactMed.impactOccurred()
//                                        pressing.toggle()
                                        self.startLoading()
                                    }
                                    .foregroundColor(Color("offWhite"))
                                    
                    }
            }
        }
    func startLoading() {
            _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                withAnimation() {
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    if self.circleProgress == 1.0{
//                        dead.toggle()
                    }
                    if self.pressing && self.circleProgress <= 1.0{
                        self.circleProgress += 0.02
                        if self.circleProgress >= 1.0 {
                            timer.invalidate()
                        }
                        if self.circleProgress >= 0.5{
                            impactMed.impactOccurred()
                        }
                    }
                    if pressing == false && self.circleProgress >= 0{
                        self.circleProgress -= 0.025
//                        self.circleProgress = 0
                    }
                }
            }
        }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portrait)
    }
}
