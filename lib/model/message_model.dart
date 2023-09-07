class Message {
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String message;
  final DateTime timestamp;

  Message(
      {required this.senderId,
      required this.senderEmail,
      required this.receiverId,
      required this.message,
      required this.timestamp});

  Message.fromJson(Map<String, dynamic> json)
      : senderId = json['senderId'],
        senderEmail = json['senderId'],
        receiverId = json['senderId'],
        message = json['senderId'],
        timestamp = json['senderId'];

  messageToJson() {
    return {
      'senderId': senderId,
      'senderEmail': senderEmail,
      'receiverId': receiverId,
      'message': message,
      'timestamp': timestamp
    };
  }
}
