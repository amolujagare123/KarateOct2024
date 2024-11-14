package VariableDemo;

import com.intuit.karate.junit5.Karate;

public class Variable {

    @Karate.Test
    Karate runFeature()
    {


        return Karate.run("variable")
                .relativeTo(getClass());

    }
}
