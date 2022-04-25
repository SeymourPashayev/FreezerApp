//
//  ArrayMobilization.swift
//
//

import Foundation

// Struct to represent an indexed element
@dynamicMemberLookup
struct Indexed<Element, Index>{
    var index: Index
    var offset: Int
    var element: Element

    // Access to canstart members
    subscript<T>(dynamicMember keyPath: KeyPath<Element, T>) -> T {
        element[keyPath: keyPath]
    }
    
    // Access to mutable members
    subscript<T>(dynamicMember keyPath: WritableKeyPath<Element, T>) -> T {
        get { element[keyPath: keyPath] }
        set { element[keyPath: keyPath] = newValue }
    }
}

// Extension to make both Indexed and Element conform to identifiable
// plus Indexed takes the value of Element id
extension Indexed: Identifiable where Element: Identifiable {
    var id: Element.ID { element.id }
}

// Not so sure what that does
extension RandomAccessCollection {
    func indexed() -> AnyRandomAccessCollection<Indexed<Element, Index>> {
        AnyRandomAccessCollection(
            zip(zip(indices, 0...).lazy, self).lazy
                .map{ Indexed(index: $0.0.0, offset: $0.0.1, element: $0.1) }
        )
    }
}
