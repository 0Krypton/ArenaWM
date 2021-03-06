//importing packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

final btnIndexProvider = StateNotifierProvider((_) => BtnIndexNotifier());

class BtnIndexNotifier extends StateNotifier<int> {
  BtnIndexNotifier() : super(3);

  void setIndex(int index) {
    state = index;
  }
}
