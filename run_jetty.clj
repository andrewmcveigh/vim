(use 'clojure.java.io)
(import [org.eclipse.jetty.server Server Request]
        [org.eclipse.jetty.server.handler AbstractHandler]
        [org.eclipse.jetty.server.nio SelectChannelConnector]
        [org.eclipse.jetty.server.ssl SslSelectChannelConnector]
        [org.eclipse.jetty.util.thread QueuedThreadPool]
        [org.eclipse.jetty.util.ssl SslContextFactory]
        [org.eclipse.jetty.servlet ServletHolder]
        [javax.servlet.http HttpServletRequest HttpServletResponse]
        [org.eclipse.jetty.util.resource Resource]
        [org.eclipse.jetty.webapp WebAppContext WebAppClassLoader])

(defonce server (Server. 8080))

(let [path    (str "src/" (if (.exists (as-file "src/test/webapp")) "test" "main") "/webapp")
      context (WebAppContext. path "/")
      web-inf (as-file (str path "/WEB-INF"))
      lib     (as-file (str web-inf "/lib"))
      cloader (WebAppClassLoader. context)]
  (doseq [x     (seq (.getURLs (java.lang.ClassLoader/getSystemClassLoader)))
          :let  [file     (as-file x)
                 resource (Resource/newResource file)
                 filename (.getName file)]
          :when (.endsWith filename ".jar")]
    (.addJars cloader resource))
  (.setClassLoader context cloader)
  (doto server
    (.stop)
    (.setHandler (doto context
                   (.addServlet
                     (ServletHolder.
                       (proxy [javax.servlet.http.HttpServlet] []
                         (service [request response]
                           ((ring.util.servlet/make-service-method (var app))
                              this request response))))
                     "/*")))
    (.start)))
