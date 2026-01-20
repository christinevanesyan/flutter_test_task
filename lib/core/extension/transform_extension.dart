import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

extension BlocEventTransformer on Object {
  EventTransformer<Event> debounce<Event>({Duration? duration}) {
    return (events, mapper) =>
        events.debounceTime(duration ?? Durations.medium2).flatMap(mapper);
  }

  EventTransformer<Event> throttle<Event>(Duration duration) {
    return (events, mapper) => events.throttleTime(duration).flatMap(mapper);
  }
}
