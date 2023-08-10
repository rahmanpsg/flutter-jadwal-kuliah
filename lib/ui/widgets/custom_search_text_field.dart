import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:jadwal_kuliah/ui/common/app_colors.dart';
import 'package:jadwal_kuliah/ui/common/app_texts.dart';
import 'package:jadwal_kuliah/utils/debouce.dart';
import 'package:unicons/unicons.dart';
import 'custom_textfield_outline.dart';

class CustomSearchTextField extends HookWidget {
  final String? value;
  final String? hintText;
  final String? labelText;
  final ValueChanged<String>? onSearch;
  final Function(String)? onFieldSubmitted;
  final Function()? onClear;
  final ValueChanged<bool>? onFocused;
  final bool autoFocus;
  final Duration duration;
  final Color color;

  const CustomSearchTextField({
    super.key,
    this.value,
    this.onSearch,
    this.hintText,
    this.labelText,
    this.onFieldSubmitted,
    this.onClear,
    this.onFocused,
    this.autoFocus = false,
    this.duration = const Duration(milliseconds: 1000),
    this.color = kcBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final focusNode = useFocusNode();

    final debounce = Debounce(duration);
    final showClearButton = useState(false);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.text = value ?? '';

        if (value?.isEmpty == true) {
          controller.clear();
          focusNode.unfocus();
        }
      });

      return;
    }, [value]);

    useEffect(() {
      controller.addListener(() {
        if (controller.text.isNotEmpty) {
          showClearButton.value = true;
        } else {
          showClearButton.value = false;
          onSearch?.call(controller.text);
          onClear?.call();
          return;
        }

        debounce.call(() {
          if (controller.text.isNotEmpty) onSearch?.call(controller.text);
        });
      });

      if (autoFocus) focusNode.requestFocus();

      return;
    }, []);

    // check if focusNode is active
    useEffect(() {
      void onFocusChange() {
        onFocused?.call(focusNode.hasFocus);
      }

      focusNode.addListener(onFocusChange);
      return () => focusNode.removeListener(onFocusChange);
    }, [focusNode]);

    return CustomTextFieldOutline(
      controller: controller,
      focusNode: focusNode,
      hintText: hintText,
      hintStyle: ktRegularTextStyle.copyWith(
        color: kcDarkGreyColor,
      ),
      labelText: labelText,
      color: color,
      outlineColor: kcBackgroundColorDark,
      textInputAction: TextInputAction.search,
      onFieldSubmitted: onFieldSubmitted,
      prefixIcon: const IntrinsicWidth(
        child: Icon(UniconsLine.search),
      ),
      suffixIcon: showClearButton.value
          ? IconButton(
              icon: const Icon(
                Icons.clear,
                color: kcPrimaryColor,
              ),
              onPressed: () {
                controller.clear();
              },
            )
          : null,
    );
  }
}
