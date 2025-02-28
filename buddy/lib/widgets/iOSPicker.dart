import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "../data/fasteners.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddy/logic/torque_logic.dart';



const double _kItemExtent = 32.0;
Iterable<String> keys = fasteners['inch']['coarse'].keys;
List<String> fine = fasteners['inch']['fine'].keys.toList();
List<String> sizes = fasteners['inch']['coarse'].keys.toList();


class CupertinoPickerExample extends ConsumerWidget {
  const CupertinoPickerExample({super.key});


  // This shows a CupertinoModalPopup with a reasonable fixed height which hosts CupertinoPicker.
  void _showDialog(BuildContext context, Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
          children: [
            Expanded(
              child: GestureDetector(
                onDoubleTap: () => ref.watch(Providers().threadSizeProvider) ? ref.read(Providers().threadSizeProvider.notifier).setThreadSize(false) : null,
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Fine', style: TextStyle(color: ref.watch(Providers().threadSizeProvider) ? Color(0xFF838285) : Colors.white),),
                Container(
                  width: 150,
                  height: 75,
                  decoration: BoxDecoration(
                    color: ref.watch(Providers().threadSizeProvider) ? Color(0xFF212023) : Color(0xFFF4FFDC), // Background color
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    // Display a CupertinoPicker with list of fruits.
                    onPressed: () => ref.watch(Providers().threadSizeProvider)? null : _showDialog(
                      context,
                      CupertinoPicker(
                        magnification: 1.22,
                        squeeze: 1.2,
                        useMagnifier: true,
                        itemExtent: _kItemExtent,
                        // This sets the initial item.
                        scrollController: FixedExtentScrollController(
                          initialItem: ref.watch(Providers().fineProvider),
                        ),
                        // This is called when selected item is changed.
                        onSelectedItemChanged: (int selectedItem) {
                          ref.read(Providers().fineProvider.notifier).setFine(selectedItem);
                          ref.read(Providers().fineNameProvider.notifier).setName(fine[selectedItem]);
                        },
                        children:
                            List<Widget>.generate(fine.length, (int index) {
                          return Center(child: Text(fine[index]),);
                        }),
                      ),
                    ),
                    // This displays the selected fruit name.
                    child: Text(
                      fine[ref.watch(Providers().fineProvider)],
                      style: const TextStyle(
                        fontSize: 22.0,
                        color: Color(0xFF838285)
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ),

          Expanded( 
            child: GestureDetector(
              onDoubleTap: () => ref.watch(Providers().threadSizeProvider) ? null : ref.read(Providers().threadSizeProvider.notifier).setThreadSize(true),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Text('Course', style: TextStyle(color: ref.watch(Providers().threadSizeProvider) ? Colors.white : Color(0xFF838285)),),
                Container(
                  width: 150,
                  height: 75,
                  decoration: BoxDecoration(
                    color: ref.watch(Providers().threadSizeProvider) ? Color(0xFFF4FFDC) : Color(0xFF212023), // Background color
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    // Display a CupertinoPicker with list of fruits.
                    onPressed: () => !ref.watch(Providers().threadSizeProvider)? null :_showDialog(
                      context,
                      CupertinoPicker(
                        magnification: 1.22,
                        squeeze: 1.2,
                        useMagnifier: true,
                        itemExtent: _kItemExtent,
                        // This sets the initial item.
                        scrollController: FixedExtentScrollController(
                          initialItem: ref.watch(Providers().sizeProvider),
                        ),
                        // This is called when selected item is changed.
                        onSelectedItemChanged: (int selectedItem) {
                          ref.read(Providers().sizeProvider.notifier).setSize(selectedItem);
                          ref.read(Providers().sizeNameProvider.notifier).setName(sizes[selectedItem]);
                        },
                        children:
                            List<Widget>.generate(sizes.length, (int index) {
                          return Center(child: Text(sizes[index]),);
                        }),
                      ),
                    ),
                    // This displays the selected fruit name.
                    child: Text(
                      sizes[ref.watch(Providers().sizeProvider)],
                      style: const TextStyle(
                        fontSize: 22.0,
                        color: Color(0xFF838285)
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ),
          ],
      );
  }
}
