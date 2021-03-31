import 'package:flutter/material.dart';
import '../blocs/stories_provider.dart';

class NewsList extends StatelessWidget {
  Widget build(context) {
    final bloc = StoriesProvider.of(context);

    // this is bad !!! .. donot do this
    // this is temperary
    bloc.fetchTopIds();
    return Scaffold(
      appBar: AppBar(
        title: Text('News List Screen'),
      ),
      body: buildList(bloc),
    );
  }
}

Widget buildList(StoriesBloc bloc) {
  return StreamBuilder(
    stream: bloc.topIds,
    builder: (BuildContext context, AsyncSnapshot<List<int>> snapshot) {
      if (!snapshot.hasData) {
        return Center(
          child: CircularProgressIndicator(
            strokeWidth: 5.0,
          ),
        );
      }
      return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return Text('${snapshot.data[index]}');
        },
      );
    },
  );
}
