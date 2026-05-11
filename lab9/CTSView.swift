import SwiftUI

struct CTSView: View {
    @State private var sueldoTexto = ""
    @State private var gratificacionTexto = ""
    @State private var mesesTexto = ""
    @State private var cts: Double?

    var body: some View {
        Form {
            Section("Datos") {
                TextField("Sueldo mensual (S/)", text: $sueldoTexto)
                    .keyboardType(.decimalPad)
                TextField("Gratificación anual (S/)", text: $gratificacionTexto)
                    .keyboardType(.decimalPad)
                TextField("Meses trabajados en el semestre", text: $mesesTexto)
                    .keyboardType(.decimalPad)
            }

            Section {
                Button("Calcular CTS") {
                    calcular()
                }
            }

            if let valor = cts {
                Section("Resultado") {
                    Text("CTS estimado: S/ \(String(format: "%.2f", valor))")
                        .fontWeight(.semibold)
                }
            }

            Section("Fórmula") {
                Text("CTS = (Sueldo + Gratificación ÷ 6) × (Meses ÷ 12)")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
        .navigationTitle("Cálculo CTS")
    }

    private func calcular() {
        guard
            let sueldo = Double(sueldoTexto.replacingOccurrences(of: ",", with: ".")),
            let grat = Double(gratificacionTexto.replacingOccurrences(of: ",", with: ".")),
            let meses = Double(mesesTexto.replacingOccurrences(of: ",", with: ".")),
            meses >= 0, meses <= 12
        else {
            cts = nil
            return
        }
        let base = sueldo + grat / 6
        cts = base * (meses / 12)
    }
}

#Preview {
    NavigationStack {
        CTSView()
    }
}
