package com.demo.runner;

import com.intuit.karate.junit5.Karate;

class TestRunner {

    @Karate.Test
    Karate runAll() {
        // Establece el entorno manualmente (solo si no viene por CLI)
        if (System.getProperty("karate.env") == null) {
            System.setProperty("karate.env", "dev");
        }
        return Karate.run("classpath:features").relativeTo(getClass());
    }
}
