// To parse this JSON data, do
//
//     final adminDashboardModel = adminDashboardModelFromJson(jsonString);

import 'dart:convert';

AdminDashboardModel adminDashboardModelFromJson(String str) =>
    AdminDashboardModel.fromJson(json.decode(str));

String adminDashboardModelToJson(AdminDashboardModel data) =>
    json.encode(data.toJson());

class AdminDashboardModel {
  String message;
  AdminDashboardData data;

  AdminDashboardModel({required this.message, required this.data});

  factory AdminDashboardModel.fromJson(Map<String, dynamic> json) =>
      AdminDashboardModel(
        message: json["message"],
        data: AdminDashboardData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {"message": message, "data": data.toJson()};
}

class AdminDashboardData {
  int totalVisitors;
  List<dynamic> newVisitors;
  int todaysCheckins;
  int todaysCheckouts;
  Reviews reviews;
  List<MostSoldPackage> mostSoldPackages;
  RevenueGraph revenueGraph;
  List<dynamic> upcomingBookings;

  AdminDashboardData({
    required this.totalVisitors,
    required this.newVisitors,
    required this.todaysCheckins,
    required this.todaysCheckouts,
    required this.reviews,
    required this.mostSoldPackages,
    required this.revenueGraph,
    required this.upcomingBookings,
  });

  factory AdminDashboardData.fromJson(Map<String, dynamic> json) =>
      AdminDashboardData(
        totalVisitors: json["totalVisitors"],
        newVisitors: List<dynamic>.from(json["newVisitors"].map((x) => x)),
        todaysCheckins: json["todaysCheckins"],
        todaysCheckouts: json["todaysCheckouts"],
        reviews: Reviews.fromJson(json["reviews"]),
        mostSoldPackages: List<MostSoldPackage>.from(
          json["mostSoldPackages"].map((x) => MostSoldPackage.fromJson(x)),
        ),
        revenueGraph: RevenueGraph.fromJson(json["revenueGraph"]),
        upcomingBookings: List<dynamic>.from(
          json["upcomingBookings"].map((x) => x),
        ),
      );

  Map<String, dynamic> toJson() => {
    "totalVisitors": totalVisitors,
    "newVisitors": List<dynamic>.from(newVisitors.map((x) => x)),
    "todaysCheckins": todaysCheckins,
    "todaysCheckouts": todaysCheckouts,
    "reviews": reviews.toJson(),
    "mostSoldPackages": List<dynamic>.from(
      mostSoldPackages.map((x) => x.toJson()),
    ),
    "revenueGraph": revenueGraph.toJson(),
    "upcomingBookings": List<dynamic>.from(upcomingBookings.map((x) => x)),
  };
}

class MostSoldPackage {
  String packageName;
  String soldCount;

  MostSoldPackage({required this.packageName, required this.soldCount});

  factory MostSoldPackage.fromJson(Map<String, dynamic> json) =>
      MostSoldPackage(
        packageName: json["package_name"],
        soldCount: json["sold_count"],
      );

  Map<String, dynamic> toJson() => {
    "package_name": packageName,
    "sold_count": soldCount,
  };
}

class RevenueGraph {
  List<RevenueDatum> data;
  Summary summary;

  RevenueGraph({required this.data, required this.summary});

  factory RevenueGraph.fromJson(Map<String, dynamic> json) => RevenueGraph(
    data: List<RevenueDatum>.from(
      json["data"].map((x) => RevenueDatum.fromJson(x)),
    ),
    summary: Summary.fromJson(json["summary"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "summary": summary.toJson(),
  };
}

class RevenueDatum {
  DateTime date;
  String revenue;
  int totalBookings;

  RevenueDatum({
    required this.date,
    required this.revenue,
    required this.totalBookings,
  });

  factory RevenueDatum.fromJson(Map<String, dynamic> json) => RevenueDatum(
    date: DateTime.parse(json["date"]),
    revenue: json["revenue"],
    totalBookings: json["total_bookings"],
  );

  Map<String, dynamic> toJson() => {
    "date": date.toIso8601String(),
    "revenue": revenue,
    "total_bookings": totalBookings,
  };
}

class Summary {
  double totalRevenue;
  double averageRevenue;
  int totalBookings;

  Summary({
    required this.totalRevenue,
    required this.averageRevenue,
    required this.totalBookings,
  });

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
    totalRevenue: json["totalRevenue"]?.toDouble(),
    averageRevenue: json["averageRevenue"]?.toDouble(),
    totalBookings: json["totalBookings"],
  );

  Map<String, dynamic> toJson() => {
    "totalRevenue": totalRevenue,
    "averageRevenue": averageRevenue,
    "totalBookings": totalBookings,
  };
}

class Reviews {
  int total;
  List<Breakdown> breakdown;

  Reviews({required this.total, required this.breakdown});

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
    total: json["total"],
    breakdown: List<Breakdown>.from(
      json["breakdown"].map((x) => Breakdown.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "breakdown": List<dynamic>.from(breakdown.map((x) => x.toJson())),
  };
}

class Breakdown {
  String ratingType;
  int count;

  Breakdown({required this.ratingType, required this.count});

  factory Breakdown.fromJson(Map<String, dynamic> json) =>
      Breakdown(ratingType: json["rating_type"], count: json["count"]);

  Map<String, dynamic> toJson() => {"rating_type": ratingType, "count": count};
}
