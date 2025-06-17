import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeDark = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeDark.appBarTheme.backgroundColor,
        title: Text('User Profile', style: themeDark.textTheme.labelMedium),
        centerTitle: true,
      ),
      backgroundColor: themeDark.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white24),
                ),
                suffixIcon: Icon(Icons.account_circle),
                hintText: 'Name',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.white24),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white24),
                ),
                suffixIcon: Icon(Icons.calendar_today),
                hintText: 'Age',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.white24),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white24),
                ),
                suffixIcon: Icon(Icons.straighten),
                hintText: 'Height',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.white24),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white24),
                ),
                suffixIcon: Icon(Icons.monitor_weight),
                hintText: 'Weight',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.white24),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(16)),
                      backgroundColor: Colors.black,
                      title: Text(
                        'Please select your gender',
                        style: themeDark.textTheme.labelSmall,
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                              child: InkWell(
                            onTap: () {},
                            child: ListTile(
                                leading: Icon(Icons.male),
                                title: Text(
                                  'Male',
                                  style: themeDark.textTheme.headlineMedium,
                                )),
                          )),
                          Divider(
                            thickness: 0.5,
                            color: Colors.white,
                          ),
                          Container(
                              child: InkWell(
                            onTap: () {},
                            child: ListTile(
                                leading: Icon(Icons.female),
                                title: Text(
                                  'Female',
                                  style: themeDark.textTheme.headlineMedium,
                                )),
                          )),
                          Divider(
                            thickness: 0.5,
                            color: Colors.white,
                          ),
                          Container(
                              child: InkWell(
                            onTap: () {},
                            child: ListTile(
                                leading: Icon(Icons.person),
                                title: Text(
                                  'Other',
                                  style: themeDark.textTheme.headlineMedium,
                                )),
                          ))
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            'OK',
                            style: themeDark.textTheme.headlineMedium,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: AbsorbPointer(
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white24),
                    ),
                    suffixIcon: Icon(Icons.wc),
                    hintText: 'Gender',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.white24),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(16)),
                      backgroundColor: Colors.black,
                      title: Text(
                        'Please select your gender',
                        style: themeDark.textTheme.labelSmall,
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            child: InkWell(
                              onTap: () {},
                              child: ListTile(
                                leading: Icon(Icons.chair),
                                title: Text(
                                  'Sedentary',
                                  style: themeDark.textTheme.headlineMedium,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 0.5,
                            color: Colors.white,
                          ),
                          Container(
                            child: InkWell(
                              onTap: () {},
                              child: ListTile(
                                leading: Icon(Icons.directions_walk),
                                title: Text(
                                  'Lightly Active',
                                  style: themeDark.textTheme.headlineMedium,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 0.5,
                            color: Colors.white,
                          ),
                          Container(
                            child: InkWell(
                              onTap: () {},
                              child: ListTile(
                                leading: Icon(Icons.directions_run),
                                title: Text(
                                  'Moderately Active',
                                  style: themeDark.textTheme.headlineMedium,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 0.5,
                            color: Colors.white,
                          ),
                          Container(
                            child: InkWell(
                              onTap: () {},
                              child: ListTile(
                                leading: Icon(Icons.sports_gymnastics),
                                title: Text(
                                  'Very Active',
                                  style: themeDark.textTheme.headlineMedium,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 0.5,
                            color: Colors.white,
                          ),
                          Container(
                            child: InkWell(
                              onTap: () {},
                              child: ListTile(
                                leading: Icon(Icons.military_tech),
                                title: Text(
                                  'Extremely Active',
                                  style: themeDark.textTheme.headlineMedium,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            'OK',
                            style: themeDark.textTheme.headlineMedium,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: AbsorbPointer(
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white24),
                    ),
                    suffixIcon: Icon(Icons.directions_run),
                    hintText: 'Activity Level',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.white24),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 32),
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 110,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  child: Text(
                    'Cancel',
                    style: themeDark.textTheme.labelSmall,
                  ),
                ),
              ),
              SizedBox(
                width: 110,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  child: Text(
                    'Confirm',
                    style: themeDark.textTheme.labelSmall,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
