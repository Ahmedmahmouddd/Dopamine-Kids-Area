import 'package:flutter/material.dart';
import 'package:kids_area_system/core/theme/app_colors.dart';
import 'package:kids_area_system/generated/l10n.dart';

class AddChildScreen extends StatelessWidget {
  const AddChildScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Spacer(flex: 3),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.button,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).enterNewChild,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(color: Colors.white),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              S.of(context).enterNewChildDescription,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.button),
                      ),
                      child: Form(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 32),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          labelText: S.of(context).childName,
                                          border: const OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 24),
                                    Expanded(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          labelText: S.of(context).entryID,
                                          border: const OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 24),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          labelText: S.of(context).phoneNumber1,
                                          border: const OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 24),
                                    Expanded(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          labelText: S
                                              .of(context)
                                              .phoneNumber2Optional,
                                          border: const OutlineInputBorder(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.button,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {},
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(flex: 3),
            ],
          ),
        ],
      ),
    );
  }
}
