import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Snippet',
      home: SnippetScreen(),
    );
  }
}

class SnippetScreen extends StatelessWidget {
  const SnippetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FocusNode _titleFocusNode = FocusNode();
    final FocusNode _snippetFocusNode = FocusNode();

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Snippet'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/snip');
            // Handle going back to the previous screen
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Title card
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    focusNode: _titleFocusNode,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter title',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Snippet card
              Expanded(
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  TextField(
                                    focusNode: _snippetFocusNode,
                                    maxLines: null,
                                    decoration: InputDecoration(
                                      hintText: 'Enter your code snippet here',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Divider(thickness: 2),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Container(
                            margin: EdgeInsets.only(bottom: 16),
                            child: FloatingActionButton.extended(
                              onPressed: () {
// Handle adding the snippet to storage or database
                                final snippet = 'Snippet';
                                print('Snippet added: $snippet');
//Close the Keyboard
                                _titleFocusNode.unfocus();
                                _snippetFocusNode.unfocus();
                              },
                              label: Text('Add Snippet'),
                              icon: Icon(Icons.add),
                              elevation: 4,
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}