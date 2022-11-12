package com.example.Controller;



import com.example.entity.User;
import com.example.form.UserForm;
import com.example.service.DummyService;
import com.example.service.inter.UserServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@Controller
//@RequestMapping("/users")
public class UserController {
    @Autowired
    private UserServiceInter userService;
//    @RequestMapping(method = RequestMethod.GET,value = "/users")
//    public String index (HttpServletRequest request){
//        String name =request.getParameter("name");
//        String surname=request.getParameter("surname");
//        String nationalityIdStr=request.getParameter(("nid"));
//        Integer nationalityId=null;
//        if(nationalityIdStr!=null && !nationalityIdStr.trim().isEmpty()){
//            nationalityId=Integer.parseInt(nationalityIdStr);
//        }
//        List<User> list =userService.getAll(name,surname,nationalityId);
//        request.setAttribute("list",list);
//        return "usersJ";
//    }

//
//    @RequestMapping (method = RequestMethod.GET,value = "/usersm2")
//    public ModelAndView indexm (@ModelAttribute("user")UserForm u){
//        List<User>list=null;
//        if(u!=null) {
//            ModelAndView mv = new ModelAndView("users");
//            list=userService.getAll(u.getName(),u.getSurname(),u.getNationalityId());
//        }else{
//            list=userService.getAll(null,null,null);
//        }
//       ModelAndView mv=new ModelAndView("users");
//        mv.addObject("list",list);
//        return mv;
//    }
@RequestMapping (method = RequestMethod.GET,value = "/users")
public ModelAndView index (@RequestParam (value = "name",required = false) String name,
                           @RequestParam(value ="surname",required = false) String surname,
                           @RequestParam(value = "nid",required = false)Integer nationalityId){
    List<User>list=userService.getAll(name,surname,nationalityId);
    ModelAndView mv=new ModelAndView("users");
//    mv.addObject("user",new UserForm()); asagida obyekt yaranir
    mv.addObject("users",list);

    return mv;
}
@RequestMapping(method = RequestMethod.GET, value = "/usersm")
public ModelAndView indexM(@Valid @ModelAttribute("user")
                           UserForm u, BindingResult bindingResult) {
    ModelAndView mv = new ModelAndView("users");
    if(bindingResult.hasErrors()){
        return  mv;
    }
    List<User> list = userService.getAll(u.getName(), u.getSurname(), u.getNationalityId());
    mv.addObject("users", list);
    return mv;
}
    @RequestMapping (method = {RequestMethod.GET},value = "/login")
    public String loginPost(){

        return "login";
    }
    @RequestMapping (method = {RequestMethod.GET},value = "/logout")
    public String logoutPage(){

        return "logout";
    }
    @Autowired
    DummyService dummyService;

    @RequestMapping(method = {RequestMethod.GET}, value = "/foo")
    public String foo() {
        System.out.println("foo in controller");
        dummyService.foo();
        return "users";
    }
    @ModelAttribute ("user")
    public UserForm getEmptyUserForm (){

        return new UserForm(null,null,null);
    }


}
