import 'package:bloc/bloc.dart';
import 'package:flutter_project_4/data/models/cat_model.dart';
import 'package:flutter_project_4/data/reposiroty/animal_cat_repository.dart';
import 'package:meta/meta.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final AnimalCatRepository repository = AnimalCatRepository();
  CatBloc() : super(CatInitial()) {
    on<LoadCatImageEvent>((event, emit) async {
      try{
        emit(LoadingCatState());
        final List<CatModel> catList = await repository.getCatImage();
        emit(LoadedCatState(list: catList));
      }
      catch (e){
        emit(ErrorCatState());
      }
    });
  }
}
