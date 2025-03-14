abstract class Filter {
  String getKey();

  bool matcher(String query) {
    return getKey().toLowerCase().contains(
          query.toLowerCase(),
        );
  }
}
