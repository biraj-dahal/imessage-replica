//
//  ChatView.swift
//  iMessage replica
//
//  Created by Biraj Dahal on 3/14/25.
//

import SwiftUI

struct MessageRow: View {
    let text: String
    let isOutgoing: Bool

    var body: some View {
        HStack {
            if isOutgoing {
                Spacer()
            }
            messageBubble
            if !isOutgoing {
                Spacer()
        }
    }

    private var messageBubble: some View {
        Text(text)
            .fixedSize(horizontal: false, vertical: true)
            .foregroundStyle(isOutgoing ? .white : .primary)
            .padding(.vertical, 10)
            .padding(.horizontal, 12)
            .background(
                RoundedRectangle(cornerRadius: 20.0)
                    .fill(isOutgoing ? Color.blue.gradient : Color(.systemGray5).gradient)
            )
            .padding(isOutgoing ? .trailing : .leading, 12)
            .containerRelativeFrame(.horizontal, count: 7, span: 5, spacing: 0, alignment: isOutgoing ? .trailing : .leading)
}

struct ChatView: View {
    @State var messageManager: MessageManager

    init(isMocked: Bool = false) {
        messageManager = MessageManager(isMocked: isMocked)
    }

    @Environment(AuthManager.self) var authManager
    
    var body: some View {
        NavigationStack {
            ScrollView {
                    VStack {
                        ForEach(messageManager.messages) { message in
                            MessageRow(text: message.text, isOutgoing: authManager.userEmail == message.username)
                        }
                    }
                }
            .defaultScrollAnchor(.bottom)
            Text("Welcome to FireChat!")
                .navigationTitle("Chat")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem {
                        Button("Sign out") {
                            authManager.signOut()
                        }
                    }
                }
        }
    }
}

#Preview {
    ChatView(isMocked: true) 
            .environment(AuthManager(isMocked: true))
}
