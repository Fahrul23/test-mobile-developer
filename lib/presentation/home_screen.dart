// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/count_numbers/count_numbers_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Input N',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: () {
                            int input = int.parse(_controller.text);
                            context.read<CountNumbersBloc>().add(
                                  CountNumbersEvent.countFirst(input),
                                );
                          },
                          child: const Text("1"),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: () {
                            int input = int.parse(_controller.text);
                            context.read<CountNumbersBloc>().add(
                                  CountNumbersEvent.countSecond(input),
                                );
                          },
                          child: const Text("2"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: () {
                            int input = int.parse(_controller.text);
                            context.read<CountNumbersBloc>().add(
                                  CountNumbersEvent.countThird(input),
                                );
                          },
                          child: const Text("3"),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: () {
                            int input = int.parse(_controller.text);
                            context.read<CountNumbersBloc>().add(
                                  CountNumbersEvent.countFourth(input),
                                );
                          },
                          child: const Text("4"),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Result : ",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              BlocBuilder<CountNumbersBloc, CountNumbersState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loaded: (result) {
                      return Row(
                        children: result
                            .map(
                              (item) => Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  item.toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      );
                    },
                    loadedToString: (result) {
                      return Row(
                        children: result
                            .map(
                              (item) => Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      );
                    },
                    orElse: () => Container(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
