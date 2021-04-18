/// A view that displays a map.
///
/// `Map` creates a map view displaying a specific region and optinally configuring
/// available interactions, user location and tracking behaviour. Annotations
/// can also be shown on the map. `Map` is available when 
/// [`MapKit`](https://developer.apple.com/documentation/mapkit/) is imported.
/// The simplest way to initialise a map is to provide a binding to an `MKCoordinateRegion`.
/// This binding is automatically updated when the user interacts with the map.
/// With `MKCoordinateSpan` you can control how much of the map is shown, 
/// the bigger the value, the more zoomed out the map appears.
///
/// ```
/// import MapKit
///
/// struct MapExample: View {
///     @State private var location = MKCoordinateRegion(
///         center:
///             CLLocationCoordinate2D(
///                 latitude: 37.3330,
///                 longitude: -122.0090),
///         span:
///             MKCoordinateSpan(
///                 latitudeDelta: 0.01,
///                 longitudeDelta: 0.01
///             )
///     )
/// 
///     var body: some View {
///         Map(coordinateRegion: $location)
///     }
/// }
/// ```
///
/// TODO: Screenshot
@available(iOS 14.0, tvOS 14.0, macOS 11.0, watchOS 7.0, *)
public struct Map<Content> : View where Content : View {
    /// TODO
}