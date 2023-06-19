
class Conversa {

  late String _nome;
  late String _mensagem;
  late String _foto;


  Conversa(this._nome, this._mensagem, this._foto);

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  String get mensagem => _mensagem;

  String get foto => _foto;

  set foto(String value) {
    _foto = value;
  }

  set mensagem(String value) {
    _mensagem = value;
  }
}