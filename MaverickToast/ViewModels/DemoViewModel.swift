import SwiftUI

@MainActor
class DemoViewModel: ObservableObject {
    @Published var selectedType: ToastType = .success
    @Published var selectedPosition: ToastPosition = .top
    
    func showToast() {
        let toastData = getToastData(for: selectedType)
        
        switch selectedType {
        case .success:
            ToastManager.shared.showSuccess(
                title: toastData.title,
                message: toastData.message,
                duration: 3.0,
                position: selectedPosition
            )
        case .error:
            ToastManager.shared.showError(
                title: toastData.title,
                message: toastData.message,
                duration: 3.0,
                position: selectedPosition
            )
        case .warning:
            ToastManager.shared.showWarning(
                title: toastData.title,
                message: toastData.message,
                duration: 3.0,
                position: selectedPosition
            )
        case .info:
            ToastManager.shared.showInfo(
                title: toastData.title,
                message: toastData.message,
                duration: 3.0,
                position: selectedPosition
            )
        }
    }
    
    private func getToastData(for type: ToastType) -> (title: String, message: String) {
        switch type {
        case .success:
            return ("Success!", "Operation completed successfully")
        case .error:
            return ("Error!", "Something went wrong")
        case .warning:
            return ("Warning!", "Please check your input")
        case .info:
            return ("Info", "Here's some information")
        }
    }
}
