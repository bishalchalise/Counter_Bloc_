import 'package:flutter/material.dart';

import '../bloc/bloc_imports.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          
            BlocConsumer<CounterBloc, CounterState>(
                listener: (context, state) {
              if (state is IncrementState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Counter Increased'),
                    duration: Duration(milliseconds: 300),
                  ),
                 );
              }else if (state is DecrementState){
                 ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Counter Decreased'),
                    duration: Duration(milliseconds: 300),
                  ),
                 );
              }
              else if (state is ResetState)
              {
                     ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Counter Reset'),
                    duration: Duration(milliseconds: 300),
                  ),
                 );
              }
            },
              builder: (context, state) {
                return Text('Counter Value: ${state.counterValue}');
              },
            ),
          
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => context
                        .read<CounterBloc>()
                        .add(CounterIncrementEvent()),
                    icon: const Icon(Icons.add),
                    label: const Text('Add'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () =>
                        context.read<CounterBloc>().add(CounterResetEvent()),
                    icon: const Icon(Icons.circle_outlined),
                    label: const Text('Reset'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => context
                        .read<CounterBloc>()
                        .add(CounterDecrementEvent()),
                    icon: const Icon(Icons.remove),
                    label: const Text('Sub'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
