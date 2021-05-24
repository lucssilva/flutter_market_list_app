import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  @override
  build(_) => ListView.builder(
        itemBuilder: (_, i) => Dismissible(
          key: UniqueKey(),
          onDismissed: (_) {},
          child: ListTile(
            onTap: () {},
            leading: Checkbox(value: true, onChanged: (_) {}),
            title: Hero(
              tag: 'heroTag$i',
              child: Container(
                width: MediaQuery.of(_).size.width,
                child: Text('Task'),
              ),
            ),
            subtitle: Text('Subtitle'),
          ),
        ),
      );
}
