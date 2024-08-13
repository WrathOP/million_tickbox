import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:million_tickbox/src/app/main/checkboxes/models/message_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketNotifier extends StateNotifier<List<bool>> {
  final WebSocketChannel channel;

  WebSocketNotifier(this.channel) : super(List.filled(1000000, false)) {
    _listenToStream();
  }

  void _listenToStream() {
    channel.stream.listen((data) {
      if (data is String) {
        final message = json.decode(data);
        final messageModel = MessageModel.fromJson(message);
        print('Message received: $messageModel');

        // Create a new state list and update the specific bit
        final newState = List<bool>.from(state);
        newState[messageModel.offset] = messageModel.bitValue;

        // Update the state to trigger UI updates
        state = newState;
        return;
      }

      final buffer = data as Uint8List;
      final bitList = buffer.expand((byte) {
        return List.generate(
            8, (bitIndex) => (byte >> (7 - bitIndex)) & 1 == 1);
      }).toList();

      state = bitList;
    }, onError: (error) {
      print('WebSocket error: $error');
    });
  }

  void flipBit(int index, bool value) {
    // state = [
    //   for (int i = 0; i < state.length; i++)
    //     if (i == index) !state[i] else state[i],
    // ];
    channel.sink.add(json.encode(
        MessageModel(key: "million-checkbox", offset: index, bitValue: value)
            .toMap()));
  }
}

// Provider for the WebSocketNotifier
final webSocketNotifierProvider =
    StateNotifierProvider<WebSocketNotifier, List<bool>>((ref) {
  final channel = WebSocketChannel.connect(
    Uri.parse('ws://localhost:3001/ws'),
  );
  return WebSocketNotifier(channel);
});

final checkboxStateProvider = StateProvider.family<bool, int>((ref, index) {
  final state = ref.watch(webSocketNotifierProvider);
  return state[index];
});
