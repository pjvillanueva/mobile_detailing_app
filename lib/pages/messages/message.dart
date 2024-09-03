class Message {
  Message({
    required this.id,
    required this.sender,
    required this.receiver,
    required this.message,
    required this.date,
  });
  final String id;
  final String sender;
  final String receiver;
  final String message;
  final DateTime date;

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      sender: json['sender'],
      receiver: json['receiver'],
      message: json['message'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'sender': sender,
        'receiver': receiver,
        'message': message,
        'date': date.toIso8601String()
      };
}
