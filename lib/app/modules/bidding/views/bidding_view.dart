import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bidding_controller.dart';

class BiddingView extends GetView<BiddingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BiddingView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'BiddingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
