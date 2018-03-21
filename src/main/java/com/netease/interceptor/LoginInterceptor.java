package com.netease.interceptor;

import com.netease.model.PerRequestUserHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author zhanglbjames@163.com
 * @version Created on 18-3-19.
 *
 * 对需要登陆的页面进行拦截，没有登陆引导登陆
 */

@Component
public class LoginInterceptor implements HandlerInterceptor{

    @Autowired
    private PerRequestUserHolder localUserHolder;
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest,
                             HttpServletResponse httpServletResponse,
                             Object o) throws Exception {

        if (localUserHolder.getLocalUser() == null) {
            // 引导到登陆页面(Method.get)，并保存请求之前的跳转链接地址
            httpServletResponse.sendRedirect("/login?returnUrl="+httpServletRequest.getRequestURI());
            return false;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest,
                           HttpServletResponse httpServletResponse,
                           Object o, ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest,
                                HttpServletResponse httpServletResponse,
                                Object o, Exception e) throws Exception {
    }
}
