import java.util.Collections;
import java.io.File;

class Leaderboard {
  BufferedReader reader;
  PrintWriter output;
  Button menuBtn;
  int maxPlayers;
  ArrayList<Entry> topEntries;

  // Leaderboard constructor
  public Leaderboard() {
    menuBtn = new Button(width*0.95, 30, 30, 30, "—\n—\n—");
    maxPlayers = 5;
    topEntries = new ArrayList<Entry>();

    // read entries from file and put into topEntries
    reader = createReader("data/leaderboard.txt");
    getEntriesFromFile();
  }

  // display Leaderboard screen
  public void display() {
    rectMode(CENTER);

    // menu button
    menuBtn.display();

    // outer rectangle
    fill(255, 50);
    strokeWeight(3);
    rect(width/2, height/2, width*0.8, height*0.8, 20);

    // leaderboard text rectangle
    fill(#8fb8ea);
    rect(width/2, height*0.1, 150, 50, 20);
    textAlign(CENTER, CENTER);
    fill(0);
    text("LEADERBOARD", width/2, height*0.09);

    // if no one is on the leaderboard
    if (topEntries.size() == 0) {
      textAlign(CENTER);
      text("There is no one on the leaderboard yet", width*0.5, height*0.4);
    }

    // list top entries
    textAlign(LEFT);
    Collections.sort(topEntries, new SortByPoints());
    for (int i = 1; i <= min(maxPlayers, topEntries.size()); i++) {
      Entry currEntry = topEntries.get(i-1);
      text(i, width*0.2, height/4+i*40);
      text(currEntry.getUsername(), width*0.3, height/4+i*40);
      text(currEntry.getPoints(), width*0.65, height/4+i*40);
    }
  }

  // returns what currScreen should be
  public String updateScreen(String currScreen) {
    if (menuBtn.mouseOver()) {
      return "menu";
    }
    return currScreen;
  }

  // populates topEntries with entries from leaderboard.txt
  public void getEntriesFromFile() {
    // based on https://processing.org/reference/createReader_.html
    String line = null;
    try {
      while ((line = reader.readLine()) != null) {
        String[] entryComponents = split(line, TAB);
        String username = entryComponents[0];
        int points = int(entryComponents[1]);
        topEntries.add(new Entry(username, points));
      }
    }
    catch (IOException e) {
      e.printStackTrace();
    }
  }

  // adds entry to topEntries
  public void addEntry(String username, int points) {
    Entry entry = new Entry(username, points);

    // adds if there are less than maxPlayers or if points is greater than existing points on leaderboard
    if (topEntries.size() < maxPlayers || getLastEntry().getPoints() < points) {
      topEntries.add(entry);
      Collections.sort(topEntries, new SortByPoints());
    }

    // remove entries after maxPlayers
    if (topEntries.size() > maxPlayers) {
      topEntries.remove(maxPlayers);
    }

    // update file
    output = createWriter("data/leaderboard.txt");
    for (Entry currEntry : topEntries) {
      output.println(currEntry.getUsername() + "\t" + currEntry.getPoints());
    }

    output.flush();
    output.close();
  }

  // returns last entry of topEntries
  public Entry getLastEntry() {
    return topEntries.get(topEntries.size() - 1);
  }
}
