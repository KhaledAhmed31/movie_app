import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/assets/assets.dart';
import '../../domain/entities/movie_details_entity.dart';
import '../../../Watchlist/presentation/cubit/watchlist_cubit.dart';
import '../../../Watchlist/presentation/cubit/watchlist_state.dart';

class AddToWatchlistButton extends StatefulWidget {
  const AddToWatchlistButton({super.key, required this.movie});
  final MovieDetailsEntity movie;
  @override
  State<AddToWatchlistButton> createState() => _AddToWatchlistButtonState();
}

class _AddToWatchlistButtonState extends State<AddToWatchlistButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late bool isWished;
  @override
  initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      reverseDuration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isWished = BlocProvider.of<WatchlistCubit>(
      context,
    ).movies.any((element) => element.id == widget.movie.id);
    !isWished ? _controller.reverse() : _controller.forward();

    return BlocListener<WatchlistCubit, WatchlistState>(
      listener: (context, state) {
        if (state is WatchlistErrorState) {
          isWished ? _controller.reverse() : _controller.forward();
          isWished = !isWished;
        }
      },
      child: GestureDetector(
        onTap: () async {
          isWished ? _controller.reverse() : _controller.forward();
          isWished
              ? await BlocProvider.of<WatchlistCubit>(
                  context,
                ).deleteFromWatchlist(widget.movie)
              : await BlocProvider.of<WatchlistCubit>(
                  context,
                ).addToWatchlist(widget.movie);
          isWished = !isWished;
        },
        child: Lottie.asset(
          Assets.bookMark,
          controller: _controller,
          width: 45.w,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
