import 'package:eshop/core/di/di.dart';
import 'package:eshop/core/entities/product_entity.dart';
import 'package:eshop/core/widgets/product_item.dart';
import 'package:eshop/core/widgets/products_list.dart';
import 'package:eshop/features/fav/presentation/manager/favorite_cubit.dart';
import 'package:eshop/features/search/presentation/manager/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final cubit = SearchCubit(getIt());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit(getIt()),
      child: BlocProvider(
        create: (context) => cubit..search(search: "apple"),
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            return Container();
          },
        ),
      ),
    );
  }
}
