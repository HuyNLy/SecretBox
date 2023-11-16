//
//  DetailMsg.swift
//  SecretBox
//
//  Created by Huy Ly on 11/13/23.
//

import UIKit


class DetailMsg: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    
    

}
/*
 import UIKit
 import MessageKit
 import FirebaseFirestore
 import FirebaseAuth

 struct Sender: SenderType {
     var senderId: String
     var displayName: String
 }

 struct Message: MessageType {
     var sender: SenderType
     var messageId: String
     var sentDate: Date
     var kind: MessageKind
 }

 class DetailMsg: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {

     var messages: [MessageType] = []
     let db = Firestore.firestore()

     override func viewDidLoad() {
         super.viewDidLoad()

         messagesCollectionView.messagesDataSource = self
         messagesCollectionView.messagesLayoutDelegate = self
         messagesCollectionView.messagesDisplayDelegate = self

         loadMessages()
     }

     func currentSender() -> SenderType {
         return Sender(senderId: Auth.auth().currentUser?.uid ?? "", displayName: "User")
     }

     func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
         return messages[indexPath.section]
     }

     func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
         return messages.count
     }

     func sendMessage(text: String) {
         if let senderId = Auth.auth().currentUser?.uid {
             let newMessage = db.collection("messages").document()
             newMessage.setData([
                 "senderId": senderId,
                 "text": text,
                 "sentDate": Date()
             ])
         }
     }

     func loadMessages() {
         db.collection("messages").order(by: "sentDate").addSnapshotListener { (querySnapshot, error) in
             self.messages = []
             if let e = error {
                 print("There was an issue retrieving data from Firestore. \(e)")
             } else {
                 if let snapshotDocuments = querySnapshot?.documents {
                     for doc in snapshotDocuments {
                         let data = doc.data()
                         if let senderId = data["senderId"] as? String, let text = data["text"] as? String, let sentDate = data["sentDate"] as? Date {
                             let newMessage = Message(sender: Sender(senderId: senderId, displayName: ""), messageId: doc.documentID, sentDate: sentDate, kind: .text(text))
                             self.messages.append(newMessage)
                             DispatchQueue.main.async {
                                 self.messagesCollectionView.reloadData()
                             }
                         }
                     }
                 }
             }
         }
     }
 }

 */
