import SwiftUI

struct Actividad01StacksView: View {
    var body: some View {
        VStack(spacing: 16) {
            VStack {
                Text("Aplicaciones de Tecsup en SwiftUI!")
                    .font(.title)
                    .foregroundStyle(.red)
                    .multilineTextAlignment(.center)
                Text("Desarrollado por: estudiante lab9")
            }
            .padding(20)
            HStack(alignment: .center, spacing: 20) {
                Text("Actividad01")
                Text("Actividad02")
                Text("Actividad03")
            }
            ZStack {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 200, height: 200)
                Text("Texto encima de la imagen")
                    .foregroundStyle(.white)
            }
        }
        .navigationTitle("Actividad 01")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        Actividad01StacksView()
    }
}
