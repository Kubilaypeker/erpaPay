import 'package:cloud_firestore/cloud_firestore.dart';

class firestoreService {

  final db = FirebaseFirestore.instance;

  Future<void> createUser(Users user) async {
    await db.collection('Users').doc(user.id).set({
      'name' : user.name,
      'surname' : user.surname,
      'identityNumber' : user.identityNumber,
      'phoneNumber' : user.phoneNumber,
      'iban' : user.iban,
      'balance' : user.balance,
    });
  }

  Future<String?> getData(String documentId) async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc('bcYfJc2FRfdewxau8OVMrXMrY413')
        .get();

    if (documentSnapshot.exists) {
      String fieldValue = documentSnapshot.get('name');
      print(fieldValue);
      return fieldValue;
    } else {
      print('Document does not exist');
    }
    return null;
  }


  Future<void> saveTransaction(TransactionModel transaction) async {
    await db.collection('Transactions').doc(transaction.id).set({
      'senderName': transaction.senderName,
      'receiverName': transaction.receiverName,
      'receiverIban': transaction.receiverIban,
      'senderIban': transaction.senderIban,
      'amount': transaction.amount,
      'date': transaction.date,
    });
  }

  Future<List<TransactionModel>> getSendedTransactionsByUserId(String userName) async {
    QuerySnapshot querySnapshot = await db
        .collection('Transactions')
        .where('senderName', isEqualTo: userName)
        .get();
    List<TransactionModel> transactions =
    querySnapshot.docs.map((doc) => TransactionModel.fromSnapshot(doc)).toList();
    return transactions;
  }

  Future<List<TransactionModel>> getReceivedTransactionsByUserId(String userName) async {
    QuerySnapshot querySnapshot = await db
        .collection('Transactions')
        .where('receiverName', isEqualTo: userName)
        .get();
    List<TransactionModel> transactions =
    querySnapshot.docs.map((doc) => TransactionModel.fromSnapshot(doc)).toList();
    return transactions;
  }

}


class Users {
  final String name;
  final String surname;
  final String id;
  final String identityNumber;
  final String phoneNumber;
  final int balance;
  final String iban;

  Users({
    required this.name,
    required this.surname,
    required this.identityNumber,
    required this.phoneNumber,
    required this.id,
    required this.balance,
    required this.iban,
  });
  factory Users.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return Users(
      id: snapshot.id,
      name: data['name'],
      surname: data['surname'],
      identityNumber: data['identityNumber'],
      phoneNumber: data['phoneNumber'],
      iban: data['iban'],
      balance: data['balance'],
    );
  }
}

class TransactionModel {
  final String id;
  final String senderName;
  final String receiverName;
  final String senderIban;
  final String receiverIban;
  final double amount;
  final DateTime date;

  TransactionModel({
    required this.id,
    required this.senderName,
    required this.receiverName,
    required this.senderIban,
    required this.receiverIban,
    required this.amount,
    required this.date,
  });

  factory TransactionModel.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return TransactionModel(
      id: snapshot.id,
      senderName: data['senderName'],
      receiverName: data['receiverName'],
      senderIban: data['senderIban'],
      receiverIban: data['receiverIban'],
      amount: data['amount'],
      date: data['date'].toDate(),
    );
  }
}