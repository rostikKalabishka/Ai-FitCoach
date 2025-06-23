import 'package:ai_fit_coach/ui/theme/app_const.dart';
import 'package:flutter/material.dart';

class JoinNowScreen extends StatelessWidget {
  const JoinNowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeDark = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: Image.asset(
                      AppConst.challengeFood1Image,
                      height: 400,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.black,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Name of the challenge',
                      style: themeDark.textTheme.labelSmall,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.local_fire_department,
                        color: Colors.deepOrange,
                      ),
                      const SizedBox(width: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          '7 Days',
                          style: themeDark.textTheme.headlineMedium,
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 136, 0, 0),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'JOIN CHALLENGE',
                        style: themeDark.textTheme.headlineMedium,
                      ),
                      Text(
                        'Only 3.99 US \$',
                        style: themeDark.textTheme.headlineSmall,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'One-time payment. Once finished, the challenge will be removed from your list.',
                  style: themeDark.textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 5),
              Divider(),
              SizedBox(height: 10),
              Text(
                "WHAT YOU'LL GET",
                style: themeDark.textTheme.headlineMedium,
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  Row(
                    spacing: 20,
                    children: [
                      Icon(
                        Icons.self_improvement,
                        size: 45,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Grow confidence',
                            style: themeDark.textTheme.headlineMedium,
                          ),
                          Text(
                            'Tame your inner critic',
                            style: themeDark.textTheme.headlineSmall,
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    spacing: 20,
                    children: [
                      Icon(
                        Icons.psychology_alt,
                        size: 45,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reduce anxiety',
                            style: themeDark.textTheme.headlineMedium,
                          ),
                          Text(
                            'Improved mental health',
                            style: themeDark.textTheme.headlineSmall,
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    spacing: 20,
                    children: [
                      Icon(
                        Icons.favorite_outline,
                        size: 45,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Develop self-compassion',
                            style: themeDark.textTheme.headlineMedium,
                          ),
                          Text(
                            'Kindness towards yourself',
                            style: themeDark.textTheme.headlineSmall,
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    spacing: 20,
                    children: [
                      Icon(
                        Icons.remove_red_eye_outlined,
                        size: 45,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Improve focus',
                            style: themeDark.textTheme.headlineMedium,
                          ),
                          Text(
                            'Less brain fog from sugar highs/lows',
                            style: themeDark.textTheme.headlineSmall,
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    spacing: 20,
                    children: [
                      Icon(
                        Icons.lock_clock,
                        size: 45,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Strengthen willpower',
                            style: themeDark.textTheme.headlineMedium,
                          ),
                          Text(
                            'practice daily discipline',
                            style: themeDark.textTheme.headlineSmall,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
