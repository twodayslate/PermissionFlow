#if os(macOS)
import Carbon
import Foundation

@available(macOS 13.0, *)
public struct InputMonitoringPermissionStatusProvider: PermissionStatusProviding {
    public var capability: PermissionStatusCapability { .preflightSupported }
    
    public func authorizationState() -> PermissionAuthorizationState {
        // Use CGPreflightListenEventAccess() for reliable Input Monitoring permission check
        // This is the most accurate method for checking input monitoring permissions
        let isGranted = CGPreflightListenEventAccess()
        return isGranted ? .granted : .notGranted
    }
    
    public init() {}
}
#endif