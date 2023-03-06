class Transaction {
  Transaction({
    required this.id,
    required this.title,
    required this.price,
    required this.date,
  });

  final int id;
  final String title;
  final double price;
  final DateTime date;
}
