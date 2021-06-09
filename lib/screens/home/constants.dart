class CustomPopupMenu {
  final String title;
  final String value;

  CustomPopupMenu({required this.title, required this.value});
}

List<CustomPopupMenu> menu = [
  CustomPopupMenu(title: 'Applications', value: 'applications'),
  CustomPopupMenu(title: 'Choose Folder', value: 'choose_folder'),
  CustomPopupMenu(title: 'Restore Default', value: 'restore_default'),
  CustomPopupMenu(title: 'HomePage', value: 'homepage'),
  CustomPopupMenu(title: 'Help', value: 'help')
];
