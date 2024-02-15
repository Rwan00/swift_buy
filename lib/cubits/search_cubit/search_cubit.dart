import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swift_buy/cubits/search_cubit/search_state.dart';
import 'package:swift_buy/helper/dio_helper.dart';
import 'package:swift_buy/helper/end_points.dart';
import 'package:swift_buy/models/search_model.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  GetSearchModel? searchModel;
  void search(String text) {
    emit(SearchLoadingState());
    DioHelper.postData(
      url: SEARCH,
      data: {
        "text": text,
      },
    ).then((value) {
      searchModel = GetSearchModel.fromJson(value.data);
      print(searchModel!.data.products[0].name);
      emit(SearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SearchErrorState());
    });
  }
}
