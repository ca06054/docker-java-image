package com.docker.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api")
public class HelloController {

@GetMapping("/hello/{pais}")
    public String helloPais(@PathVariable("pais") String pais){
    return "Hello "+ pais;
}


}
