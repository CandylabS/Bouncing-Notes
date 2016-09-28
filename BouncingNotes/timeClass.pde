class Timer {
  int startTime;

  Timer() {   // constructor
    reset();
  }

  void reset() {
    startTime = millis();
  }

  int elapsedMillis() {
    return millis() - startTime;
  }
}