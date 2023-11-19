import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memory_conatiner/core/shared_feature/domain/entity/gallery_entity.dart';
import 'package:memory_conatiner/features/add/presentation/presenter/add_gallery_view_model.dart';

class ImagePanel extends StatelessWidget {
  const ImagePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Consumer(
        builder: (context, ref, child) {
          GalleryEntity state = ref.watch(addGalleryViewModeProvider);

          return Container(
            color: state.isFileEmpty ? Colors.grey[400] : Colors.white,
            height: (MediaQuery.of(context).size.height - kToolbarHeight) / 2,
            width: MediaQuery.of(context).size.width - 20,
            child: state.isFileEmpty
                ? const Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.black,
                    size: 30,
                  )
                : Image.file(state.file),
          );
        },
      ),
      onTap: () => _onTap(context),
    );
  }

  void _onTap(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => const _TypeSelectionBottomSheet(),
    );
  }
}

class _TypeSelectionBottomSheet extends ConsumerWidget {
  const _TypeSelectionBottomSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 15,
          ),
          ListTile(
            title: const Text('사진'),
            onTap: () => _imageOnTap(context, ref),
          ),
          ListTile(
            title: Text('영상'),
            onTap: () {
              ImagePicker().pickVideo(source: ImageSource.gallery);
            },
          ),
        ],
      ),
    );
  }

  void _imageOnTap(BuildContext context, WidgetRef ref) async {
    await ref
        .read<AddGalleryViewModel>(addGalleryViewModeProvider.notifier)
        .selectImage();

    if (context.mounted) context.pop();
  }
}
