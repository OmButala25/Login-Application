import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum type { Shipping, Transporter }

type? _type = type.Shipping;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 150.0,
              ),
              const Text(
                "Please select your Profile",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Container(
                decoration: BoxDecoration(border: Border.all(width: 2)),
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Radio<type>(
                        value: type.Shipping,
                        groupValue: _type,
                        onChanged: (value) {
                          setState(() {
                            _type = value;
                          });
                        }),
                    const Icon(
                      Icons.warehouse_outlined,
                      size: 40.0,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: const <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Shipper",
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet,consectetur adipiscing",
                            style: TextStyle(fontSize: 15.0),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                decoration: BoxDecoration(border: Border.all(width: 2)),
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Radio(
                        value: "Transporter",
                        groupValue: "Transporter",
                        onChanged: (value) {
                          setState(() {});
                        }),
                    const Icon(
                      Icons.emoji_transportation,
                      size: 40.0,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Transporter",
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet,consectetur adipiscing",
                            style: TextStyle(fontSize: 15.0),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                color: const Color(0xFF2E3B62),
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
