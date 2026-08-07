import 'package:control/control.dart';
import 'package:l/l.dart';

class DefaultControllerObserver implements IControllerObserver {
  const DefaultControllerObserver({required L logger}) : l = logger;

  final L l;

  @override
  void onCreate(Controller controller) {
    l.v('${controller.name}: created');
  }

  @override
  void onDispose(Controller controller) {
    l.v('${controller.name}: disposed');
  }

  @override
  void onError(Controller controller, Object error, StackTrace stackTrace) {
    l.e('${controller.name}: $error', stackTrace);
  }

  @override
  void onHandler(HandlerContext context) {
    l.d('${context.controller.name}: handle "${context.name}"');
  }

  @override
  void onStateChanged<S extends Object>(StateController<S> controller, S prevState, S nextState) {
    l.d('${controller.name}: $prevState -> $nextState');
  }
}
