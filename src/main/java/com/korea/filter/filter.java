package com.korea.filter;

import javax.servlet.*;
import java.io.IOException;

public class filter implements Filter
{
    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException
    {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        chain.doFilter(req, resp);

    }
}
