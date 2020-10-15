import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jin_widget_helper/jin_widget_helper.dart';
import 'package:rxdart/rxdart.dart';

class PaginatedWidgetExample extends StatefulWidget {
  PaginatedWidgetExample({Key key}) : super(key: key);
  @override
  _PaginatedWidgetExampleState createState() => _PaginatedWidgetExampleState();
}

class _PaginatedWidgetExampleState extends State<PaginatedWidgetExample> {
  ResourceModel resourceModel;
  BehaviorSubject<List<ResourceData>> resourceController = BehaviorSubject();
  int currentPage = 1;

  bool usingGrid = true;

  Future<void> fetchAllResources() async {
    try {
      await Future.delayed(Duration(seconds: 2));
      final response =
          await Dio().get("https://reqres.in/api/unknown?page=$currentPage");
      resourceModel = ResourceModel.fromJson(response.data);
      print(resourceModel.page);
      List<ResourceData> data = [];
      if (resourceController.hasValue) {
        data = [...resourceController.value, ...resourceModel.data];
      } else {
        data = resourceModel.data;
      }
      currentPage++;
      resourceController.add(data);
    } catch (exception) {} finally {}
  }

  @override
  void initState() {
    fetchAllResources();
    super.initState();
  }

  @override
  void dispose() {
    resourceController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Paginated Widget Example"),
      ),
      body: Container(
        child: StreamHandler<List<ResourceData>>(
          stream: resourceController.stream,
          ready: (data) {
            if (usingGrid) {
              return PaginatedGridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: data.length,
                hasMoreData: currentPage <= resourceModel?.totalPages ?? 10,
                onGetMoreData: fetchAllResources,
                itemBuilder: (context, index) {
                  return Card(
                    child: Center(child: Text(data[index].name)),
                  );
                },
              );
            }
            return PaginatedListView(
              itemCount: data.length,
              hasMoreData: currentPage <= resourceModel?.totalPages ?? 10,
              onGetMoreData: fetchAllResources,
              itemBuilder: (context, index) {
                return Container(
                  height: 300,
                  child: Card(
                    child: Center(child: Text(data[index].name)),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class ResourceModel {
  ResourceModel({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
  });

  int page;
  int perPage;
  int total;
  int totalPages;
  List<ResourceData> data;

  factory ResourceModel.fromJson(Map<String, dynamic> json) => ResourceModel(
        page: json["page"] == null ? null : json["page"],
        perPage: json["per_page"] == null ? null : json["per_page"],
        total: json["total"] == null ? null : json["total"],
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
        data: json["data"] == null
            ? null
            : List<ResourceData>.from(
                json["data"].map((x) => ResourceData.fromJson(x))),
      );
}

class ResourceData {
  ResourceData({
    this.id,
    this.name,
    this.year,
    this.color,
    this.pantoneValue,
  });

  int id;
  String name;
  int year;
  String color;
  String pantoneValue;

  factory ResourceData.fromJson(Map<String, dynamic> json) => ResourceData(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        year: json["year"] == null ? null : json["year"],
        color: json["color"] == null ? null : json["color"],
        pantoneValue:
            json["pantone_value"] == null ? null : json["pantone_value"],
      );
}
