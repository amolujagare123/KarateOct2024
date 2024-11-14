package deckofcards;

import com.intuit.karate.junit5.Karate;

public class deckofcards {

    @Karate.Test
    public Karate runner()
    {
        return Karate.run("deckofcards")
                .relativeTo(getClass())
                .tags("@DrawCards");
    }
}
