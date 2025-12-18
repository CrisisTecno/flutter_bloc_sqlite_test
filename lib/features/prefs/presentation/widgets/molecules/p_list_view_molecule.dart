import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routes/app_routes.dart' as AppRoutes;
import '../../../domain/domain.dart';
import '../../presentation.dart';
import 'p_item_molecule.dart';

class PrefsListView extends StatelessWidget {
  final List<PreferenceEntity> items;
  final ValueChanged<int> onDelete;

  const PrefsListView({super.key, required this.items, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 80),
      itemCount: items.length,
      itemBuilder: (_, index) {
        final item = items[index];
        return PrefsItemCard(
          item: item,
          onDelete: () {
            context.read<PreferenceCubit>().deletePreference(item.id);
          },
          onTap: () async {
            final result = await context.push(
              AppRoutes.prefsDetail,
              extra: item,
            );
            if (result == true && context.mounted) {
              context.read<PreferenceCubit>().loadPreferences();
            }
          },
        );
      },
    );
  }
}
