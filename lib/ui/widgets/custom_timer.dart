import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jadwal_kuliah/ui/common/app_texts.dart';

class CustomTimer extends HookWidget {
  final DateTime start;
  final bool paused;

  const CustomTimer({
    super.key,
    required this.start,
    this.paused = false,
  });

  @override
  Widget build(BuildContext context) {
    final now = useState(DateTime.now());
    final diff = now.value.difference(start);

    final hours = diff.inHours;
    final minutes = diff.inMinutes % 60;
    final seconds = diff.inSeconds % 60;
    useEffect(() {
      final timer = Timer.periodic(const Duration(seconds: 1), (_) {
        now.value = DateTime.now();
      });

      if (paused) timer.cancel();

      return timer.cancel;
    }, [now, paused]);

    return Text(
      '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
      style: ktSemiBoldTextStyle.copyWith(fontSize: 18),
    );
  }
}
