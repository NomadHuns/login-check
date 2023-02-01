package shop.mtcoding.ajax.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import shop.mtcoding.ajax.dto.ResponseDto;

@Controller
public class UserController {

    @GetMapping("/joinForm")
    public String joinForm() {
        return "joinForm";
    }

    // 스프링은 200번대만 응답 (오류가 안된다면)
    @GetMapping("/user/usernameCheck")
    public @ResponseBody ResponseDto<?> usernameCheck(String username) {
        if (username == null || username.isEmpty()) {
            return new ResponseDto<>(-1, "username 쿼리스트링 전달 안됨", null);
        }
        if (username.equals("ssar")) {
            return new ResponseDto<>(1, "동일한 username 존재", false);
        } else {
            return new ResponseDto<>(1, "동일한 username 없음", true);
        }
    }
}
