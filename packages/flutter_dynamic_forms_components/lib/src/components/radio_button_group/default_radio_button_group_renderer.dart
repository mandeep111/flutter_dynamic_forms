import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';

import 'radio_button_group.dart';

class DefaultRadioButtonGroupRenderer
    extends FormElementRenderer<RadioButtonGroup> {
  @override
  Widget render(
      RadioButtonGroup element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    List<Widget> childrenWidgets = [
      Padding(
        padding: const EdgeInsets.all(8.0),
      )
    ];
    for (var child in element.radioButtons) {
      if (child.isVisible.value) {
        childrenWidgets.add(renderer(child, context));
      }
    }

    return Column(
      children: childrenWidgets,
    );
  }
}