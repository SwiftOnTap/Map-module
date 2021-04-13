@available(iOS 14.0, tvOS 14.0, macOS 11.0, *)
extension MKGradientPolylineRenderer {

    public var locations: [CGFloat] { get }

    public func setColors(_ colors: [UIColor], locations: [CGFloat])
}

@available(iOS 14.0, tvOS 14.0, macOS 11.0, *)
extension MKMultiPoint {

    public func locations(at indexes: IndexSet) -> [CGFloat]
}

@available(macOS 10.15, iOS 13.0, tvOS 13.0, *)
extension MKLocalSearch.Request {

    public typealias ResultType = MKLocalSearch.ResultType
}


// MARK: - SwiftUI Additions

import SwiftUI

// Available when SwiftUI is imported with MapKit
@available(iOS 14.0, tvOS 14.0, macOS 11.0, watchOS 7.0, *)
public struct Map<Content> : View where Content : View {

    /// Creates an instance showing a specific region and optionally configuring
    /// available interactions, user location and tracking behavior as well as
    /// annotations.
    ///
    /// - Parameters:
    /// - mapRect: The map rect to display.
    /// - interactions: The types of user interactions that should be enabled.
    /// - showsUserLocation: Whether to display the user's location in this Map
    ///   or not. Only takes effect if the user has authorized the app to access
    ///   their location.
    /// - userTrackingMode: How the map should respond to user location updates
    /// - annotationItems: The collection of data backing the annotation views
    /// - annotationContent: A closure producing the annotation content
    public init<Items, Annotation>(mapRect: Binding<MKMapRect>, interactionModes: MapInteractionModes = .all, showsUserLocation: Bool = false, userTrackingMode: Binding<MapUserTrackingMode>? = nil, annotationItems: Items, annotationContent: @escaping (Items.Element) -> Annotation) where Content == _DefaultAnnotatedMapContent<Items>, Items : RandomAccessCollection, Annotation : MapAnnotationProtocol, Items.Element : Identifiable

    /// Creates an instance showing a specific region and optionally configuring
    /// available interactions, user location and tracking behavior as well as
    /// annotations.
    ///
    /// - Parameters:
    /// - coordinateRegion: The coordinate region to display.
    /// - interactions: The types of user interactions that should be enabled.
    /// - showsUserLocation: Whether to display the user's location in this Map
    ///   or not. Only takes effect if the user has authorized the app to access
    ///   their location.
    /// - userTrackingMode: How the map should respond to user location updates
    /// - annotationItems: The collection of data backing the annotation views.
    /// - annotationContent: A closure producing the annotation content.
    public init<Items, Annotation>(coordinateRegion: Binding<MKCoordinateRegion>, interactionModes: MapInteractionModes = .all, showsUserLocation: Bool = false, userTrackingMode: Binding<MapUserTrackingMode>? = nil, annotationItems: Items, annotationContent: @escaping (Items.Element) -> Annotation) where Content == _DefaultAnnotatedMapContent<Items>, Items : RandomAccessCollection, Annotation : MapAnnotationProtocol, Items.Element : Identifiable

    /// Creates an instance showing a specific region and optionally configuring
    /// available interactions, user location and tracking behavior.
    ///
    /// - Parameters:
    /// - mapRect: The map rect to display.
    /// - interactions: The types of user interactions that should be enabled.
    /// - showsUserLocation: Whether to display the user's location in this Map
    ///   or not. Only takes effect if the user has authorized the app to access
    ///   their location.
    /// - userTrackingMode: How the map should respond to user location updates
    public init(mapRect: Binding<MKMapRect>, interactionModes: MapInteractionModes = .all, showsUserLocation: Bool = false, userTrackingMode: Binding<MapUserTrackingMode>? = nil) where Content == _DefaultMapContent

    /// Creates an instance showing a specific region and optionally configuring
    /// available interactions, user location and tracking behavior.
    ///
    /// - Parameters:
    /// - coordinateRegion: The coordinate region to display.
    /// - interactions: The types of user interactions that should be enabled.
    /// - showsUserLocation: Whether to display the user's location in this Map
    ///   or not. Only takes effect if the user has authorized the app to access
    ///   their location.
    /// - userTrackingMode: How the map should respond to user location updates
    public init(coordinateRegion: Binding<MKCoordinateRegion>, interactionModes: MapInteractionModes = .all, showsUserLocation: Bool = false, userTrackingMode: Binding<MapUserTrackingMode>? = nil) where Content == _DefaultMapContent

