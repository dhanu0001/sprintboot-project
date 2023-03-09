package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoController {


    @GetMapping("/hi")
    public Hello sayHi() {
        return new Hello("Hello, from spring boot 2");
    }
}
