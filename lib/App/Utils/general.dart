import 'package:flutter/material.dart';





/// Animated Conditional
class AnimatedConditional extends StatelessWidget {
  final Widget first , second;
  final bool state;
  final Alignment? alignment;
  final Duration? duration , reverseDuration;
  final Curve? firstCurve , secondCurve , sizeCurve;

  const AnimatedConditional({
    super.key ,
    required this.state ,
    required this.first ,
    required this.second ,
    this.duration ,
    this.reverseDuration ,
    this.alignment ,
    this.sizeCurve ,
    this.firstCurve ,
    this.secondCurve

  });

  @override
  AnimatedCrossFade build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: first ,
      secondChild: second ,
      crossFadeState: state ? CrossFadeState.showFirst : CrossFadeState.showSecond ,
      secondCurve: secondCurve ?? Curves.linear ,
      sizeCurve: sizeCurve ?? Curves.linear ,
      firstCurve: firstCurve ?? Curves.linear,
      duration: duration ?? const Duration(milliseconds: 300),
      reverseDuration: reverseDuration ?? duration ,
      alignment: alignment ?? Alignment.topCenter ,
    );
  }
}


/// Text
class CustomText extends StatelessWidget {
  final String text;
  final int? maxLine;
  final TextStyle? style;
  final TextOverflow? overflow;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextDecoration? decoration;

  const CustomText({
    super.key,
    this.decoration,
    required this.text,
    this.maxLine,
    this.style,
    this.overflow,
    this.fontSize,
    this.fontWeight,
    this.color,
  });

  @override
  Text build(BuildContext context) {

    return Text(
        text ,
        //textDirection: TextDirection.ltr,
        style: style ??  TextStyle(
            fontFamily: 'Lato',
            fontSize: fontSize ?? 15.0,
            fontWeight: fontWeight ,
            color: color,
            decoration: decoration ?? TextDecoration.none
        ),
        maxLines: maxLine ?? 1 ,
        overflow: overflow ?? TextOverflow.ellipsis
    );
  }
}


/// Animated Text
class AnimatedText extends StatelessWidget {
  final String text;
  final int? maxLine;
  final TextStyle? style;
  final TextOverflow? overflow;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextDecoration? decoration;

  const AnimatedText({super.key,this.decoration,required this.text, this.maxLine, this.style, this.overflow, this.fontSize, this.fontWeight, this.color,});

  @override
  AnimatedDefaultTextStyle build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      maxLines: maxLine ?? 1 ,
      style: style ?? TextStyle(
          fontFamily: 'Lato',
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight ,
          overflow: overflow ?? TextOverflow.ellipsis ,
          decoration: decoration ?? TextDecoration.none
      ),
      duration: const Duration(milliseconds: 300),
      child: Text(
        text
      ),
    );
  }

}

/// Buttons
class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed ;
  final Widget child ;
  final EdgeInsets? padding ;
  final double? elevation ;
  final BorderRadius? borderRadius ;
  final Size? size ;
  final Color? backGroundColor ;

  const CustomTextButton({
    super.key,
    this.padding,
    this.elevation,
    this.borderRadius,
    this.size,
    this.backGroundColor ,
    required this.onPressed,
    required this.child
  });


  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          padding: padding,
          elevation: elevation,
          minimumSize: size,
          backgroundColor: backGroundColor,
          textStyle: const TextStyle(fontSize: 17.0),
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(0)
          ),
        ),
        onPressed: onPressed ,
        child: child
    );
  }
}


class CustomTextIconButton extends StatelessWidget {
  final VoidCallback onPressed ;
  final Widget child ;
  final Icon icon ;
  final EdgeInsets? padding ;
  final double? elevation ;
  final BorderRadius? borderRadius ;
  final Size? size ;
  final Color? backGroundColor ;

  const CustomTextIconButton({
    super.key ,
    this.padding ,
    this.elevation ,
    this.borderRadius ,
    this.size ,
    this.backGroundColor ,
    required this.onPressed,
    required this.child ,
    required this.icon ,
  });


  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        style: TextButton.styleFrom(
          padding: padding,
          elevation: elevation,
          minimumSize: size,
          backgroundColor: backGroundColor,
          textStyle: const TextStyle(fontSize: 17.0),
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(0)
          ),
        ),
        onPressed: onPressed ,
        icon: icon,
        label: child
    );
  }
}


class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed ;
  final Widget child ;
  final EdgeInsets? padding ;
  final double? elevation ;
  final BorderRadius? borderRadius ;
  final Size? size ;
  final Color? backGroundColor ;
  final BorderSide? borderSide ;

  const CustomOutlinedButton({
    super.key,
    this.padding,
    this.elevation,
    this.borderRadius,
    this.size,
    this.backGroundColor ,
    required this.onPressed,
    required this.child,
    this.borderSide
  });


  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: padding,
          elevation: elevation,
          minimumSize: size,
          side: borderSide,
          backgroundColor: backGroundColor,
          textStyle: const TextStyle(fontSize: 17.0),
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(0)
          ),
        ),
        onPressed: onPressed ,
        child: child
    );
  }
}


class CustomOutlinedIconButton extends StatelessWidget {
  final VoidCallback onPressed ;
  final Widget child ;
  final Icon icon ;
  final EdgeInsets? padding ;
  final double? elevation ;
  final BorderRadius? borderRadius ;
  final Size? size ;
  final Color? backGroundColor ;
  final BorderSide? borderSide;

  const CustomOutlinedIconButton({
    super.key,
    this.padding,
    this.elevation,
    this.borderRadius,
    this.size,
    this.backGroundColor ,
    required this.onPressed,
    required this.child,
    this.borderSide ,
    required this.icon
  });


  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        padding: padding,
        elevation: elevation,
        minimumSize: size,
        side: borderSide,
        backgroundColor: backGroundColor,
        textStyle: const TextStyle(fontSize: 17.0),
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(0)
        ),
      ) ,
      onPressed: onPressed ,
      icon: icon ,
      label: child ,
    );
  }
}


class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed ;
  final Widget child ;
  final EdgeInsets? padding ;
  final double? elevation ;
  final BorderRadius? borderRadius ;
  final Color? backGroundColor ;
  final Size? size ;

  const CustomElevatedButton({
    super.key,
    this.padding,
    this.backGroundColor,
    this.elevation,
    this.borderRadius,
    this.size,
    required this.onPressed,
    required this.child,
  });


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: padding,
          elevation: elevation,
          minimumSize: size,
          textStyle: const TextStyle(fontSize: 17.0),
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(0)
          ),
        ),
        onPressed: onPressed ,
        child: child
    );

  }
}


class CustomElevatedIconButton extends StatelessWidget {
  final VoidCallback onPressed ;
  final Widget child ;
  final Icon icon ;
  final EdgeInsets? padding ;
  final double? elevation ;
  final BorderRadius? borderRadius ;
  final Size? size ;
  final Color? backGroundColor ;
  final BorderSide? borderSide;


  const CustomElevatedIconButton({
    super.key ,
    this.padding ,
    this.elevation ,
    this.borderRadius ,
    this.size ,
    this.backGroundColor ,
    required this.onPressed ,
    required this.child ,
    this.borderSide ,
    required this.icon
  });


  @override
  Widget build(BuildContext context) {
    return  ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          padding: padding,
          elevation: elevation,
          minimumSize: size,
          textStyle: const TextStyle(fontSize: 17.0),
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(0)
          ),
        ),
        onPressed: onPressed ,
        icon: icon ,
        label: child
    );
  }
}