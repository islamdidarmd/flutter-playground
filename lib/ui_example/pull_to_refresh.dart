import 'package:flutter/material.dart';

class PullToRefreshScreen extends StatelessWidget {
  const PullToRefreshScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pull to Refresh'),
      ),
      body: const SizedBox.expand(child: Center(child: _PullToRefreshView())),
    );
  }
}

class _PullToRefreshView extends StatefulWidget {
  const _PullToRefreshView({super.key});

  @override
  State<_PullToRefreshView> createState() => _PullToRefreshViewState();
}

class _PullToRefreshViewState extends State<_PullToRefreshView> {
  late Future<_UserData> _userDataFuture;

  _UserData? _cachedData;

  @override
  void initState() {
    super.initState();
    _userDataFuture = _fetchUserData().then((data) {
      _cachedData = data;
      return data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: _refreshData,
      child: FutureBuilder<_UserData>(
        future: _userDataFuture,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('No future to execute');

            case ConnectionState.waiting:
              if (_cachedData != null) {
                return ListView.builder(
                  itemCount: 50,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(snapshot.data!.name),
                      ),
                    );
              }
              return const Center(child: CircularProgressIndicator());

            case ConnectionState.active:
              return const Center(child: CircularProgressIndicator());

            case ConnectionState.done:
              if (snapshot.hasError) {
                return const Text('Error');
              }

              return ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(snapshot.data!.name),
                ),
              );
          }
        },
      ),
    );
  }

  Future<void> _refreshData() async {
    setState(() {
      _userDataFuture = _fetchUserData().then((data) {
        _cachedData = data;
        return data;
      });
    });
  }

  Future<_UserData> _fetchUserData() async {
    // Simulating API call
    await Future.delayed(const Duration(seconds: 2));
    return _UserData(name: 'John Doe', age: 30);
  }
}

class _UserData {
  final String name;
  final int age;

  _UserData({required this.name, required this.age});
}
