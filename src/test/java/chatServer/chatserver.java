package chatServer;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class chatserver {


    @Test
    public Karate runner()
    {
      return Karate.run("chatserver")
              .relativeTo(getClass())
              .tags("@GetAll1");
    }

}
