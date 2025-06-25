import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text('User Profile', style: theme.textTheme.labelMedium),
        centerTitle: true,
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: theme.colorScheme.onSurface),
                ),
                suffixIcon: Icon(Icons.account_circle),
                hintText: 'Name',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: theme.colorScheme.onSurface),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: theme.colorScheme.onSurface),
                ),
                suffixIcon: Icon(Icons.calendar_today),
                hintText: 'Age',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: theme.colorScheme.onSurface),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: theme.colorScheme.onSurface),
                ),
                suffixIcon: Icon(Icons.straighten),
                hintText: 'Height',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: theme.colorScheme.onSurface),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: theme.colorScheme.onSurface),
                ),
                suffixIcon: Icon(Icons.monitor_weight),
                hintText: 'Weight',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: theme.colorScheme.onSurface),
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
                        style: theme.textTheme.displaySmall?.copyWith(fontSize: 16),
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
                                  style: theme.textTheme.displaySmall,
                                )),
                          )),
                          Divider(
                            thickness: 0.5,
                          ),
                          Container(
                              child: InkWell(
                            onTap: () {},
                            child: ListTile(
                                leading: Icon(Icons.female),
                                title: Text(
                                  'Female',
                                  style: theme.textTheme.displaySmall,
                                )),
                          )),
                          Divider(
                            thickness: 0.5,
                          ),
                          Container(
                              child: InkWell(
                            onTap: () {},
                            child: ListTile(
                                leading: Icon(Icons.person),
                                title: Text(
                                  'Other',
                                  style: theme.textTheme.displaySmall,
                                )),
                          ))
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text(
                            'OK',
                            style: theme.textTheme.displaySmall,
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
                      borderSide: BorderSide(color: theme.colorScheme.onSurface),
                    ),
                    suffixIcon: Icon(Icons.wc),
                    hintText: 'Gender',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: theme.colorScheme.onSurface),
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
                        style: theme.textTheme.displaySmall?.copyWith(fontSize: 16),
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
                                  style: theme.textTheme.displaySmall,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 0.5,
                          ),
                          Container(
                            child: InkWell(
                              onTap: () {},
                              child: ListTile(
                                leading: Icon(Icons.directions_walk),
                                title: Text(
                                  'Lightly Active',
                                  style: theme.textTheme.displaySmall,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 0.5,
                          ),
                          Container(
                            child: InkWell(
                              onTap: () {},
                              child: ListTile(
                                leading: Icon(Icons.directions_run),
                                title: Text(
                                  'Moderately Active',
                                  style: theme.textTheme.displaySmall,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 0.5,
                          ),
                          Container(
                            child: InkWell(
                              onTap: () {},
                              child: ListTile(
                                leading: Icon(Icons.sports_gymnastics),
                                title: Text(
                                  'Very Active',
                                  style: theme.textTheme.displaySmall,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 0.5,
                          ),
                          Container(
                            child: InkWell(
                              onTap: () {},
                              child: ListTile(
                                leading: Icon(Icons.military_tech),
                                title: Text(
                                  'Extremely Active',
                                  style: theme.textTheme.displaySmall,
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
                            style: theme.textTheme.displaySmall,
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
                      borderSide: BorderSide(color: theme.colorScheme.onSurface),
                    ),
                    suffixIcon: Icon(Icons.directions_run),
                    hintText: 'Activity Level',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: theme.colorScheme.onSurface),
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
                    style: theme.textTheme.labelSmall,
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
                    style: theme.textTheme.labelSmall,
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
