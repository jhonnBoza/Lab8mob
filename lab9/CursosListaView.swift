import SwiftUI

struct CursosListaView: View {
    @State private var cursos = CursosEjemplo.iniciales
    @State private var mostrarFormulario = false

    var body: some View {
        List {
            ForEach(cursos) { curso in
                NavigationLink(curso.nombre) {
                    CourseDetailView(curso: curso)
                }
            }
        }
        .navigationTitle("Cursos")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    mostrarFormulario = true
                } label: {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("Agregar curso")
            }
        }
        .sheet(isPresented: $mostrarFormulario) {
            CourseFormView(cursos: $cursos)
        }
    }
}

#Preview {
    NavigationStack {
        CursosListaView()
    }
}
