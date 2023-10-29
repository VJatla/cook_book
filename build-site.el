;; Load the publishing system
(require 'ox-publish)

;; Customize the HTML output
(setq org-html-validation-link nil            ;; Don't show validation link
      org-html-head-include-scripts nil       ;; Use our own scripts
      org-html-head-include-default-style nil ;; Use our own styles
      org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />")

;; Define the publishing project
(setq org-publish-project-alist
      (list
       (list "org-site:main"
             :recursive t
             :base-directory "./content"
	     :base-extension "any"
             :publishing-function 'org-html-export-to-html
             :publishing-directory "./public"
             :with-author nil           ;; Don't include author name
             :with-creator t            ;; Include Emacs and Org versions in footer
             :with-toc t                ;; Include a table of contents
             :section-numbers nil       ;; Don't include section numbers
             :time-stamp-file nil)
       (list "org-site:images"
	     :recursive t
	     :base-directory "./content"
	     :base-extension "png\\|jpg\\|jpeg"
	     :publishing-directory "./public"
	     :publishing-function 'org-publish-attachment
	     )

       ))    ;; Don't include time stamp in file

;; Generate the site output
(org-publish-all t)

(message "Build complete!")