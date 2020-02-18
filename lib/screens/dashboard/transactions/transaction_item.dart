abstract class ListItem {}

class TransactionItem implements ListItem {
  final String merchant;
  final String time;
  final String imageURL;
  final String amount;
  final String date;
  final String category;
  final String phoneNumber;
  final String merchantURL;
  final String address;

  TransactionItem(
      this.merchant,
      this.time,
      this.imageURL,
      this.amount,
      this.date,
      this.category,
      this.phoneNumber,
      this.merchantURL,
      this.address);
}

class Month implements ListItem {
  final String monthLabel;

  Month(this.monthLabel);
}
