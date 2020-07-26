package demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DemoController {
    @GetMapping("/")
    public String homePage() {
        return "home";
    }

    @GetMapping("/manager")
    public String leadersPage() {
        return "manager";
    }

    @GetMapping("/admin")
    public String systemsPage() {
        return "admin";
    }
}
