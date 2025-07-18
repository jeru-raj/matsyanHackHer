import 'package:flutter/material.dart';

void main() {
  runApp(LabourManagementApp());
}

class LabourManagementApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Labour Management System',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Labour Management System')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => RegisterPage())),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => BuilderRegisterPage())),
              child: Text('Register as Builder'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => WorkerRegisterPage())),
              child: Text('Register as Worker'),
            ),
          ],
        ),
      ),
    );
  }
}

// Builder Registration Page
class BuilderRegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Builder Registration')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: 'Name')),
            TextField(decoration: InputDecoration(labelText: 'Phone Number')),
            TextField(decoration: InputDecoration(labelText: 'Address')),
            TextField(decoration: InputDecoration(labelText: 'Email Address')),
            TextField(decoration: InputDecoration(labelText: 'Company Name (Optional)')),
            TextField(decoration: InputDecoration(labelText: 'Nationality')),
            TextField(decoration: InputDecoration(labelText: 'Date of Birth')),
            TextField(decoration: InputDecoration(labelText: 'Aadhar Number')),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => BuilderDashboard())),
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

// Worker Registration Page
class WorkerRegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Worker Registration')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: 'Name')),
            TextField(decoration: InputDecoration(labelText: 'Address')),
            TextField(decoration: InputDecoration(labelText: 'Date of Birth')),
            TextField(decoration: InputDecoration(labelText: 'Aadhar Number')),
            TextField(decoration: InputDecoration(labelText: 'Phone Number')),
            TextField(decoration: InputDecoration(labelText: 'Email')),
            TextField(decoration: InputDecoration(labelText: 'Experience (Optional)')),
            TextField(decoration: InputDecoration(labelText: 'Job role')),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => WorkerDashboard())),
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

// Builder Dashboard
class BuilderDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome Builder')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => JobPostingPage())),
          child: Text('Post Jobs'),
        ),
      ),
    );
  }
}

// Worker Dashboard
class WorkerDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome Worker')),
      body: ListView(
        children: [
          jobListing(context, 'Painters Needed'),
          jobListing(context, 'Painters Needed'),
          jobListing(context, 'Painters Needed'),
          jobListing(context, 'Painters Needed'),
          jobListing(context, 'Painters Needed'),
          jobListing(context, 'Painters Needed'),
          jobListing(context, 'Painters Needed'),
          jobListing(context, 'Painters Needed'),
        ],
      ),
    );
  }

  Widget jobListing(BuildContext context, String jobTitle) {
    return ListTile(
      title: Text(jobTitle),
      subtitle: Text('Location: XYZ Street'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(onPressed: () {}, child: Text('Accept')),
          SizedBox(width: 10),
          ElevatedButton(onPressed: () {}, child: Text('Decline')),
        ],
      ),
    );
  }
}

// Job Posting
class JobPostingPage extends StatelessWidget {
  final List<String> jobCategories = [
    'Electricians', 'Painters', 'Plumbers', 'General Labors',
    'Masons', 'Tiles Fixing', 'False Ceiling', 'Carpenters'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Job Category')),
      body: ListView.builder(
        itemCount: jobCategories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(jobCategories[index]),
            onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => JobDetailsPage(jobCategories[index]))),
          );
        },
      ),
    );
  }
}

// Job Details Page
class JobDetailsPage extends StatelessWidget {
  final String category;
  JobDetailsPage(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$category Job Details')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: 'Number of Workers')),
            TextField(decoration: InputDecoration(labelText: 'Duration (Days/Time)')),
            TextField(decoration: InputDecoration(labelText: 'Site Location Address')),
            TextField(decoration: InputDecoration(labelText: 'Address')),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text('Successfully Job Posted'),
                    actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))],
                  ),
                );
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}




























