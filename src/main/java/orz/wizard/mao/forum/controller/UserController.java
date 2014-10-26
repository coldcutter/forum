package orz.wizard.mao.forum.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import orz.wizard.mao.forum.service.UserService;

@Controller
public class UserController {
    
    @Autowired
    private UserService userService;
    
    @RequestMapping(value = {"/show"}, method = RequestMethod.GET)
    public String showUser(Map<String, Object> model) {
        model.put("user", userService.getUser(1));
        return "show";
    }
    
    @RequestMapping(value = {"/login"})
    public String login(Map<String, Object> model) {
        System.out.println("login");
        return "login";
    }
}
