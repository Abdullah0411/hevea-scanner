import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreCollections {
  static final users = firestore.collection('users');
  static final invoices = firestore.collection('users');
  static final cards = firestore.collection('cards');
  static final wallets = firestore.collection('wallets');
  static final latestScans = firestore.collection('latestScans');
  static final transactionHistory = firestore.collection('transactionHistory');
  static final partnerScans = firestore.collection('heveaPartnerScans');
  static final partnerDetails = firestore.collection('partnerDetails');
  static final scansCounters = firestore.collection('scansCounters');

  static final firestore = FirebaseFirestore.instance;
}
