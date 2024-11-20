class DrAppointment {
  final String name;
  final String date;
  final String phone;
  final String time;
  String status;

  DrAppointment({
    required this.name,
    required this.time,
    required this.date,
    required this.phone,
    required this.status,
  });
}