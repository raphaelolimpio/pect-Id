import 'package:flutter/material.dart';
import 'package:pectid/components/card/baseCard/base_card.dart';
import 'package:pectid/shared/icon/base/icon_view_model.dart';
import 'package:pectid/config/model/post_model.dart';

class CardCustom3ViewModel extends BaseCardViewModel {
  final int id;
  final String topico;
  final String nome;
  final String categoria;
  final String definicao;
  final String? comando_exemplo;
  final String explicacao_pratica;
  final String? dicas_de_uso;
  final String buttonText;
  final void Function(BuildContext context) onButtonPressed;
  final VoidCallback? onFavoriteChanged;

  final IconViewModel? topicoIcon;
  final IconViewModel? categorIcon;
  final IconViewModel? definicaoIcon;
  final IconViewModel? comandoExemploIcon;
  final IconViewModel? explicacaoPraticaIcon;
  final IconViewModel? dicasDeUsoIcon;

  CardCustom3ViewModel({
    required this.id,
    required this.topico,
    required this.nome,
    required this.categoria,
    required this.definicao,
    this.comando_exemplo,
    required this.explicacao_pratica,
    this.dicas_de_uso,
    required this.buttonText,
    required this.onButtonPressed,
    this.onFavoriteChanged,

    this.topicoIcon,
    this.categorIcon,
    this.definicaoIcon,
    this.comandoExemploIcon,
    this.explicacaoPraticaIcon,
    this.dicasDeUsoIcon,
  });
  PostModel toPostModel() {
    return PostModel(
      id: id,
      topico: topico,
      nome: nome,
      categoria: categoria,
      definicao: definicao,
      comando_exemplo: comando_exemplo,
      explicacao_pratica: explicacao_pratica,
      dicas_de_uso: dicas_de_uso,
    );
  }
}
