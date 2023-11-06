import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:memory_conatiner/core/routes/app_routes.dart';
import 'package:memory_conatiner/core/shared_feature/domain/entity/gallery_entity.dart';
import 'package:memory_conatiner/features/add/presentation/presenter/add_view_model.dart';

class BottomControlBar extends StatelessWidget {
  const BottomControlBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
      child: Row(
        children: [
          _GalleryIcon(),
        ],
      ),
    );
  }
}

class _GalleryIcon extends ConsumerWidget {
  const _GalleryIcon();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () => _onPressed(context, ref),
      icon: const Icon(Icons.photo),
    );
  }

  void _onPressed(BuildContext context, WidgetRef ref) {
    context.pushNamed(AppRoutes.gallery.name).then((value) {
      AddViewModel addViewModel = ref.read(addViewModelProvider);

      addViewModel.galleries.add(value as GalleryEntity);
    });
  }
}
