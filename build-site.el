(require 'ox-publish)

(setq org-image-actual-width nil)
(setq org-html-validation-link nil)
(setq org-html-head-include-scripts nil)
(setq org-html-head-include-default-style nil)
(setq org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />")

(defun my/org-html-publish-to-html (plist filename pub-dir)
  "Publish an org file to HTML.
PLIST is the property list for the project.
FILENAME is the filename of the Org file to be published.
PUB-DIR is the publishing directory."
  (org-publish-org-to 'html filename
                      ".html" plist pub-dir))

(setq org-publish-project-alist
      (list
       (list "org-site:main"
             :recursive t
             :base-directory "./content"
             :base-extension "org"
             :publishing-function 'my/org-html-publish-to-html
             :publishing-directory "./public"
             :with-author nil
             :with-creator t
             :with-toc t
             :section-numbers nil
             :time-stamp-file nil)
       (list "org-site:images"
             :recursive t
             :base-directory "./content"
             :base-extension "png\\|jpg\\|jpeg"
             :publishing-directory "./public"
             :publishing-function 'org-publish-attachment
             )
       ))

(org-publish-all t)

(message "Build complete!")
