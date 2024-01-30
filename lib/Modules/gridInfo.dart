class GridInfo {
  String title;
  String iconPath;

  GridInfo({
    required this.title,
    required this.iconPath,
  });

  static List<GridInfo> getGrids() {
    List<GridInfo> gridInfos = [];

    gridInfos.add(
      GridInfo(
        title: "Tops",
        iconPath: "assets/images/tops.png",
      ),
    );
    gridInfos.add(
      GridInfo(
        title: "Bottoms",
        iconPath: "assets/images/trousers.png",
      ),
    );
    gridInfos.add(
      GridInfo(
        title: "Jackets",
        iconPath: "assets/images/jackets.png",
      ),
    );
    gridInfos.add(
      GridInfo(
        title: "Jeans",
        iconPath: "assets/images/jeans.png",
      ),
    );
    gridInfos.add(
      GridInfo(
        title: "Shoes",
        iconPath: "assets/images/shoes.png",
      ),
    );
    gridInfos.add(
      GridInfo(
        title: "Jelewery",
        iconPath: "assets/images/jelewry.png",
      ),
    );

    return gridInfos;
  }
}
