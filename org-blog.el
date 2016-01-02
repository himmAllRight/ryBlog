(require 'org)
;; publish trunk
(setq source-trunk "/home.himmelwright.net#1734:/home/ryan/Network/ryanSiteContent/source")
(setq publish-trunk "/home.himmelwright.net#1734:/usr/share/nginx/www")

;; All image conversion
(setq org-html-inline-images t)

(setq piwik-tracking-code
      "<!-- Piwik -->
<script type=\"text/javascript\">
  var _paq = _paq || [];
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
    var u=\"//himmelwright.net/piwik/\";
    _paq.push(['setTrackerUrl', u+'piwik.php']);
    _paq.push(['setSiteId', 2]);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
  })();
</script>
<noscript><p><img src=\"//himmelwright.net/piwik/piwik.php?idsite=2\" style=\"border:0;\" alt=\"\" /></p></noscript>
<!-- End Piwik Code -->")

(setq ryan-website-html-head
      (format
       "<link rel=\"stylesheet\" href=\"./css/stylesheet.css\" type=\"text/css\"/>
%s"
       piwik-tracking-code))

(setq ryan-website-blog-html-head
      "<link rel=\"stylesheet\" href=\"../css/stylesheet.css\" type=\"text/css\"/>")

(setq ryan-website-navigation
      "<div class='nav'>
      <ul>
      <li><a href='/'>Home</a></li>
      <li><a href='/blog/index.html'>Blog</a></li>
      <li><a href='/homelab.html'>Homelab</a></li>
      <li><a href='https://github.com/himmelwr'>Github</a></li>
      <li><a href='https://twitter.com/himmAllRight17'>Twitter</a></li>
      </ul>
      </div>")

(setq ryan-website-preamble
      (format "<img src=\"./images/avatar.jpg\" height=\"200px\" width=\"200px\">
%s" ryan-website-navigation))


(setq ryan-website-blog-preamble
      (format "<img src=\"../images/avatar.jpg\" height=\"200px\" width=\"200px\">
%s" ryan-website-navigation))

(setq ryan-website-footer
      "<div class='footer'>
Copyright 2015 %a (%v HTML).<br>
Last updated %C. <br>
Built with %c.
</div>")

(setq ryan-website-blog-postamble
      (format "<i>(Return to: <a href= '/'>Home</a> | <a href='/blog/index.html'>Blog Index</a>)</i>
%s" ryan-website-footer))


(setq org-publish-project-alist
      `(("www-pages"
	 :base-directory ,source-trunk
	 :base-extension "org"
	 :recursive t
	 :publishing-directory ,(concatenate 'string publish-trunk "")
	 :publishing-function org-html-publish-to-html

	 :with-author t
	 :with-creator nil
	 :headline-level 4
	 :section-numbers nil

	 :with-toc nil
	 :with-drawers t

	 :html-link-home "/"
	 :html-head ,ryan-website-html-head
	 :html-preamble ,ryan-website-preamble
	 :html-postamble ,ryan-website-footer
	 )
	("blog"
	 :base-directory ,(concatenate 'string source-trunk "/blog")
	 :base-extension "org"
	 :recursive t
	 ;;	 :publishing-directory "/home/ryan/Network/org-blog/output/blog"
	 :publishing-directory ,(concatenate 'string publish-trunk "/blog")
	 :publishing-function org-html-publish-to-html
	 :with-author t
	 :with-creator nil
	 :headline-level 4
	 :section-numbers nil
	 :with-toc nil
	 :with-drawers t
	 :html-link-home "/"
	 :html-preamble ,ryan-website-blog-preamble
	 :html-postamble ,ryan-website-blog-postamble
	 :html-head ,ryan-website-blog-html-head)
	("images"
	 :base-directory ,(concatenate 'string source-trunk "/images")
	 :base-extension "jpg\\|gif\\|png"
	 :recursive t
	 ;;	 :publishing-directory "/home/ryan/Network/org-blog/output/images"
 	 :publishing-directory ,(concatenate 'string publish-trunk "/images")
	 :publishing-function org-publish-attachment
	 :html-link-home "/"
	 )	
	("css"
	 :base-directory ,(concatenate 'string source-trunk "/css")
	 :base-extension "css"
	 :recursive t
	 ;;	 :publishing-directory "/home/ryan/Network/org-blog/output/css"
 	 :publishing-directory ,(concatenate 'string publish-trunk "/css")
	 :publishing-function org-publish-attachment
	 :html-link-home "/"
	 )
	;;	("rss"
	;;	 :base-directory "/home/ryan/Network/org-blog/source/blog"
	;;	 :base-extension "org"
	;;	 :recursive t
	;;	 :publishing-directory "/home/ryan/Network/org-blog/output/blog"
	;;	 :publishing-function 'toadd
	;;	 :html-link-home "/"
	;;	 )
	("website"
	 :components ("www-pages" "blog" "images" "css"))))


(setf user-full-name "Ryan Himmelwright")
(setf user-mail-address "ryan.himmelwright@gmail.com")

(org-publish "website" t)

