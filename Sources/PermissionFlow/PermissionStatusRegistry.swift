#if os(macOS)
import ApplicationServices
import Foundation

@available(macOS 13.0, *)
public protocol PermissionStatusProviding: Sendable {
    /// Describes whether this provider can reliably check permission status.
    var capability: PermissionStatusCapability { get }
    
    /// Returns the current authorization state for this permission.
    func authorizationState() -> PermissionAuthorizationState
}

@available(macOS 13.0, *)
public enum PermissionStatusRegistry {
    /// Returns the appropriate status provider for the given permission pane.
    public static func provider(for pane: PermissionFlowPane) -> any PermissionStatusProviding {
        switch pane {
        case .accessibility:
            AccessibilityPermissionStatusProvider()
        case .bluetooth:
            BluetoothPermissionStatusProvider()
        case .mediaAppleMusic:
            MediaAppleMusicPermissionStatusProvider()
        case .inputMonitoring:
            InputMonitoringPermissionStatusProvider()
        case .screenRecording:
            ScreenRecordingPermissionStatusProvider()
        case .fullDiskAccess:
            FullDiskAccessPermissionStatusProvider()
        case .appManagement,
             .developerTools:
            UnsupportedPermissionStatusProvider()
        }
    }
}
#endif
