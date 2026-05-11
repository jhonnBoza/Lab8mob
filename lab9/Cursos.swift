import Foundation

struct Curso: Identifiable, Hashable {
    let id: UUID
    var nombre: String
    var descripcion: String
    var creditos: Int

    init(id: UUID = UUID(), nombre: String, descripcion: String, creditos: Int) {
        self.id = id
        self.nombre = nombre
        self.descripcion = descripcion
        self.creditos = creditos
    }
}

enum CursosEjemplo {
    static let iniciales: [Curso] = [
        Curso(nombre: "Programación Móvil Avanzado", descripcion: "SwiftUI, navegación y listas.", creditos: 4),
        Curso(nombre: "Desarrollo Web", descripcion: "Front-end y APIs.", creditos: 3),
        Curso(nombre: "Bases de Datos", descripcion: "SQL y diseño relacional.", creditos: 3),
    ]
}
