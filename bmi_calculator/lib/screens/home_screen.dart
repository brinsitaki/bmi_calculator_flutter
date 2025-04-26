import 'package:bmi_calculator/components/calculation_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> heightOptions =
      List.generate(201, (index) => (index + 1).toString());
  String gender = "";
  int height = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0c1135),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111638),
        automaticallyImplyLeading: false,
        title: const Text(
          "BMI calculator",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Row(
              children: [
                createGenderButton(genderButton: "female"),
                createGenderButton(genderButton: "male"),
              ],
            ),
          ),
          createHeightContainer(context),
          Expanded(
            child: Row(
              children: [
                createCustomContainer(
                  title: "Weight",
                  value: weight,
                  min: 1,
                  max: 300,
                  unit: "kg",
                  onIncrement: () {
                    setState(() {
                      if (weight < 300) weight++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      if (weight > 1) weight--;
                    });
                  },
                ),
                createCustomContainer(
                  title: "Age",
                  value: age,
                  min: 1,
                  max: 130,
                  unit: "Years",
                  onIncrement: () {
                    setState(() {
                      if (age < 130) age++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      if (age > 1) age--;
                    });
                  },
                ),
              ],
            ),
          ),
          CalculationButton(
            height: height,
            weight: weight,
            textButton: "Calculate Your BMI",
          ),
          const SizedBox(
            height: 4.0,
          ),
        ],
      ),
    );
  }

  Expanded createHeightContainer(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isLargeScreen = screenWidth >= 800;
    return Expanded(
      child: Container(
        color: const Color(0xFF151a3c),
        width: MediaQuery.of(context).size.width - 16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Height",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (!isLargeScreen) {
                  showValuePicker(
                    context: context,
                    title: "Height",
                    min: 50,
                    max: 300,
                    currentValue: height,
                    onSelected: (newValue) {
                      setState(() {
                        height = newValue;
                      });
                    },
                  );
                }
              },
              child: RichText(
                text: TextSpan(
                  text: "$height",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                  ),
                  children: const [
                    TextSpan(
                      text: "cm",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Slider(
              value: height.toDouble(),
              min: 50.0,
              max: 300.0,
              onChanged: (newValue) {
                setState(() {
                  height = newValue.toInt();
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Expanded createCustomContainer(
      {required String title,
      required int value,
      required int min,
      required int max,
      required String unit,
      required VoidCallback onIncrement,
      required VoidCallback onDecrement}) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isLargeScreen = screenWidth >= 800;
    return Expanded(
      child: Container(
        margin:
            const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0, right: 4.0),
        padding: const EdgeInsets.all(8.0),
        color: const Color(0xFF151a3c),
        child: Column(
          mainAxisAlignment: isLargeScreen
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: isLargeScreen ? 20.0 : 25,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (!isLargeScreen) {
                  showValuePicker(
                    context: context,
                    title: title,
                    min: min,
                    max: max,
                    currentValue: value,
                    onSelected: (newValue) {
                      setState(() {
                        if (title == "Weight") {
                          weight = newValue;
                        } else if (title == "Age") {
                          age = newValue;
                        }
                      });
                    },
                  );
                }
              },
              child: RichText(
                text: TextSpan(
                  text: "$value",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isLargeScreen ? 40.0 : 50,
                  ),
                  children: [
                    TextSpan(
                      text: unit,
                      style: TextStyle(
                        fontSize: isLargeScreen ? 15.0 : 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  color: Color(0xFF111638),
                  borderRadius: BorderRadius.circular(30.0),
                  child: InkWell(
                    onTap: onIncrement,
                    borderRadius: BorderRadius.circular(30.0),
                    splashColor: Colors.white.withValues(alpha: 0.3),
                    hoverColor: Colors.white.withValues(alpha: 0.1),
                    child: Container(
                      width: 55.0,
                      height: 55.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '+',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Color(0xFF111638),
                  borderRadius: BorderRadius.circular(30.0),
                  child: InkWell(
                    onTap: onDecrement,
                    borderRadius: BorderRadius.circular(30.0),
                    splashColor: Colors.white.withValues(alpha: 0.3),
                    hoverColor: Colors.white.withValues(alpha: 0.1),
                    child: Container(
                      width: 55.0,
                      height: 55.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '-',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Expanded createGenderButton({required String genderButton}) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            gender = genderButton;
          });
        },
        child: Container(
          margin: const EdgeInsets.only(
              top: 8.0, bottom: 8.0, left: 8.0, right: 4.0),
          padding: const EdgeInsets.all(8.0),
          color: gender == genderButton
              ? const Color(0XFF8C8D97)
              : const Color(0xFF151a3c),
          child: Image.asset(
            "images/$genderButton.png",
          ),
        ),
      ),
    );
  }

  void showValuePicker({
    required BuildContext context,
    required String title,
    required int min,
    required int max,
    required int currentValue,
    required ValueChanged<int> onSelected,
  }) async {
    int? selectedValue = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF0c1135),
          title: Text(
            'Pick your $title',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          content: SizedBox(
            height: 300.0,
            width: 100,
            child: ScrollbarTheme(
              data: ScrollbarThemeData(
                thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
                  if (states.contains(WidgetState.dragged)) {
                    return Colors.blueAccent;
                  }
                  if (states.contains(WidgetState.hovered)) {
                    return Colors.blue.withValues(alpha: 0.8);
                  }
                  return Colors.blue.withValues(alpha: 0.6);
                }),
              ),
              child: Scrollbar(
                thumbVisibility: true,
                interactive: true,
                child: ListView.builder(
                  itemCount: max - min + 1,
                  itemBuilder: (context, index) {
                    int value = min + index;
                    return ListTile(
                      title: Text(
                        "$value",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pop(value);
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );

    if (selectedValue != null && selectedValue != currentValue) {
      onSelected(selectedValue);
    }
  }
}
