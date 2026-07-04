import SwiftUI
import MapKit

struct TripMapView: View {
    let headline: String
    let originName: String
    let originCoordinate: CLLocationCoordinate2D
    let destinationName: String
    let destinationCoordinate: CLLocationCoordinate2D
    let driverCoordinate: CLLocationCoordinate2D
    let actionTitle: String?
    let action: (() -> Void)?

    private var cameraPosition: MapCameraPosition {
        .region(
            MKCoordinateRegion(
                center: midpoint(originCoordinate, destinationCoordinate),
                span: MKCoordinateSpan(latitudeDelta: 0.09, longitudeDelta: 0.09)
            )
        )
    }

    var body: some View {
        VStack(spacing: 16) {
            Text(headline)
                .font(.title2.bold())

            Map(initialPosition: cameraPosition) {
                Marker(originName, coordinate: originCoordinate)

                Marker(destinationName, coordinate: destinationCoordinate)
                    .tint(.red)

                MapPolyline(coordinates: [originCoordinate, destinationCoordinate])
                    .stroke(.blue, lineWidth: 4)

                Annotation("You", coordinate: driverCoordinate) {
                    Image(systemName: "car.fill")
                        .font(.headline)
                        .padding(8)
                        .background(.blue, in: Circle())
                        .foregroundStyle(.white)
                }
            }
            .frame(height: 340)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.horizontal)

            VStack(alignment: .leading, spacing: 6) {
                Label(originName, systemImage: "mappin.circle")
                Label(destinationName, systemImage: "flag.checkered")
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)
            .padding(.horizontal)

            if let actionTitle, let action {
                Button(actionTitle, action: action)
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .padding(.horizontal)
            } else {
                ProgressView("On the way…")
            }

            Spacer()
        }
        .padding(.top)
    }

    private func midpoint(_ a: CLLocationCoordinate2D, _ b: CLLocationCoordinate2D) -> CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: (a.latitude + b.latitude) / 2,
            longitude: (a.longitude + b.longitude) / 2
        )
    }
}

#Preview {
    TripMapView(
        headline: "Driving to pickup",
        originName: SampleData.driverHome.name,
        originCoordinate: SampleData.driverHome.coordinate,
        destinationName: SampleData.walmartStoryRoad.name,
        destinationCoordinate: SampleData.walmartStoryRoad.coordinate,
        driverCoordinate: SampleData.driverHome.coordinate,
        actionTitle: nil,
        action: nil
    )
}
