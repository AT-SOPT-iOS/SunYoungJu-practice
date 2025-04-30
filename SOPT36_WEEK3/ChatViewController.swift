//
//  ChatViewController.swift
//  SOPT36_WEEK3
//
//  Created by 선영주 on 4/26/25.
//

import UIKit

import SnapKit

final class ChatViewController: UIViewController {
    
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    private let chatList = ChatModel.dummy()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        setDelegate()
        setLayout()
    }
    
    private func setLayout() {
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    private func register() {
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: ChatTableViewCell.identifier)
    }
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
}

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}

extension ChatViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return chatList.count
      // 세미나 코드는 몇개인지 숫자를 적었던데, TestModel 추가하면서 수정해봤습니당
  }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTableViewCell.identifier, for: indexPath) as? ChatTableViewCell else { return UITableViewCell() }
        cell.dataBind(chatList[indexPath.row])
        return cell
    }
}
