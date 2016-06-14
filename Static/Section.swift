import UIKit

/// Representation of a table section.
public struct Section: Hashable, Equatable {

    // MARK: - Types

    /// Representation of a section header or footer.
    public enum Extremity {
        /// System defined style for the title of the header or footer.
        case title(String)

        /// Custom view for the header or footer. The height will be the view's `bounds.height`.
        case view(UIView)

        public var title: String? {
            switch self {
            case .title(let extremityTitle): return extremityTitle
            default: return nil
            }
        }

        public var view: UIView? {
            switch self {
            case .view(let extremityView): return extremityView
            default: return nil
            }
        }

        public var viewHeight: CGFloat? {
            return view?.bounds.height
        }
    }


    // MARK: - Properties

    /// Unique identifier used to identify the section.
    public let uuid: String

    /// Title or view for the header of the section.
    public var header: Extremity?

    /// Array of rows for the section.
    public var rows: [Row]

    /// Title or view for the header of the section.
    public var footer: Extremity?

    /// Section index title
    public var indexTitle: String?

    public var hashValue: Int {
        return uuid.hashValue
    }


    // MARK: - Initiailizers

    public init(header: Extremity? = nil, rows: [Row] = [], footer: Extremity? = nil, indexTitle: String? = nil, uuid: String = UUID().uuidString) {
        self.uuid = uuid
        self.header = header
        self.rows = rows
        self.footer = footer
        self.indexTitle = indexTitle
    }
}


extension Section.Extremity: StringLiteralConvertible {
    public typealias UnicodeScalarLiteralType = StringLiteralType
    public typealias ExtendedGraphemeClusterLiteralType = StringLiteralType

    public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self = .title(value)
    }

    public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self = .title(value)
    }

    public init(stringLiteral value: StringLiteralType) {
        self = .title(value)
    }
}


public func ==(lhs: Section, rhs: Section) -> Bool {
    return lhs.uuid == rhs.uuid
}
