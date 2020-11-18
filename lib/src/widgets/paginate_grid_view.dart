import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';

class PaginatedGridView extends StatefulWidget {
  ///Simple Grid deledate
  final SliverGridDelegate gridDelegate;
  final EdgeInsets padding;
  final int itemCount;
  final bool hasMoreData;
  final Future<void> Function() onGetMoreData;

  ///If [PaginatedListView] is user inside another scroll view,
  ///you must provide a [scrollController] that also use in your parent [scrollController] scroll view
  final ScrollController scrollController;

  ///Scroll physic of grid view
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
    this.loadingWidget,
    this.padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
    this.physics = const ClampingScrollPhysics(),
    this.scrollController,
  }) : super(key: key);
  @override
  _PaginatedGridViewState createState() => _PaginatedGridViewState();
}

class _PaginatedGridViewState extends State<PaginatedGridView> {
  ScrollController scrollController;
  bool isFetching = false;

  bool get _isPrimaryScrollView => widget.scrollController == null;

  void scrollListener(ScrollController controller) {
    if (controller.offset >= controller.position.maxScrollExtent) {
      if (widget.hasMoreData) onLoadingMoreData();
    }
  }

  void onLoadingMoreData() async {
    if (isFetching) return;
    isFetching = true;
    await widget.onGetMoreData();
    isFetching = false;
  }

  void initController() {
    if (widget.scrollController != null) {
      widget.scrollController
          .addListener(() => scrollListener(widget.scrollController));
    } else {
      scrollController = ScrollController();
      scrollController.addListener(() => scrollListener(scrollController));
    }
  }

  @override
  void initState() {
    initController();
    super.initState();
  }

  @override
  void dispose() {
    if (scrollController != null) {
      scrollController.dispose();
    }
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
          flex: _isPrimaryScrollView ? 1 : 0,
          child: GridView.builder(
            gridDelegate: widget.gridDelegate,
            shrinkWrap: widget.shrinkWrap,
            padding: widget.padding,
            controller: _isPrimaryScrollView ? scrollController : null,
            physics: widget.physics,
            itemCount: widget.itemCount,
            itemBuilder: widget.itemBuilder,
          ),
        ),
        if (widget.hasMoreData)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: widget.loadingWidget ?? JinWidget.platformLoadingWidget(),
            ),
          )
      ],
    );
  }
}
