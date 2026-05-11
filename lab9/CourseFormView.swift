import SwiftUI

struct CourseFormView: View {
    @Environment(\.dismiss) private var dismiss

    @Binding var cursos: [Curso]

    @State private var nombre = ""
    @State private var descripcion = ""
    @State private var creditosTexto = "3"

    var body: some View {
        NavigationStack {
            Form {
                Section("Nuevo curso") {
                    TextField("Nombre", text: $nombre)
                    TextField("Descripción", text: $descripcion, axis: .vertical)
                        .lineLimit(3 ... 6)
                    TextField("Créditos", text: $creditosTexto)
                        .keyboardType(.numberPad)
                }
            }
            .navigationTitle("Agregar curso")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Guardar") { guardar() }
                        .disabled(nombre.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
    }

    private func guardar() {
        let creditos = Int(creditosTexto) ?? 0
        let nuevo = Curso(
            nombre: nombre.trimmingCharacters(in: .whitespacesAndNewlines),
            descripcion: descripcion.trimmingCharacters(in: .whitespacesAndNewlines),
            creditos: max(0, creditos)
        )
        cursos.append(nuevo)
        dismiss()
    }
}

#Preview {
    CourseFormView(cursos: .constant(CursosEjemplo.iniciales))
}
