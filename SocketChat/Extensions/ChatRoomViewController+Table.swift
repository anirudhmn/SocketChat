//
//  ChatRoomViewController+Table.swift
//  SocketChat
//
//  Created by Anirudh Natarajan on 2/25/18.
//  Copyright © 2018 Anirudh Natarajan. All rights reserved.
//

import UIKit

extension ChatRoomViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = MessageTableViewCell(style: .default, reuseIdentifier: "MessageCell")
    cell.selectionStyle = .none
    
    let message = messages[indexPath.row]
    cell.apply(message: message)
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return messages.count
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let height = MessageTableViewCell.height(for: messages[indexPath.row])
    return height
  }
  func insertNewMessageCell(_ message: Message) {
    messages.append(message)
    let indexPath = IndexPath(row: messages.count - 1, section: 0)
    tableView.beginUpdates()
    tableView.insertRows(at: [indexPath], with: .bottom)
    tableView.endUpdates()
    tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
  }
}
