part of 'models.dart';

class Promo extends Equatable {
  final String title;
  final String subtitle;
  final int discount;

  const Promo(this.title, this.subtitle, this.discount);

  @override
  List<Object?> get props => [title, subtitle, discount];
}

List<Promo> dummyPromos = [
  const Promo("Student Holiday", "Maximal only for two people", 50),
  const Promo("Family Club", "Minimal for three members", 70),
  const Promo("Subscription Promo", "Min. one year", 40),
];
