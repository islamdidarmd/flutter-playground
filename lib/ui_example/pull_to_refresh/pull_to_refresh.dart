import 'package:flutter/material.dart';

class PullToRefreshScreen extends StatelessWidget {
  const PullToRefreshScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pull to Refresh')),
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
        builder: (_, snapshot) => _buildContent(snapshot),
      ),
    );
  }

  Widget _buildContent(AsyncSnapshot<_UserData> snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        return const Text('No future to execute');

      case ConnectionState.waiting:
        if (_cachedData != null) {
          return _buildListView(List.generate(50, (index) => _cachedData!));
        }
        return const Center(child: CircularProgressIndicator());

      case ConnectionState.active:
        return const Center(child: CircularProgressIndicator());

      case ConnectionState.done:
        if (snapshot.hasError) {
          return const Text('Error');
        }
        _cachedData = snapshot.requireData;
        return _buildListView(List.generate(50, (index) => _cachedData!));
    }
  }

  Widget _buildListView(List<_UserData> data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('${data[index].name} ${data[index].age + index}'),
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
