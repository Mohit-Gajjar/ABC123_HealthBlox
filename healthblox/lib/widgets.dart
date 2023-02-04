import 'package:flutter/material.dart';

class TextFieldEmail extends StatelessWidget {
  final TextEditingController controller;
  const TextFieldEmail({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.email),
          hintText: "example@gmail.com",
          label: const Text("Enter email"),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}

class TextFieldPassword extends StatefulWidget {
  final TextEditingController controller;
  final String hintText, labelText;
  const TextFieldPassword({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.labelText,
  }) : super(key: key);

  @override
  State<TextFieldPassword> createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      keyboardType: TextInputType.visiblePassword,
      controller: widget.controller,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
          ),
          hintText: widget.hintText,
          label: Text(widget.labelText),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}

class CustomBlackButtonRounded extends StatelessWidget {
  final String title;
  final double height, width;
  final VoidCallback onPressed;
  const CustomBlackButtonRounded({
    Key? key,
    required this.title,
    required this.height,
    required this.width,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
            fixedSize: MaterialStateProperty.all(Size(width, height)),
            backgroundColor: MaterialStateProperty.all(Colors.black)),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ));
  }
}
class BlackTextNormalStart extends StatelessWidget {
  final String title;
  final double size;
  const BlackTextNormalStart({
    Key? key,
    required this.title,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.start,
      style: TextStyle(
        color: Colors.black,
        fontSize: size,
      ),
    );
  }
}
class BlackTextNormalCenter extends StatelessWidget {
  final String title;
  final double size;
  const BlackTextNormalCenter({
    Key? key,
    required this.title,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontSize: size),
    );
  }
}


class TextFieldText extends StatelessWidget {
  final TextEditingController controller;
  final String hintText, labelText;
  const TextFieldText({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.text_fields),
          hintText: hintText,
          label: Text(labelText),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}
