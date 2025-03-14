import 'filter.dart';

class Search {
  static List<T> find<T extends Filter>({
    required List<T> items,
    required String q,
    SearchFilter<T>? filter,
  }) {
    List<T> i = filter == null
        ? items
        : items
            .where(
              (element) => filter(element),
            )
            .toList();
    return i
        .where(
          (element) => element.matcher(q),
        )
        .toList();
  }
}

typedef SearchFilter<T> = bool Function(T item);
