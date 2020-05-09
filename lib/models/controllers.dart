import 'package:flutter/foundation.dart';
import 'package:expandable/expandable.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Controllers extends ChangeNotifier {
  // Sliding panel
  final PanelController _slidingPanelController = PanelController();

  PanelController get slidingPanelController {
    return _slidingPanelController;
  }

  void toggleSlidingPanel() {
    _slidingPanelController.isPanelOpen
        ? closeSlidingPanel()
        : _slidingPanelController.open();
  }

  void closeSlidingPanel() {
    if (_slidingPanelController.isPanelOpen) {
      _slidingPanelController.close();
      lastExpanded = null;
      collapseMenus();
    }
  }

  // Genre menu option
  ExpandableController _genreController;

  ExpandableController get genreController {
    return _genreController;
  }

  void setGenreController(controller) {
    _genreController = controller;
    notifyListeners();
  }

  // Key menu option
  ExpandableController _keyController;

  ExpandableController get keyController {
    return _keyController;
  }

  void setKeyController(controller) {
    _keyController = controller;
    notifyListeners();
  }

  // Sale menu option
  ExpandableController _scaleController;

  ExpandableController get scaleController {
    return _scaleController;
  }

  void setSaleController(controller) {
    _scaleController = controller;
    notifyListeners();
  }

  // Menu options
  ExpandableController lastExpanded;

  void collapseMenus() {
    _genreController.expanded = false;
    _keyController.expanded = false;
    _scaleController.expanded = false;
  }

  void toggleMenu(menuOptionController) {
    collapseMenus();

    if (lastExpanded == menuOptionController) {
      lastExpanded = null;
    } else {
      lastExpanded = menuOptionController;
      menuOptionController.expanded = true;
    }
  }
}
