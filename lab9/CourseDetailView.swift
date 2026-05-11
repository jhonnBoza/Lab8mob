import SwiftUI

struct CourseDetailView: View {
    let curso: Curso

    var body: some View {
        List {
            Section("Curso") {
                LabeledContent("Nombre", value: curso.nombre)
                LabeledContent("Créditos", value: "\(curso.creditos)")
            }
            Section("Descripción") {
                Text(curso.descripcion)
            }
        }
        .navigationTitle(curso.nombre)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        CourseDetailView(curso: CursosEjemplo.iniciales[0])
    }
}
