//
//  Slider.swift
//  SliderGameSwiftUI
//
//  Created by Vladislav Ryabtsev on 01.02.2022.
//

import SwiftUI

struct SliderFromUIKit: UIViewRepresentable {
    
    @Binding var value: Double
    
    let color: UIColor
    let alfa: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.thumbTintColor = UIColor(.red)
        slider.minimumValue = 1
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = color.withAlphaComponent(CGFloat(alfa) / 100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}


extension SliderFromUIKit {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct SliderFromUIKit_Prewiews: PreviewProvider {
    static var previews: some View {
        SliderFromUIKit(value: .constant(50), color: .red, alfa: 100)
    }
}
