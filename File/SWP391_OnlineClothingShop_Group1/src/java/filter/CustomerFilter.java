package filter;

import entity.Users;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author Duy Manh
 */
public class CustomerFilter implements Filter {

    private static final boolean debug = true;

    /**
     * The filter configuration object we are associated with, if this value is
     * null, this filter instance is not currently configured.
     */
    private FilterConfig filterConfig = null;

    public CustomerFilter() {
    }

    /**
     * The doFilter method called by the container each time a request/response
     * pair is passed through the chain due to a client request for a resource
     * at the end of the chain.
     *
     * @param request The servlet request we are processing. It is a
     * <code> jakarta.servlet.http.HttpServletRequest</code>
     * @param response The servlet response we are creating. It is a
     * <code> jakarta.servlet.http.HttpServletResponse</code>
     * @param chain The filter chain we are processing. The FilterChain passed
     * in to this method allows the Filter to pass on the request and response
     * to the next entity in the chain.
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        if (debug) {
            log("RoleFilter:doFilter()");
        }

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession();
        String url = httpRequest.getRequestURI();
        Users u = (Users) session.getAttribute("user");

        try {
            if (u==null || u.getRoleID() !=1 && url.endsWith("CustomerServlet?action=List")) {
                {
                    httpResponse.sendRedirect("invalid-role.jsp");
                }
            } else {
                chain.doFilter(request, response);
            }
        } catch (IOException | ServletException t) {
            httpResponse.sendRedirect("login");
        }

    }

    /**
     * Get the filter configuration object for this filter
     *
     * @return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    @Override
    public void destroy() {
    }

    /**
     * This method initializes a filter
     *
     * @param filterConfig
     */
    @Override
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("RoleFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("RoleFilter()");
        }
        StringBuilder sb = new StringBuilder("RoleFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    /**
     * Prints error if error occurred
     *
     * @param t error throwable
     * @param response current response. It is a
     * <code> jakarta.servlet.http.HttpServletResponse</code>
     */
    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                try (PrintStream ps = new PrintStream(response.getOutputStream()); PrintWriter pw = new PrintWriter(ps)) {
                    pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                    // PENDING! Localize this for next official release
                    pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                    pw.print(stackTrace);
                    pw.print("</pre></body>\n</html>"); //NOI18N
                }
                response.getOutputStream().close();
            } catch (IOException ex) {
            }
        } else {
            try {
                try (PrintStream ps = new PrintStream(response.getOutputStream())) {
                    t.printStackTrace(ps);
                }
                response.getOutputStream().close();
            } catch (IOException ex) {
            }
        }
    }

    /**
     * Get stack trace of throwable
     *
     * @param t throwable to get stack trace
     * @return string representation of stack trace
     */
    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (IOException ex) {
        }
        return stackTrace;
    }

    /**
     * Print message to log
     *
     * @param msg message to print
     */
    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
