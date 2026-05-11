import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Actividades iniciales") {
                    NavigationLink("Actividad 01 — Stacks") {
                        Actividad01StacksView()
                    }
                    NavigationLink("Ventana 02 — Contenedores") {
                        Ventana02()
                    }
                    NavigationLink("Ventana 03 — Peso ideal") {
                        Ventana03PesoIdealView()
                    }
                }

                Section("Navegación y cálculos") {
                    NavigationLink("Calculadora CTS") {
                        CTSView()
                    }
                }

                Section("Listas (trabajo con List)") {
                    NavigationLink("Lista simple — Frutas") {
                        ListaFrutasView()
                    }
                    NavigationLink("Lista de cursos") {
                        CursosListaView()
                    }
                }
            }
            .navigationTitle("Menú principal")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    ContentView()
}
