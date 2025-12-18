import 'package:flutter/material.dart';

class PrefsActionButtons extends StatelessWidget {
  final bool isEditing;
  final VoidCallback onEdit;
  final VoidCallback onSave;
  final VoidCallback onDelete;

  const PrefsActionButtons({
    super.key,
    required this.isEditing,
    required this.onEdit,
    required this.onSave,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            icon: Icon(isEditing ? Icons.save : Icons.edit),
            label: Text(isEditing ? 'Guardar' : 'Editar'),
            onPressed: isEditing ? onSave : onEdit,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.greenAccent,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton.icon(
            icon: const Icon(Icons.delete, color: Colors.white,),
            label: const Text('Eliminar',style: TextStyle(color:Colors.white),),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            onPressed: onDelete,
          ),
        ),
      ],
    );
  }
}
