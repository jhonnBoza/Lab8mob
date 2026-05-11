import SwiftUI

struct Ventana03PesoIdealView: View {
    @State private var altura: String = ""
    @State private var edad: String = ""
    @State private var genero: String = "Hombre"
    @State private var pesoIdeal: Double?

    private let generos = ["Hombre", "Mujer"]

    var body: some View {
        VStack(spacing: 20) {
            Text("Calculadora de Peso Ideal")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)

            TextField("Ingrese su altura en cm", text: $altura)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            TextField("Ingrese su edad (opcional)", text: $edad)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            Picker("Seleccione su género", selection: $genero) {
                ForEach(generos, id: \.self) { g in
                    Text(g)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)

            Button(action: calcularPesoIdeal) {
                Text("Calcular Peso Ideal")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
            }

            Text("Lab GLAB-S09 — SwiftUI")
                .font(.footnote)
                .foregroundStyle(.secondary)

            if let peso = pesoIdeal {
                Text("Peso Ideal: \(String(format: "%.1f", peso)) kg")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding()
            }

            Spacer()
        }
        .navigationTitle("Peso ideal")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func calcularPesoIdeal() {
        guard let alturaCm = Double(altura) else {
            pesoIdeal = nil
            return
        }
        if genero == "Hombre" {
            pesoIdeal = 50 + 0.9 * (alturaCm - 152)
        } else {
            pesoIdeal = 45.5 + 0.9 * (alturaCm - 152)
        }
    }
}

#Preview {
    NavigationStack {
        Ventana03PesoIdealView()
    }
}
