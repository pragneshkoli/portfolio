import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> _selectedTab = ValueNotifier<int>(0);
  ScrollController _scrollController = ScrollController();
  final List<String> tabs = [
    "Status Window",
    "Experience",
    "Abilities & Skills",
    "Inventory & Artifacts",
    "Quests & Achievements",
    "Guild Recruitment",
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        Text(
          "Made with ❤️ by Pragnesh Koli",
          style: TextStyle(fontFamily: 'Orbitron',fontSize: 14, color: Colors.blueAccent),
        ),
      ],
      body: Stack(
        children: [
          // Image.asset(
          //    "assets/background0.png",
          //   height: height,
          //   width: width,
          //   fit: BoxFit.fill,
          // ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                _buildTabButtons(),
                SizedBox(height: width > 800 ? 100 : 20),
                Expanded(
                  child: ValueListenableBuilder<int>(
                    valueListenable: _selectedTab,
                    builder: (context, tabIndex, _) {
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        transitionBuilder: (child, animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        child: _buildCard(tabIndex),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🔵 Tab Buttons
  Widget _buildTabButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 10,
        children: List.generate(tabs.length, (index) {
          return ValueListenableBuilder<int>(
            valueListenable: _selectedTab,
            builder: (context, selected, _) {
              bool isSelected = selected == index;
              return GestureDetector(
                onTap: () => _selectedTab.value = index,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blueAccent : Colors.transparent,
                    border: Border.all(color: Colors.blueAccent, width: 1.5),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow:
                        isSelected
                            ? [
                              BoxShadow(
                                color: Colors.blueAccent.withOpacity(0.6),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ]
                            : [],
                  ),
                  child: Text(
                    tabs[index],
                    style: TextStyle(
                      fontFamily: 'Orbitron',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.black : Colors.white70,
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }

  // calculate years of experience
  double calculateExactYearsDifference(DateTime fromDate) {
    DateTime today = DateTime.now();
    Duration diff = today.difference(fromDate);
    double years =
        diff.inDays /
        365.25; // Approximate year conversion (leap years considered)
    return years;
  }

  // 🔹 Flexible System Window with Categorized Abilities & Skills
  Widget _buildCard(int tabIndex) {
    Map<int, List<Map<String, dynamic>>> content = {
      0: [
        {"Name": "Pragnesh Koli"},
        {"Class": "Mobile Application Developer"},
        {"Title": "Android Developer, Flutter Developer, Maven Developer"},
        {"Current Job Title": "Flutter Developer"},
        {
          "Experience":
              "${calculateExactYearsDifference(DateTime.parse("2022-09-01")).toStringAsFixed(1)} + Years in Flutter",
        },
        {
          "Level":
              "${(calculateExactYearsDifference(DateTime.parse("2022-09-01")) * 10).toInt()}",
        },
        {"Strength": "85"},
        {"Agility": "65"},
        {"Intelligence": "70"},
        {"Endurance": "80"},
        {
          "Current Job": [
            {"Guild": "Softcolon Technology PVT LTD"},
            {"Duration": "Sep 2022 - Present"},
            {"Title": "Maven Developer (Award)"},
            {"Job Title": "Mobile Application Developer"},
            {"Role": "Flutter Developer"},
            {"Projects": "8"},
            {"Achievements": "Maven Developer - 2023"},
          ],
        },
      ],
      1: [
        {
          "Softcolon Technology PVT LTD": [
            {"Title": "Maven Developer (Award)"},
            {"Job Title": "Mobile Application Developer"},
            {"Role": "Flutter Developer"},
            {"Duration": "Sep 2022 - Present"},
            {"Projects": "8"},
            {"Achievements": "Maven Developer - 2023"},
          ],
        },
      ],
      2: [
        {
          "Frontend Development": [
            {"Flutter": "Advanced"},
            {"Flutter - Jaspr": "Intermediate"},
            {"React Native": "Intermediate"},
          ],
        },
        {
          "Backend Development": [
            {"Spring Boot": "Advanced"},
            {"NodeJs": "Intermediate"},
            {"Firebase": "Advanced"},
            {"SQL": "Intermediate"},
            {"REST API": "Expert"},
          ],
        },
        {
          "Programming Languages": [
            {"Dart": "Advanced"},
            {"Java": "Advanced"},
          ],
        },
        {
          "UI/UX Design": [
            {"UI/UX": "Advanced"},
          ],
        },
      ],
      3: [
        {"Leela Corporation": "Android App with REST API Integration"},
        {
          "MYMiRU":
              "Flutter Mobile App with REST API and Live CCTV Video Streaming Integration",
        },
        {
          "Trading Platform":
              "Flutter App, Web and Windows App with REST API and Socket.IO Integration",
        },
        {"Fastwin": "Flutter Web App with REST API Integration"},
        {"Billing Software": "Flutter Windows App with REST API Integration"},
        {"Health Care": "Flutter Mobile App with Firebase Integration"},
        {"Air Drop Lite": "Flutter Windows and Mac App"},
        {
          "The Art Gallery Admin Panel":
              "Flutter Web App with REST API Integration",
        },
        {
          "The Art Gallery User Panel":
              "Flutter Mobile App with REST API Integration",
        },
        {"The Art Gallery Backend": "Java Springboot with MongoDB"},
        {"Follow Client CRM": "Flutter Mobile App with REST API Integration"},
      ],
      4: [
        {"Degree": "BCA, Gujarat University (2020-23)"},
        {"Projects Completed": "8"},
        {
          "Experience":
              "${calculateExactYearsDifference(DateTime.parse("2022-09-01")).toStringAsFixed(1)} + Years in Flutter",
        },
        {"Achievements": "Maven Developer"},
      ],
      5: [
        {
          "Email": [
            {"": "pragneshkoli84344@gmail.com"},
          ],
        },
        {
          "Phone": [
            {"": "+91 6351621487"},
          ],
        },
        {
          "Address": [
            {"": "Nikol, Ahmedabad, Gujarat, India"},
          ],
        },
        {
          "GitHub": [
            {"": "https://github.com/pragneshkoli"},
          ],
        },
        {
          "LinkedIn": [
            {"": "https://linkedin.com/in/pragnesh-kolipatel-385133213/"},
          ],
        },
      ],
    };

    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        constraints: const BoxConstraints(minWidth: 100, maxWidth: 500),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8),
          border: Border.all(color: Colors.blueAccent, width: 2),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.6),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Scrollbar(
          controller: _scrollController,
          thumbVisibility: false,
          // Hide scrollbar
          thickness: 6,
          // Adjust thickness
          radius: Radius.circular(10),
          // Rounded edges
          scrollbarOrientation: ScrollbarOrientation.right,
          // Position (left/right)
          child: SingleChildScrollView(
            controller: _scrollController,
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              // Center items only for tabIndex 5
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  tabs[tabIndex],
                  style: TextStyle(
                    fontFamily: 'Orbitron',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                const Divider(color: Colors.blueAccent),
                ..._buildContent(content[tabIndex]!, tabIndex),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 🔹 Helper Function to Render Categorized Skills
  List<Widget> _buildContent(List<Map<String, dynamic>> data, int tabIndex) {
    List<Widget> widgets = [];
    // if (tabIndex == 0) {
    //   widgets.add(
    //     Image.asset(
    //       "assets/profile.jpeg",
    //       height: 150,
    //       width: 150,
    //     ),
    //   );
    // }
    for (var item in data) {
      if (item.values.first is List) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              item.keys.first,
              style: TextStyle(
                fontFamily: 'Orbitron',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: tabIndex == 5 ? Colors.white : Colors.blueAccent,
              ),
            ),
          ),
        );
        for (var subItem in item.values.first) {
          widgets.add(
            _buildStat(subItem.keys.first, subItem.values.first, tabIndex),
          );
        }
      } else {
        widgets.add(_buildStat(item.keys.first, item.values.first, tabIndex));
      }
    }
    return widgets;
  }

  Widget _buildStat(String name, String value, int tabIndex) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            tabIndex == 5
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              name,
              style: TextStyle(
                fontFamily: 'Orbitron',
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFeatures: [FontFeature.tabularFigures()],
              ),
              overflow: TextOverflow.ellipsis, // Prevents text from breaking
              maxLines: 5,
              textAlign: TextAlign.start,
            ),
          ),
          tabIndex == 5
              ? InkWell(
                onTap:
                    value.startsWith("https://")
                        ? () async {
                          if (value.startsWith("https://")) {
                            await launchUrl(Uri.parse(value));
                          }
                        }
                        : null,
                child: Text(
                  value.replaceFirst("https://", ""),
                  style: TextStyle(
                    fontFamily: 'Orbitron',
                    fontSize: 16,
                    fontFeatures: [FontFeature.tabularFigures()],
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              )
              : Flexible(
                child: Text(
                  value,
                  style: TextStyle(
                    fontFamily: 'Orbitron',
                    fontSize: 16,
                    fontFeatures: [FontFeature.tabularFigures()],
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                  overflow:
                      TextOverflow.ellipsis, // Prevents text from breaking
                  maxLines: 5,
                  textAlign: TextAlign.end,
                ),
              ),
        ],
      ),
    );
  }
}
