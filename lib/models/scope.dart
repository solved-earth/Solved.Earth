import 'dart:async';
import 'dart:math';

enum ExitScope {
  @Bit(0x0001 | 1) // in_action
  ossDetail,

  @Bit(0x0002 | 2) // in_action
  ossLicense,

  @Bit(0x0004 | 4) // in_action
  openedPageRouteBuilder,

  @Bit(0x0008 | 8)
  @Bit(0x0010 | 16)
  @Bit(0x0020 | 32)
  undefined;

  int get bit => pow(2, index).toInt();
  bool get contain => scope | bit == scope;

  static int _ = 0;
  static int get scope => _;
  static List<ExitScope> get scopes {
    return [if (_ != 0) ...values.where((e) => e.contain)];
  }

  static bool get exitable => _ == 0;

  static set add(ExitScope s) => _ |= s.bit;
  static set remove(ExitScope s) => _ &= ~s.bit;
  static set toggle(ExitScope s) => _ ^= s.bit;

  static final _controller = StreamController<ExitScope>.broadcast(sync: true);
  static Stream<ExitScope> get stream => _controller.stream;

  void pop() async => _controller.add(this);
}

// marking purpose
class Bit {
  const Bit(this.bit);
  final int bit;
}
