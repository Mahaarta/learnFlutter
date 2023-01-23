part of 'widgets.dart';

class SelectableBox extends StatelessWidget {
  final bool isSelected;
  final bool isEnabled;
  final double height;
  final double width;
  final String? text;
  final Function? onTap;
  final TextStyle? textStyle;

  const SelectableBox(this.text, this.textStyle,
      {super.key,
      this.isSelected = false,
      this.isEnabled = true,
      this.height = 144,
      this.width = 60,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap;
        }
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: (!isEnabled)
                  ? const Color(0xffe4e4e4)
                  : (isSelected)
                      ? Colors.transparent
                      : const Color(0xffe4e4e4),
            ),
            color: (!isEnabled)
                ? const Color(0xffe4e4e4)
                : isSelected
                    ? accentColor2
                    : Colors.transparent),
        child: Center(
          child: Text(
            text ?? "None",
            style: (textStyle ?? blackTextFont)
                .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
