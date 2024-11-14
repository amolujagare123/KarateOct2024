package JobPortal;

import com.intuit.karate.junit5.Karate;

import java.util.ArrayList;
//import com.intuit.karate.junit5.Karate.Test;

public class JobPortaltestRunner {

    @Karate.Test
    Karate runFeature()
    {


       /* ArrayList<String> al = new ArrayList<>() {{
            add("@getAll");
            add("@create");
        }};*/

        return Karate.run("JobPortal")
                .relativeTo(getClass())
                .tags("@multipleDataPrint2");
    }
}
