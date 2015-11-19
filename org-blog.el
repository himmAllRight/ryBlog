(require 'org)

(setq ryan-website-html-head
  "<link rel=\"stylesheet\" href=\"./css/stylesheet.css\" type=\"text/css\"/>")

(setq ryan-website-blog-html-head
  "<link rel=\"stylesheet\" href=\"../css/stylesheet.css\" type=\"text/css\"/>")

(setq ryan-website-postamble
  "<div class='footer'>
Copyright 2015 %a (%v HTML).<br>
Last updated %C. <br>
Built with %c.
</div>")

(message ryan-website-blog-html-head)

(setq org-publish-project-alist
      `(("www-pages"
	 :base-directory "/home/ryan/Network/org-blog/source"
	 :base-extension "org"
	 :recursive t
	 :publishing-directory "/home/ryan/Network/org-blog/output"
	 :publishing-function org-html-publish-to-html

	 :with-author t
	 :with-creator nil
	 :headline-level 4
	 :section-numbers nil

	 :with-toc nil
	 :with-drawers t

	 :html-link-home "/"
	 :html-head ,ryan-website-html-head
	 :html-postamble ,ryan-website-postamble
	 )
	("blog"
	 :base-directory "/home/ryan/Network/org-blog/source/blog"
	 :base-extension "org"
	 :recursive t
	 :publishing-directory "/home/ryan/Network/org-blog/output/blog"
	 :publishing-function org-html-publish-to-html
	 :with-author t
	 :with-creator nil
	 :headline-level 4
	 :section-numbers nil
	 :with-toc nil
	 :with-drawers t
	 :html-link-home "/"
	 :html-postamble ryan-website-postamble
	 :html-head ,ryan-website-blog-html-head)
	("images"
	 :base-directory "/home/ryan/Network/org-blog/source/images"
	 :base-extension "jpg\\|gif\\|png"
	 :recursive t
	 :publishing-directory "/home/ryan/Network/org-blog/output/images"
	 :publishing-function org-publish-attachment
	 :html-link-home "/"
	 )	
	("css"
	 :base-directory "/home/ryan/Network/org-blog/source/css"
	 :base-extension "css"
	 :recursive t
	 :publishing-directory "/home/ryan/Network/org-blog/output/css"
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

