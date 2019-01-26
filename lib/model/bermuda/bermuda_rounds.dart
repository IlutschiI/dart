class BermudaRound {
  final _value;
  final BermudaRound _nextRound;

  const BermudaRound._internal(this._value, this._nextRound);

  static const TWELVE = const BermudaRound._internal(12, THIRTEEN);
  static const THIRTEEN = const BermudaRound._internal(13, FOURTEEN);
  static const FOURTEEN = const BermudaRound._internal(14, DOUBLE);
  static const DOUBLE = const BermudaRound._internal('D', FIFTEEN);
  static const FIFTEEN = const BermudaRound._internal(15, SIXTEEN);
  static const SIXTEEN = const BermudaRound._internal(16, SEVENTEEN);
  static const SEVENTEEN = const BermudaRound._internal(17, TRIPLE);
  static const TRIPLE = const BermudaRound._internal('T', EIGHTEEN);
  static const EIGHTEEN = const BermudaRound._internal(18, NINETEEN);
  static const NINETEEN = const BermudaRound._internal(19, TWENTY);
  static const TWENTY = const BermudaRound._internal(20, BULL);
  static const BULL = const BermudaRound._internal('B', DOUBLE_BULL);
  static const DOUBLE_BULL = const BermudaRound._internal('DB', null);

  BermudaRound get nextRound => _nextRound;

  get value => _value;
}
