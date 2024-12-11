


import 'package:flutter/cupertino.dart';

class HomeController with ChangeNotifier{

  int _selectedIndex=0;
  int _save=-1;
  final Set<int> _savedIndices = {}; // Store multiple selected indices

  int get selectedIndex => _selectedIndex;
  Set<int> get savedIndices => _savedIndices;
  int get save=>_save;
  setIndex(int value){
    _selectedIndex=value;
    notifyListeners();
  }
  setSave(int value){
    _save=value;
    notifyListeners();
  }
  void toggleSave(int value) {
    if (_savedIndices.contains(value)) {
      _savedIndices.remove(value); // Remove if already selected
    } else {
      _savedIndices.add(value); // Add if not selected
    }
    notifyListeners();
  }
  final List<String> categories = [
    'Technology',
    'Business',
    'Sports',
    'Entertainment',
    'Health',
    'Science',
    'Politics',
    'World News',
    'Finance',
    'Education'
  ];
  final List<Map<String, String>> newsItems = [
    {
      'heading': 'Technology Innovation:',
      'description': 'New advancements in AI are transforming the way we work, learn, and communicate. A glimpse into the future of technology.',
  "image":
  "https://bsmedia.business-standard.com/_media/bs/img/article/2024-09/12/full/1726122715-1162.jpg?im=FitAndFill=(826,465)",
    },
    {
      'heading': 'Global Economic Outlook:',
      'description': 'Experts predict growth in the global economy, but caution remains as inflation continues to be a concern in several regions.',
      "image":
      "https://bsmedia.business-standard.com/_media/bs/img/article/2024-09/12/full/1726122715-1162.jpg?im=FitAndFill=(826,465)",
    },
    {
      'heading': 'Sports: Big Game Tonight!:',
      'description': 'Tonight’s big football game is expected to be a thrilling match between the top two teams in the league.',
      "image":
      "https://bsmedia.business-standard.com/_media/bs/img/article/2024-09/12/full/1726122715-1162.jpg?im=FitAndFill=(826,465)",
    },
    {
      'heading': 'Health: New Vaccine Approved:',
      'description': 'A new vaccine for a recent virus outbreak has been approved for public use, promising to reduce health risks worldwide.',
      "image":
      "https://bsmedia.business-standard.com/_media/bs/img/article/2024-09/12/full/1726122715-1162.jpg?im=FitAndFill=(826,465)",
    },
    {
      'heading': 'Entertainment: New Movie Release:',
      'description': 'The long-awaited movie release this weekend promises to be a blockbuster hit, with a star-studded cast and amazing special effects.',
      "image":
      "https://bsmedia.business-standard.com/_media/bs/img/article/2024-09/12/full/1726122715-1162.jpg?im=FitAndFill=(826,465)",
    },
    {
      'heading': 'Politics: Election Campaigns Heat Up:',
      'description': 'The upcoming election has become the focal point of political discourse, with debates intensifying between candidates.',
      "image":
      "https://bsmedia.business-standard.com/_media/bs/img/article/2024-09/12/full/1726122715-1162.jpg?im=FitAndFill=(826,465)",
    },
  ];

}