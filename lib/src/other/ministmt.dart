import 'package:flutter/material.dart';

class MiniStatement extends StatefulWidget {
  List<dynamic>? ministatement;

  MiniStatement({required this.ministatement, super.key});

@override
State<StatefulWidget> createState() => _MiniStatement();
}

class _MiniStatement extends State<MiniStatement> {
  List<Transaction> transactionList = [];

  @override
  void initState() {
    super.initState();
    addTransactions(list: widget.ministatement);
  }

  // {
  // "Date":"2022-06-29",
  // "TrxType":"D",
  // "Amount":"5,000",
  // "Narration":"ELMA\/AIRTE"
  // },

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text("Ministatement"),
      ),
      body: ListView.separated(
        itemCount: transactionList.length,
        itemBuilder: (BuildContext context, index) {
          return Container(
              padding:
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Transaction date"),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        transactionList[index].date,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Amount"),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(transactionList[index].amount,
                          style: const TextStyle(fontWeight: FontWeight.bold))
                    ],
                  )
                ],
              ));
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }

  addTransactions({required list}) {
    list.forEach((item) {
      transactionList.add(Transaction.fromJson(item));
    });
  }
}

class Transaction {
  String date;
  String amount;

  Transaction({required this.date, required this.amount});

  Transaction.fromJson(Map<String, dynamic> json)
      : date = json["Date"],
        amount = json["Amount"];
}
