import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';

class PaginatedGridView extends StatefulWidget {
  final SliverGridDelegate gridDelegate;
  final EdgeInsets padding;
  final int itemCount;
  final bool hasMoreData;
  final Future<void> Function() onGetMoreData;
  final ScrollPhysics physics;
  final bool shrinkWrap;
  final Widget loadingWidget;
  final Widget onEmpty;

  final Widget Function(BuildContext context, int index) itemBuilder;
  PaginatedGridView({
    Key key,
    @required this.gridDelegate,
    @required this.onGetMoreData,
    @required this.itemCount,
    @required this.itemBuilder,
    this.onEmpty,
    this.hasMoreData = false,
    this.shrinkWrap = false,
    this.loadingWidget = const CircularProgressIndicator(),
    this.padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
    this.physics = const ClampingScrollPhysics(),
  }) : super(key: key);
  @override
  _PaginatedGridViewState createState() => _PaginatedGridViewState();
}

class _PaginatedGridViewState extends State<PaginatedGridView> {
  ScrollController scrollController;
  final ValueNotifier isLoading = ValueNotifier<bool>(false);
  void scrollListener() {
    //print(scrollController.position.maxScrollExtent);
    if (scrollController.offset >= scrollController.position.maxScrollExtent) {
      if (widget.hasMoreData) {
        onLoadingMoreData();
      }
    }
  }

  void onLoadingMoreData() async {
    if (isLoading.value) return;
    isLoading.value = true;
    await widget.onGetMoreData();
    isLoading.value = false;
  }

  @override
  void initState() {
    scrollController = ScrollController()..addListener(scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    isLoading.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.onEmpty != null && widget.itemCount == 0) {
      return widget.onEmpty;
    }
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: widget.gridDelegate,
            padding: widget.padding,
            controller: scrollController,
            physics: widget.physics,
            itemCount: widget.itemCount,
            itemBuilder: widget.itemBuilder,
          ),
        ),
        ValueObserver<bool>(
          valueNotifier: isLoading,
          child: (isFetchingData) {
            return ConditionalWidget(
              condition: isFetchingData,
              onTrue: widget.hasMoreData
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: widget.loadingWidget),
                    )
                  : const SizedBox(),
              onFalse: const SizedBox(),
            );
          },
        ),
      ],
    );
  }
}
