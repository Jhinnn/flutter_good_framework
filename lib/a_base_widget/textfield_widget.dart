import 'package:flutter/material.dart';

class TextFieldContentWidget extends StatelessWidget {
  const TextFieldContentWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TextField(
            autofocus: true,
            decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                prefixIcon: const Icon(Icons.person)),
          ),
          const TextField(
            decoration:  InputDecoration(
                labelText: "密码",
                hintText: "您的登录密码",
                prefixIcon:  Icon(Icons.lock)),
            obscureText: true,
          ),
          const SizedBox(height: 40),
          Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Colors.black45),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          fillColor: Colors.white,
                          filled: true,
                          hintStyle: const TextStyle(fontSize: 16,color: Colors.black26),
                          hintText: '请输入',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: BorderSide.none)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      width: 600,
                      height: 40,
                      child: TextField(
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 16,color: Colors.black26),
                          hintText: '请输入',
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16),
                            fillColor: Colors.yellow,
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
