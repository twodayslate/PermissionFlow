#if os(macOS)
import AVFoundation
import Foundation

@available(macOS 13.0, *)
public struct ScreenRecordingPermissionStatusProvider: PermissionStatusProviding {
    public var capability: PermissionStatusCapability { .preflightSupported }
    
    public func authorizationState() -> PermissionAuthorizationState {
        // Use CGPreflightScreenCaptureAccess() for reliable Screen Recording permission check
        // This is the most accurate method for checking screen recording permissions
        let isGranted = CGPreflightScreenCaptureAccess()
        return isGranted ? .granted : .notGranted
    }
    
    public init() {}
}
#endif