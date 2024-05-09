abstract class TessbihState {
  late int subhanAllahCount;
  late int alhamdulillahCount;
  late int laIlahaIlaAllahCount;
  late int allahuAkbarCount;

}

class TessbihCounters extends TessbihState {
  final int subhanAllahCount;
  final int alhamdulillahCount;
  final int laIlahaIlaAllahCount;
  final int allahuAkbarCount;

  TessbihCounters(
      this.subhanAllahCount,
      this.alhamdulillahCount,
      this.laIlahaIlaAllahCount,
      this.allahuAkbarCount,
      );
}

class TessbihReset extends TessbihState {}
