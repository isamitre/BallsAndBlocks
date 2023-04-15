import java.util.Comparator;

// Entry class for Leaderboard
class Entry {
  private String username;
  private int points;

  // Entry constructor
  public Entry(String username, int points) {
    this.username = username;
    this.points = points;
  }

  // points getter
  public int getPoints() {
    return points;
  }

  // username getter
  public String getUsername() {
    return username;
  }
}

// https://www.geeksforgeeks.org/comparator-interface-java/
// helper class implementing Comparator interface
class SortByPoints implements Comparator<Entry> {
  public int compare(Entry e1, Entry e2) {
    return e2.getPoints() - e1.getPoints();
  }
}
