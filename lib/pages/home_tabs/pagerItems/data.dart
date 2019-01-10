class IntroItem {
  IntroItem({
    this.title,
    this.category,
    this.imageUrl,
  });

  final String title;
  final String category;
  final String imageUrl;
}

final sampleItems = <IntroItem>[
  new IntroItem(title: 'Writing things together is what we do best!', category: 'PICK UP & DROP', imageUrl: 'assets/wm/cleaning_process.png',),
  new IntroItem(title: 'Occasionally wearing pants is a good idea.', category: 'ALL TYPE OF WASHINGS', imageUrl: 'assets/wm/laundry_seankerry.png',),
  new IntroItem(title: 'We might have the best team spirit ever.', category: 'BEST CLEANING MACHINES', imageUrl: 'assets/wm/storage.png',),
];