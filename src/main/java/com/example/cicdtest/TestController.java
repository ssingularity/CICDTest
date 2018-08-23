package com.example.cicdtest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {
    @RequestMapping("/Test")
    public String test(){
        return "hello world";
    }
}
