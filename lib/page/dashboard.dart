import 'package:flutter/material.dart';
import 'package:p20240420/page/attendancepage.dart';
import 'package:p20240420/page/flowpage.dart';
import 'package:p20240420/page/holidaypage.dart';
import 'package:p20240420/page/leavepage.dart';
import 'package:p20240420/page/purchasepage.dart';
import 'package:p20240420/page/workdaypage.dart';
import 'package:p20240420/page/revenuepage.dart';
import 'package:p20240420/page/writeoffPage.dart';
import 'package:p20240420/page/queuepage.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<DashboardPage> createState() => _MyDashboardPageState();
}

class _MyDashboardPageState extends State<DashboardPage> {
  bool gridMode = false;
  List<String> items = ['请假', '放假', '工作日', '考勤', '流水', '营收', '采购', '核销', '排队'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[200],
        title: Text(widget.title),
        automaticallyImplyLeading: false, // 不显示返回按钮
      ),
      body: gridMode ? _buildGridView() : _buildListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            gridMode = !gridMode;
          });
        },
        child: Icon(gridMode ? Icons.list : Icons.grid_view),
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
            margin: EdgeInsets.all(10.0),
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: SizedBox(
                child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Colors.orange[100]), // button's fill color
              ),
              onPressed: () {
                navigateToPage(context, items[index]);
              },
              child: Center(
                child: Text(
                  items[index],
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            )));
      },
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          color: index % 2 == 0 ? Colors.green[200] : Colors.yellow[200],
          child: InkWell(
            onTap: () {
              navigateToPage(context, items[index]);
            },
            child: Center(
              child: Text(items[index]),
            ),
          ),
        );
      },
    );
  }

  void navigateToPage(BuildContext context, String item) {
    switch (item) {
      case '请假':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LeavePage()));
        break;
      case '放假':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HolidayPage()));
        break;
      case '工作日':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WorkdayPage()));
        break;
      case '考勤':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AttendancePage()));
        break;
      case '流水':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FlowPage()));
        break;
      case '营收':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RevenuePage()));
        break;
      case '采购':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PurchasePage()));
        break;
      case '核销':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => WriteOffPage()));
        break;
      case '排队':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => QueuePage()));
        break;
      default:
        break;
    }
  }
}
