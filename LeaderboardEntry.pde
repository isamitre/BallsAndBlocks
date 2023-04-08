import java.util.Comparator;

class Entry {
  private String username;
  private int points;
  
  public Entry(String username, int points) {
    this.username = username;
    this.points = points;
  }
  
  public int getPoints() {
    return points;
  }
  
  public String getUsername() {
    return username;
  }
}

class SortByPoints implements Comparator<Entry> {
  
  public int compare(Entry e1, Entry e2) {
    return e1.getPoints() - e2.getPoints();
  }
  
}
