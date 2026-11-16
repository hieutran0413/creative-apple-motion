import SwiftUI

@available(iOS 17.0, macOS 14.0, *)
struct ShaderStudy: View {
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var emphasized = false

    var body: some View {
        VStack(spacing: 24) {
            RoundedRectangle(cornerRadius: 32)
                .fill(.orange)
                .frame(width: 220, height: 160)
                .colorEffect(ShaderLibrary.motionTint(.float(emphasized ? 0.65 : 0)))
                .scaleEffect(emphasized && !reduceMotion ? 1.04 : 1)
                .accessibilityHidden(true)
            Button(emphasized ? "Reset appearance" : "Emphasize appearance") {
                withAnimation(reduceMotion ? nil : .easeInOut(duration: 0.25)) {
                    emphasized.toggle()
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(32)
    }
}
