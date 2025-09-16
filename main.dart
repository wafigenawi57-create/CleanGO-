import 'package:flutter/material.dart';

void main() {
  runApp(CleanGoApp());
}

class CleanGoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CleanGo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => AuthScreen()),
      );
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logo.png", height: 120),
            SizedBox(height: 20),
            Text("CleanGo",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple)),
          ],
        ),
      ),
    );
  }
}

class AuthScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("تسجيل الدخول")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: InputDecoration(labelText: "البريد الإلكتروني")),
            TextField(controller: phoneController, decoration: InputDecoration(labelText: "رقم الهاتف")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => CustomerScreen()));
              },
              child: Text("دخول كـ زبون"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => MerchantScreen()));
              },
              child: Text("دخول كـ صاحب محل"),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("واجهة الزبون")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => ReceiptScreen()));
                },
                child: Text("تنفيذ طلب")),
          ],
        ),
      ),
    );
  }
}

class ReceiptScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("إيصال الطلب")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("طلبك: غسيل تيشيرت - 20 جنيه"),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => TrackingScreen()));
            },
            child: Text("تتبع الطلب"),
          ),
        ],
      ),
    );
  }
}

class TrackingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("تتبع الطلب")),
      body: Column(
        children: [
          ListTile(title: Text("جار المعالجة")),
          ListTile(title: Text("في الطريق")),
          ListTile(title: Text("تم التسليم")),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => RatingScreen()));
            },
            child: Text("حسناً"),
          ),
        ],
      ),
    );
  }
}

class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  int rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("التقييم")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("قيّم تجربتك:"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return IconButton(
                icon: Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                ),
                onPressed: () {
                  setState(() {
                    rating = index + 1;
                  });
                },
              );
            }),
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("شكراً لتقييمك $rating نجوم")));
              Navigator.pop(context);
            },
            child: Text("إرسال التقييم"),
          )
        ],
      ),
    );
  }
}

class MerchantScreen extends StatelessWidget {
  final TextEditingController shopController = TextEditingController();
  final TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("طلب انضمام")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(controller: shopController, decoration: InputDecoration(labelText: "اسم المحل")),
            TextField(controller: idController, decoration: InputDecoration(labelText: "رقم الهوية")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("تم إرسال الطلب مبدئياً ✅")));
              },
              child: Text("إرسال"),
            ),
          ],
        ),
      ),
    );
  }
}
