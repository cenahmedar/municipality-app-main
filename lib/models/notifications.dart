class Notifications {
  final String header;
  final String body;
  final DateTime createdAt;
  final bool isNew;

  Notifications({
    required this.body,
    required this.createdAt,
    required this.header,
    this.isNew = false,
  });

  static List<Notifications> getDummy() {
    return [
      Notifications(
          header: 'طلب رخصة بناء',
          body: 'تم قبول طلبك وهوالان قيد الدراسة',
          createdAt: DateTime.now(),
          isNew: true),
      Notifications(
        header: 'طلب رخصة بناء',
        body: 'تم قبول طلبك وهوالان قيد الدراسة',
        createdAt: DateTime.now(),
      ),
      Notifications(
        header: 'طلب رخصة بناء',
        body: 'تم قبول طلبك وهوالان قيد الدراسة',
        createdAt: DateTime.now(),
      ),
    ];
  }
}
