package prova.starwars;

import com.intuit.karate.junit5.Karate;

public class StarWarsRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("starwars").relativeTo(getClass());
    }
}
