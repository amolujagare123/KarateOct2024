package sample.passValue;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class SampleTestRunner {


    @Test
    public Karate runner()
    {
      return Karate.run("PssingValue")
              .relativeTo(getClass());
             // .tags("@createUserExternalFile");
    }

}
