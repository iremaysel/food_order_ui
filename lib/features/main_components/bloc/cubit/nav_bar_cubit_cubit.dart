import 'package:bloc/bloc.dart';

part 'nav_bar_cubit_state.dart';

class NavBarCubitCubit extends Cubit<NavBarCubitState> {
  NavBarCubitCubit() : super(const NavBarCubitState(0));

  void updateIndexNavBar(int index) => emit(NavBarCubitState(index));
  
}
