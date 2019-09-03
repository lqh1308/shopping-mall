package com.lqh.filter;

import com.lqh.base.ResponseBase;
import com.lqh.contants.Constans;
import com.lqh.feign.MemberServiceFeign;
import com.lqh.utils.CookieUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedHashMap;

@Component
public class LoginFilter implements Filter {

    @Autowired
    private MemberServiceFeign memberServiceFeign;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        String token = CookieUtil.getUid(request, Constans.COOKIE_MEMBER_TOKEN);
        ResponseBase responseBase = null;
        if(StringUtils.isEmpty(token)) {
            //直接返回成功
            request.setAttribute("isLogin", false);
            filterChain.doFilter(servletRequest, servletResponse);
        } else {
            //2.token不为空则获取用户信息
            responseBase =  memberServiceFeign.findByToken(token);
            if(!responseBase.getStatusCode().equals(Constans.HTTP_RES_CODE_200)) {
                request.setAttribute("error", "没有查找到用户信息！请重新登陆");
                filterChain.doFilter(servletRequest, servletResponse);
            }
            @SuppressWarnings("rawtypes")
            LinkedHashMap user = (LinkedHashMap) responseBase.getData();
            request.setAttribute("username", user.get("username"));
            request.setAttribute("isLogin", true);
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    @Override
    public void destroy() {

    }
}
