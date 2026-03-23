import 'package:flutter/material.dart';
import 'package:flutter_banco_douro/models/account.dart';
import 'package:flutter_banco_douro/services/account_service.dart';
import 'package:flutter_banco_douro/ui/styles/colors.dart';
import 'package:flutter_banco_douro/ui/widgets/account_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<List<Account>> refreshGetAll() async {
    return await AccountService().getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sistema de gestão de contas"),
        backgroundColor: AppColor.secondaryColor,
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            Navigator.pushReplacementNamed(context, "login");
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RefreshIndicator(
          onRefresh: refreshGetAll,
          child: FutureBuilder(
            future: AccountService().getAll(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.active:
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.done:
                  {
                    if (snapshot.data == null || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text("Nenhuma conta recebida."),
                      );
                    } else {
                      List<Account> listAccounts = snapshot.data!;
                      return ListView.builder(
                        itemCount: listAccounts.length,
                        itemBuilder: (context, index) {
                          Account account = listAccounts[index];
                          return AccountWidgets(account: account);
                        },
                      );
                    }
                  }
              }
            },
          ),
        ),
      ),
    );
  }
}
