class FiveDayData {
  final String? dateTime;
  final int? temp;

  FiveDayData({this.dateTime, this.temp});

  factory FiveDayData.fromJson(dynamic json) {
    if (json == null) {
      return FiveDayData();
    }

    return FiveDayData(
      temp: (double.parse(json['main']['temp'].toString()) - 273.15).round(),
    );
  }
}
