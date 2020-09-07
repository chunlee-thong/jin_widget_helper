import 'package:flutter/material.dart';

class PaginatedListView extends StatefulWidget {
  final int itemCount;
  final ScrollPhysics physics;
  final Axis scrollDirection;
  final bool shrinkWrap;
  final Widget Function(BuildContext, int) itemBuilder;
  final EdgeInsets padding;

  ///callback for getting more data when ScrollController reach mex scrolExtends
  final Function onGetMoreData;

  ///condition to check if we still have more data to fetch
  ///Example: currentItems == totalItems or currentPage == totalPages
  final bool hasMoreData;

  ///widget to show when we're fetching more data
  final Widget loadingWidget;
  const PaginatedListView({
    Key key,
    @required this.itemCount,
    @required this.itemBuilder,
    @required this.onGetMoreData,
    this.physics = const ClampingScrollPhysics(),
    this.shrinkWrap = false,
    this.hasMoreData = true,
    this.loadingWidget = const CircularProgressIndicator(),
    this.padding,
    this.scrollDirection = Axis.vertical,
  }) : super(key: key);
  @override
  _PaginatedListViewState createState() => _PaginatedListViewState();
}

class _PaginatedListViewState extends State<PaginatedListView> {
  ScrollController scrollController;

  void scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent) {
      if (widget.hasMoreData) {
        widget.onGetMoreData();
      }
    }
  }

  @override
  void initState() {
    scrollController = ScrollController()..addListener(scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.itemCount + 1,
      controller: scrollController,
      padding:
          widget.padding ?? EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      scrollDirection: widget.scrollDirection,
      physics: widget.physics,
      shrinkWrap: widget.shrinkWrap,
      itemBuilder: (context, index) {
        //check if we reach the end of the list
        if (index == widget.itemCount) {
          //check if we have more data to fetch
          return widget.hasMoreData
              ? Center(child: widget.loadingWidget)
              : const SizedBox();
        }
        return widget.itemBuilder(context, index);
      },
    );
  }
}