    /// The content and behavior of the view.
    public var body: some View { get }

    /// The type of view representing the body of this view.
    ///
    /// When you create a custom view, Swift infers this type from your
    /// implementation of the required `body` property.
    public typealias Body = some View
}

// Available when SwiftUI is imported with MapKit
@available(iOS 14.0, tvOS 14.0, macOS 11.0, watchOS 7.0, *)
public struct MapAnnotation<Content> : MapAnnotationProtocol where Content : View {

    public init(coordinate: CLLocationCoordinate2D, anchorPoint: CGPoint = CGPoint(x: 0.5, y: 0.5), @ViewBuilder content: () -> Content)
}

// Available when SwiftUI is imported with MapKit
@available(iOS 14.0, tvOS 14.0, macOS 11.0, watchOS 7.0, *)
public protocol MapAnnotationProtocol {
}

// Available when SwiftUI is imported with MapKit
@available(iOS 14.0, tvOS 14.0, macOS 11.0, watchOS 7.0, *)
public struct MapInteractionModes : OptionSet {

    /// The corresponding value of the raw type.
    ///
    /// A new instance initialized with `rawValue` will be equivalent to this
    /// instance. For example:
    ///
    ///     enum PaperSize: String {
    ///         case A4, A5, Letter, Legal
    ///     }
    ///
    ///     let selectedSize = PaperSize.Letter
    ///     print(selectedSize.rawValue)
    ///     // Prints "Letter"
    ///
    ///     print(selectedSize == PaperSize(rawValue: selectedSize.rawValue)!)
    ///     // Prints "true"
    public let rawValue: Int

    /// Creates a new option set from the given raw value.
    ///
    /// This initializer always succeeds, even if the value passed as `rawValue`
    /// exceeds the static properties declared as part of the option set. This
    /// example creates an instance of `ShippingOptions` with a raw value beyond
    /// the highest element, with a bit mask that effectively contains all the
    /// declared static members.
    ///
    ///     let extraOptions = ShippingOptions(rawValue: 255)
    ///     print(extraOptions.isStrictSuperset(of: .all))
    ///     // Prints "true"
    ///
    /// - Parameter rawValue: The raw value of the option set to create. Each bit
    ///   of `rawValue` potentially represents an element of the option set,
    ///   though raw values may include bits that are not defined as distinct
    ///   values of the `OptionSet` type.
    public init(rawValue: Int)

    public static let pan: MapInteractionModes

    public static let zoom: MapInteractionModes

    public static let all: MapInteractionModes

    /// The element type of the option set.
    ///
    /// To inherit all the default implementations from the `OptionSet` protocol,
    /// the `Element` type must be `Self`, the default.
    public typealias Element = MapInteractionModes

    /// The type of the elements of an array literal.
    public typealias ArrayLiteralElement = MapInteractionModes

    /// The raw type that can be used to represent all values of the conforming
    /// type.
    ///
    /// Every distinct value of the conforming type has a corresponding unique
    /// value of the `RawValue` type, but there may be values of the `RawValue`
    /// type that don't have a corresponding value of the conforming type.
    public typealias RawValue = Int
}

// Available when SwiftUI is imported with MapKit
@available(iOS 14.0, tvOS 14.0, macOS 11.0, watchOS 7.0, *)
public struct MapMarker : MapAnnotationProtocol {

    public init(coordinate: CLLocationCoordinate2D, tint: Color? = nil)
}

// Available when SwiftUI is imported with MapKit
@available(iOS 14.0, tvOS 14.0, macOS 11.0, watchOS 7.0, *)
public struct MapPin : MapAnnotationProtocol {

    public init(coordinate: CLLocationCoordinate2D, tint: Color? = nil)
}

// Available when SwiftUI is imported with MapKit
@available(iOS 14.0, tvOS 14.0, macOS 11.0, watchOS 7.0, *)
public enum MapUserTrackingMode {

    case none

    case follow

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (a: MapUserTrackingMode, b: MapUserTrackingMode) -> Bool

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    ///
    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
    public var hashValue: Int { get }

    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher)
}

// Available when SwiftUI is imported with MapKit
@available(iOS 14.0, tvOS 14.0, macOS 11.0, watchOS 7.0, *)
extension MapUserTrackingMode : Equatable {
}

// Available when SwiftUI is imported with MapKit
@available(iOS 14.0, tvOS 14.0, macOS 11.0, watchOS 7.0, *)
extension MapUserTrackingMode : Hashable {
}
