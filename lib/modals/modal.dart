class Website {
  String name;
  String image;
  String url;
  
  Website({
    required this.name,
    required this.image,
    required this.url,
});
}

List webeducation = <Website>[
  Website(name: 'Wikipedia', image: "https://images.indianexpress.com/2021/02/Wikipedia_LOGO.jpeg", url: "https://en.wikipedia.org/wiki/Main_Page"),
  Website(name: 'W3Schools', image: "https://yt3.ggpht.com/dW6to0x5Crmeh7yi-YPLcQRqVrBtx2BSh8eoKTJbE8NbjloQ0sqlmdszIlxokJU_97-ndOt_=s900-c-k-c0x00ffffff-no-rj", url: "https://www.w3schools.com/"),
  Website(name: 'JavaTPoint', image: "https://static.javatpoint.com/phalcon/images/phalcon-images3.png", url: "https://www.javatpoint.com/"),
  Website(name: 'TutorialsPoint', image: "https://www.nyongesasande.com/wp-content/uploads/2021/12/tutorials_point.jpeg", url: "https://www.tutorialspoint.com/index.htm"),
];