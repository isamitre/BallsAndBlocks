import java.util.Collections;

class Leaderboard {
  int maxPlayers;
  ArrayList<Entry> topEntries;

  public Leaderboard() {
    maxPlayers = 5;
    topEntries = new ArrayList<Entry>();
  }

  public void display() {
    rectMode(CENTER);
    noFill();
    strokeWeight(3);
    rect(width/2, height/2, width*0.8, height*0.8, 20);
    fill(#8fb8ea);
    rect(width/2, height*0.1, 150, 50, 20);
    textAlign(CENTER, CENTER);
    fill(0);
    text("LEADERBOARD", width/2, height*0.09);

    // list top entries
    textAlign(LEFT);
    Collections.sort(topEntries, new SortByPoints());
    for (int i = 1; i <= min(maxPlayers, topEntries.size()); i++) {
      Entry currEntry = topEntries.get(i-1);
      text(i, width*0.2, height/4+i*40);
      text(currEntry.getUsername(), width*0.3, height/4+i*40);
      text(currEntry.getPoints(), width*0.65, height/4+i*40);
    }
    if (topEntries.size() == 0) {
      textAlign(CENTER);
      text("There is no one on the leaderboard yet", width*0.5, height*0.4);
    }
  }

  public void addEntry(String username, int points) {
    Entry entry = new Entry(username, points);

    if (topEntries.size() < maxPlayers) {
      topEntries.add(entry);
      Collections.sort(topEntries, new SortByPoints());
    }
  }

  public Entry getLastEntry() {
    return topEntries.get(topEntries.size() - 1);
  }
}