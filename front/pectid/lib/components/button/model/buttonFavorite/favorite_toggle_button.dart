import 'package:flutter/material.dart';
import 'package:pectid/config/model/post_model.dart';
import 'package:pectid/config/service/favorite_service.dart';
import 'package:provider/provider.dart';

class FavoriteToggleButton extends StatefulWidget {
  final int itemId;
  final PostModel itemModel;
  final VoidCallback? onFavoriteChanged;

  const FavoriteToggleButton({
    Key? key,
    required this.itemId,
    required this.itemModel,
    this.onFavoriteChanged,
  }) : super(key: key);

  @override
  State<FavoriteToggleButton> createState() => _FavoriteToggleButtonState();
}

class _FavoriteToggleButtonState extends State<FavoriteToggleButton> {
  Future<void> _toggleFavorite(
    BuildContext context,
    FavoriteService service,
    bool isCurrentlyFavorited,
  ) async {
    if (isCurrentlyFavorited) {
      final removedItem = await service.removeFavorite(widget.itemId);
      if (removedItem != null && mounted) {
        
      }
    } else {
      await service.addFavorite(widget.itemModel);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Termo Adicionado aos Favoritos!'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoriteService = context.watch<FavoriteService>();
    final serviceForCallback = context.read<FavoriteService>();
    bool isFavorited = favoriteService.isFavorite(widget.itemId);
    return IconButton(
      icon: Icon(
        isFavorited ? Icons.favorite : Icons.favorite_border,
        color: isFavorited ? Colors.red : Colors.grey,
      ),
      onPressed: () =>
          _toggleFavorite(context, serviceForCallback, isFavorited),
      tooltip: isFavorited
          ? 'Remover dos favoritos'
          : 'Adicionar aos favoritos',
    );
  }
}
