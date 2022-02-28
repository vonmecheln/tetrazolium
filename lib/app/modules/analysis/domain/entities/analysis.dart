class Analysis {
  final DateTime date;
  final String amostra;
  final String local;
  final double concentration;
  final int viability;
  final int vigor;
  final List repetition = [];

  Analysis({
    required this.date,
    required this.amostra,
    required this.local,
    required this.concentration,
    required this.viability,
    required this.vigor,
  });
}
