import SwiftUI

struct ListaFrutasView: View {
    private let frutas = ["Manzana", "Pera", "Uva", "Fresa", "Mango", "Piña"]

    var body: some View {
        List(frutas, id: \.self) { fruta in
            Text(fruta)
        }
        .navigationTitle("Frutas")
    }
}

#Preview {
    NavigationStack {
        ListaFrutasView()
    }
}
