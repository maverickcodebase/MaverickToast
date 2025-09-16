import SwiftUI

struct MaverickToastView: View {
    @StateObject private var viewModel = DemoViewModel()
    
    var body: some View {
        VStack(spacing: 30) {
            // Title
            Text("Maverick Toast")
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
            // Type Selection
            VStack(alignment: .leading, spacing: 12) {
                Text("Type")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        // Success
                        HStack {
                            Image(systemName: viewModel.selectedType == .success ? "largecircle.fill.circle" : "circle")
                                .foregroundColor(viewModel.selectedType == .success ? Color.main : Color(.placeholderText))
                            
                            Text("Success")
                                .foregroundColor(.primary)
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            viewModel.selectedType = .success
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        
                        // Error
                        HStack {
                            Image(systemName: viewModel.selectedType == .error ? "largecircle.fill.circle" : "circle")
                                .foregroundColor(viewModel.selectedType == .error ? Color.main : Color(.placeholderText))
                            
                            Text("Error")
                                .foregroundColor(.primary)
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            viewModel.selectedType = .error
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                    }
                    
                    Divider()
                    
                    HStack(spacing: 0) {
                        // Info
                        HStack {
                            Image(systemName: viewModel.selectedType == .info ? "largecircle.fill.circle" : "circle")
                                .foregroundColor(viewModel.selectedType == .info ? Color.main : Color(.placeholderText))
                            
                            Text("Info")
                                .foregroundColor(.primary)
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            viewModel.selectedType = .info
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        
                        // Warning
                        HStack {
                            Image(systemName: viewModel.selectedType == .warning ? "largecircle.fill.circle" : "circle")
                                .foregroundColor(viewModel.selectedType == .warning ? Color.main : Color(.placeholderText))
                            
                            Text("Warning")
                                .foregroundColor(.primary)
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            viewModel.selectedType = .warning
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                    }
                }
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                )
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // Position Selection
            VStack(alignment: .leading, spacing: 12) {
                Text("Position")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: 0) {
                    // Top
                    HStack {
                        Image(systemName: viewModel.selectedPosition == .top ? "largecircle.fill.circle" : "circle")
                            .foregroundColor(viewModel.selectedPosition == .top ? Color.main : Color(.placeholderText))
                        
                        Text("Top")
                            .foregroundColor(.primary)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        viewModel.selectedPosition = .top
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    
                    // Bottom
                    HStack {
                        Image(systemName: viewModel.selectedPosition == .bottom ? "largecircle.fill.circle" : "circle")
                            .foregroundColor(viewModel.selectedPosition == .bottom ? Color.main : Color(.placeholderText))
                        
                        Text("Bottom")
                            .foregroundColor(.primary)
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        viewModel.selectedPosition = .bottom
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                }
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                )
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // Show Toast Button
            Button(action: {
                viewModel.showToast()
            }) {
                Text("Show Toast")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.main)
                    .cornerRadius(8)
            }
            .buttonStyle(PlainButtonStyle())
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 60)
    }
}

#Preview {
    MaverickToastView()
}
