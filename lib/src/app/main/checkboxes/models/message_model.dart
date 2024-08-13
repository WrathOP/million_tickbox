class MessageModel {
  final String key;
  final int offset;
  final bool bitValue;

  MessageModel({
    required this.key,
    required this.offset,
    required this.bitValue,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      key: json['key'],
      offset: json['offset'],
      bitValue: json['bitValue'] == 1,
    );
  }

  @override
  String toString() {
    return 'key: $key, offset: $offset, bitValue: $bitValue';
  }

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'offset': offset,
      'bitValue': bitValue ? 1 : 0,
    };
  }
}
