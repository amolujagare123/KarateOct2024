package GoRest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class GoRESTestRunner {


    @Test
    public Karate runner()
    {
      return Karate.run("GoRestPassingValue")
              .relativeTo(getClass())
              .tags("@createPassingValue");
    }

}
