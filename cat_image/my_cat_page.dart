import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_4/data/models/cat_model.dart';
import 'package:flutter_project_4/ui/cat_image/bloc/cat_bloc.dart';


class MyCatPage extends StatefulWidget {
  const MyCatPage({super.key});

  @override
  State<MyCatPage> createState() => _MyCatPageState();
}

class _MyCatPageState extends State<MyCatPage> {
  final CatBloc _catBloc = CatBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CatBloc, CatState>(
          bloc: _catBloc,
          builder: (context, state) {
            if (state is ErrorCatState){
              return Text('Ошибка',style: TextStyle(fontSize: 100, color: Colors.red),);
            } else if (state is LoadingCatState){
              return CircularProgressIndicator.adaptive();
            } else if (state is LoadedCatState){
              final List<CatModel> list = state.list;
              return ListView.separated(
                  itemCount: list.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index){
                    return Image.network(state.list[index].url);
                  });
            } else {
              return TextButton(onPressed: () {
                _catBloc.add(LoadCatImageEvent());
              }, child: Text('Load',style: TextStyle(fontSize: 100)));}
            }
          ),
      ),
    );
  }
}
