import 'package:flutter/material.dart';

class InheritedProvider<T> extends InheritedWidget {
  final T data;

  const InheritedProvider({required this.data, required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(InheritedProvider<T> oldWidget) {
    //在此简单返回true，则每次更新都会调用依赖其的子孙节点的 didChangeDependencies
    return true;
  }
}

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  final Widget child;
  final T data; //共享的数据模型，要求继承ChangeNotifier

  const ChangeNotifierProvider({
    required this.child,
    required this.data,
  });

  /// 提供方法，子树获取共享数据
  /// 相当于依赖注入，说明要依赖于父亲
  static T of<T>(BuildContext context, {bool listen = true}) {
    final provider = listen
        ? context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>()
        : context
        .getElementForInheritedWidgetOfExactType<InheritedProvider<T>>()
        ?.widget as InheritedProvider<T>;
    return provider!.data;
  }

  @override
  _ChangeNotifierProviderState createState() =>
      _ChangeNotifierProviderState<T>();
}

class _ChangeNotifierProviderState<T extends ChangeNotifier>
    extends State<ChangeNotifierProvider<T>> {
  /// 如果数据发生变化（model类调用 notifyListeners）,重新构建InheritedProvider
  void update() {
    setState(() => {});
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    /// 当Provider更新时，如果新旧数据不"=="，则解绑旧数据监听，同时添加新数据监听
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }
}

/// 响应数据变化的消费者
class Consumer<T> extends StatelessWidget {

  final Widget Function(BuildContext context, T value) builder;

  const Consumer({required this.builder});

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      ChangeNotifierProvider.of<T>(context),
    );
  }
}

