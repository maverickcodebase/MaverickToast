//
//  ToastManager.swift
//  NotificationBannerToastMessages
//
//  Created by Sheraz Ahmed on 13/09/2025.
//

import SwiftUI

// MARK: - Toast Manager
class ToastManager: ObservableObject {
    static let shared = ToastManager()
    
    @Published var toasts: [ToastMessage] = []
    
    private init() {
        // Timer removed - toasts auto-dismiss through UI animations
    }
    
    // MARK: - Public Methods
    
    @MainActor
    func display(_ toast: ToastMessage) {
        withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
            toasts.append(toast)
        }
    }
    
    // MARK: - Convenience Methods
    
    @MainActor
    private func createAndDisplay(type: ToastType, title: String, message: String? = nil, duration: Double = 3.0, position: ToastPosition = .top) {
        let toast = ToastMessage(
            title: title,
            message: message,
            type: type,
            duration: duration,
            position: position
        )
        display(toast)
    }
    
    @MainActor
    func showSuccess(title: String, message: String? = nil, duration: Double = 3.0, position: ToastPosition = .top) {
        createAndDisplay(type: .success, title: title, message: message, duration: duration, position: position)
    }
    
    @MainActor
    func showError(title: String, message: String? = nil, duration: Double = 3.0, position: ToastPosition = .top) {
        createAndDisplay(type: .error, title: title, message: message, duration: duration, position: position)
    }
    
    @MainActor
    func showWarning(title: String, message: String? = nil, duration: Double = 3.0, position: ToastPosition = .top) {
        createAndDisplay(type: .warning, title: title, message: message, duration: duration, position: position)
    }
    
    @MainActor
    func showInfo(title: String, message: String? = nil, duration: Double = 3.0, position: ToastPosition = .top) {
        createAndDisplay(type: .info, title: title, message: message, duration: duration, position: position)
    }
    
    @MainActor
    func dismissToast(_ toast: ToastMessage) {
        withAnimation(.easeInOut(duration: 0.3)) {
            toasts.removeAll { $0.id == toast.id }
        }
    }
    
    @MainActor
    func dismissAllToasts() {
        withAnimation(.easeInOut(duration: 0.3)) {
            toasts.removeAll()
        }
    }
    
}

// MARK: - Toast View Modifier
struct ToastModifier: ViewModifier {
    @StateObject private var toastManager = ToastManager.shared
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .top) {
                ToastContainer(
                    toasts: toastManager.toasts,
                    onDismiss: { toast in
                        toastManager.dismissToast(toast)
                    }
                )
            }
    }
}

// MARK: - View Extension for Toast
extension View {
    /// Adds toast functionality to the entire app
    /// Call this once in your main app or root view
    func maverickToast() -> some View {
        self.modifier(ToastModifier())
    }
}

