part of 'widgets.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? textSize;
  final Color textColor;
  final FontWeight textWeight;
  final FontStyle textStyle;
  final TextDecoration textDecoration;
  final VoidCallback? callback;
  final Color buttonColor;
  final Color loaderColor;
  final double loaderSize;
  final double width;
  final double height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget? icon;
  final bool iconFirst;
  final double borderRadius;
  final bool isLoading;
  final BoxDecoration? decoration;
  final Alignment alignment;
  final bool isSecondary;
  const CustomButton({
    super.key,
    required this.text,
    this.callback,
    this.textSize,
    this.width = double.infinity,
    this.padding,
    this.margin,
    this.icon,
    this.decoration,
    this.height = 45.0,
    this.borderRadius = 20.0,
    this.iconFirst = false,
    this.isLoading = false,
    this.isSecondary = false,
    this.textColor = Colors.white,
    this.buttonColor = AppColors.primary,
    this.loaderColor = Colors.white,
    this.loaderSize = 30.0,
    this.textWeight = FontWeight.w500,
    this.textStyle = FontStyle.normal,
    this.textDecoration = TextDecoration.none,
    this.alignment = Alignment.center,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: callback,
        style: TextButton.styleFrom(
          padding: padding,
          // margin: margin,
          alignment: alignment,

          backgroundColor: isSecondary ? Colors.transparent : buttonColor,
          foregroundColor: isSecondary ? buttonColor : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: isSecondary ? buttonColor : Colors.transparent),
            borderRadius: BorderRadius.circular(borderRadius),

            // border:
            //     isSecondary ? Border.all(width: 1, color: buttonColor) : null,
          ),
        ),
        child: isLoading
            ? const AppLoader()
            : icon == null
                ? CustomText(
                    text: text,
                    size: textSize ?? AppSizes.bodySmaller,
                    color: isSecondary ? buttonColor : textColor,
                    weight: textWeight,
                    style: textStyle,
                    decoration: textDecoration,
                  )
                : iconFirst
                    ? Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            icon!,
                            const Gutter(),
                            CustomText(
                              text: text,
                              size: textSize ?? AppSizes.bodySmaller,
                              color: isSecondary ? buttonColor : textColor,
                              weight: textWeight,
                              style: textStyle,
                              decoration: textDecoration,
                            ),
                          ],
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: text,
                            size: textSize ?? AppSizes.bodySmaller,
                            color: isSecondary ? buttonColor : textColor,
                            weight: textWeight,
                            style: textStyle,
                            decoration: textDecoration,
                          ),
                          const Gutter(),
                          icon!,
                        ],
                      ),
      ),
    );
  }
}
