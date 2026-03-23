import 'dart:async';

import 'package:http/http.dart';
import 'dart:convert';

import '../models/account.dart';
import 'api_key.dart';

class AccountService {
  final StreamController<String> _streamController = StreamController<String>();
  Stream<String> get streamInfos => _streamController.stream;

  // URL da API do GitHub (com o novo ID do Gist que você acabou de consultar com sucesso!)
  String url = "https://api.github.com/gists/fe938b037e51c1a6666500e4b2f53015";

  Future<List<Account>> getAll() async {
    Response response = await get(
      Uri.parse(url),
      headers: {"Authorization": "Bearer $githubApiKey"},
    );
    _streamController.add("${DateTime.now()} | Requisição de leitura.");

    // 1. Imprime exatamente o que o servidor respondeu (texto bruto)
    print("RESPOSTA DO SERVIDOR: ${response.body}");

    Map<String, dynamic> mapResponse = json.decode(response.body);
    List<dynamic> listDynamic = json.decode(
      mapResponse["files"]["accounts.json"]["content"],
    );

    // 2. Imprime a lista dinâmica já decodificada do JSON
    print("CONTEÚDO DA LISTA: $listDynamic");

    List<Account> listAccounts = [];

    for (dynamic dyn in listDynamic) {
      Map<String, dynamic> mapAccount = dyn as Map<String, dynamic>;
      Account account = Account.fromMap(mapAccount);
      listAccounts.add(account);

      // 3. Imprime os dados de cada conta que está sendo convertida
      print(
        "Conta convertida: Nome: ${account.name}, Saldo: ${account.balance}",
      );
    }

    // 4. Se você apenas der 'print(listAccounts);' ele pode mostrar "[Instance of Account]"
    // Para ver direito aqui, sua classe Account precisa ter o método toString() sobrescrito!
    print("LISTA FINAL: $listAccounts");

    return listAccounts;
  }

  Future<void> addAccount(Account account) async {
    List<Account> listAccounts = await getAll();
    listAccounts.add(account);
    await save(listAccounts, accountName: account.name);
  }

  Future<void> save(
    List<Account> listAccounts, {
    String accountName = "",
  }) async {
    List<Map<String, dynamic>> listContent = [];
    for (Account account in listAccounts) {
      listContent.add(account.toMap());
    }

    String content = json.encode(listContent);
    print(content);

    Response response = await post(
      Uri.parse(url),
      headers: {"Authorization": "Bearer $githubApiKey"},
      body: json.encode({
        "description": "account.json",
        "public": true,
        "files": {
          "accounts.json": {"content": content},
        },
      }),
    );

    if (response.statusCode.toString()[0] == "2") {
      _streamController.add(
        "${DateTime.now()} | Requisição adição bem sucedida ($accountName).",
      );
    } else {
      _streamController.add(
        "${DateTime.now()} | Requisição falhou ($accountName).",
      );
    }
  }
}
