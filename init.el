;(print "OK")
(require 'package)
;(require 'auto-complete)
;(require 'org-ref)

;(require 'racket-mode)
(require 'recentf)
(require 'cl)           ;; common-lisp functions

(require 'saveplace)     ;; When you visit a file, point goes to the
                         ;; last place where it was when you
                         ;; previously visited the same file.

(require 'ffap)          ;; find-file-at-point

(require 'uniquify)      ;; overrides Emacs' default mechanism for
                         ;; making buffer names unique (using suffixes
                         ;; like <2>, <3> etc.) with a more sensible
                         ;; behaviour which use parts of the file
                         ;; names to make the buffer names
                         ;; distinguishable.

(require 'ansi-color)    ;; translates ANSI SGR (Select Graphic
                         ;; Rendition) escape sequences like "Esc [ 30
                         ;; m" into EmacsOverlays, TextProperties, or
                         ;; XEmacsExtents with face colours, bold,
                         ;; etc.
						 
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives 
             '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives 
             '("gnu" . "http://elpa.gnu.org/packages/") t)
(package-initialize)			 

(add-to-list 'load-path "~/.emacs.d/elpa")

;; diminish keeps the modeline tidy
(require 'diminish)

;; sensible undo
(require 'undo-tree)
(global-undo-tree-mode)
(diminish 'undo-tree-mode)

;; disable auto-fill
(auto-fill-mode -1)

;(require 'words)

;; hide details in dired
;
(setq dired-details-hidden-string "")


(require 'dired-details+)
(require 'common-lisp-snippets)
;(require 'ein)
;(require 'ein-loaddefs)
;(require 'ein-notebook)
;(require 'ein-subpackages)
;(elpy-enable)
(advice-add 'python-mode :before 'elpy-enable)
;(latex-preview-pane-enable)
;(add-hook 'LaTeX-mode-hook 'latex-preview-pane-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-command-list
   (quote
    (("TeX" "%(PDF)%(tex) %(file-line-error) %`%(extraopts) %S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
      (plain-tex-mode texinfo-mode ams-tex-mode)
      :help "Run plain TeX")
     ("LaTeX" "%`%l --enable-write18 %(mode)%' %T" TeX-run-TeX nil
      (latex-mode doctex-mode)
      :help "Run LaTeX")
     ("Makeinfo" "makeinfo %(extraopts) %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with Info output")
     ("Makeinfo HTML" "makeinfo %(extraopts) --html %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with HTML output")
     ("AmSTeX" "amstex %(PDFout) %`%(extraopts) %S%(mode)%' %t" TeX-run-TeX nil
      (ams-tex-mode)
      :help "Run AMSTeX")
     ("ConTeXt" "%(cntxcom) --once --texutil %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt once")
     ("ConTeXt Full" "%(cntxcom) %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt until completion")
     ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX")
     ("Biber" "biber %s" TeX-run-Biber nil t :help "Run Biber")
     ("View" "%V" TeX-run-discard-or-function t t :help "Run Viewer")
     ("Print" "%p" TeX-run-command t t :help "Print the file")
     ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command)
     ("File" "%(o?)dvips %d -o %f " TeX-run-dvips t t :help "Generate PostScript file")
     ("Dvips" "%(o?)dvips %d -o %f " TeX-run-dvips nil t :help "Convert DVI file to PostScript")
     ("Dvipdfmx" "dvipdfmx %d" TeX-run-dvipdfmx nil t :help "Convert DVI file to PDF with dvipdfmx")
     ("Ps2pdf" "ps2pdf %f" TeX-run-ps2pdf nil t :help "Convert PostScript file to PDF")
     ("Glossaries" "makeglossaries %s" TeX-run-command nil t :help "Run makeglossaries to create glossary file")
     ("Index" "makeindex %s" TeX-run-index nil t :help "Run makeindex to create index file")
     ("upMendex" "upmendex %s" TeX-run-index t t :help "Run upmendex to create index file")
     ("Xindy" "texindy %s" TeX-run-command nil t :help "Run xindy to create index file")
     ("Check" "lacheck %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for correctness")
     ("ChkTeX" "chktex -v6 %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for common mistakes")
     ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document")
     ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files")
     ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files")
     ("Other" "" TeX-run-command t t :help "Run an arbitrary command"))))
 '(custom-safe-themes
   (quote
    ("c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "43b219a31db8fddfdc8fdbfdbd97e3d64c09c1c9fdd5dff83f3ffc2ddb8f0ba0" default)))
 '(package-selected-packages
   (quote
    (elpygen yaxception test-simple pyvenv pythonic popup parsebib paredit org matlab-mode macrostep log4e loc-changes load-relative julia-mode highlight-indentation gntp find-file-in-project eval-in-repl ess dash-functional company biblio-core biblio avy auto-complete-pcmp auto-complete async alert ace-window ample-theme blackboard-theme helm-themes helm helm-core aggressive-indent elfeed bookmark+ button-lock git-messenger git-timemachine key-chord use-package ace-isearch ace-jump-mode rainbow-mode ht jedi-direx python-mode pydoc elpy helm-projectile projectile lispy eimp nlinum diminish undo-tree auctex magit yasnippet dired-details+ dired-details smex ido-ubiquitous flx-ido org-ref s f dash ob-ipython org-plus-contrib org-time-budgets orgtbl-join orgtbl-aggregate org-edit-latex org-doing org-dashboard org-beautify-theme org-ac org-babel-eval-in-repl slime jedi realgud anaconda-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;; Default workign directory
(setq default-directory "~/Documents")

(setq racket-racket-program "C:/Program Files/Racket/racket.exe")
(setq racket-raco-program "C:/Program Files/Racket/raco.exe")

(setq python-shell-interpreter "ipython"
    python-shell-interpreter-args "-i")
	
;; Setup Slime
(require 'slime-autoloads)
(add-to-list 'exec-path "C:/Program Files/Steel Bank Common Lisp/1.3.18/sbcl.exe")
(setq inferior-lisp-program "sbcl")
(setq slime-contribs '(slime-fancy slime-asdf))

(defun slime-tab ()
   "slime-mode tab dwim, either indent, complete symbol or yas/expand"
   (interactive)
   (let ((r (slime-indent-and-complete-symbol)))
      (unless re
	     (yas/expand))))

(defadvice ac-fallback-command (around no-yasnippet-fallback activate)
   (let ((yas-fallback-behaviour nil))
      ad-do-it))
	  
(defun my-slime-mode-hook ()
   (interactive)
   (define-key slime-mode-map (kbd "<tab>")
     'slime-tab))
	 
(add-hook 'slime-mode-hook 'my-slime-mode-hook)

(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

(require 'common-lisp-snippets)

;; set the frame title to show file names
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

(setq inhibit-startup-screen t) ;; stop showing startup screen
(tool-bar-mode 0)           ; remove the icons
(menu-bar-mode 1)           ; keep the menus
(global-visual-line-mode 1) ;; how long lines are handled.  This
                            ;; appears to wrap long lines visually,
                            ;; but not add line-returns
(show-paren-mode 1)         ;; highlight parentheses
(setq show-paren-style 'mixed) ;; alternative is 'expression, 'parenthesis or 'mixed

(line-number-mode 1)  ;; turn linumbers on in mode-line

(setq backup-inhibited t)  ;; disable backup file creation
(require 'recentf)
(setq recentf-max-saved-items 200
      recentf-max-menu-items 15)
(recentf-mode +1)
(global-set-key (kbd "<f7>") 'helm-recentf)
;; Setup Jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t) 

(eval-after-load "python"
  '(define-key python-mode-map "\C-cx" 'jedi-direx:pop-to-buffer))
(add-hook 'jedi-mode-hook 'jedi-direx:setup)

(setq elpy-rpc-backend "jedi")  

;;; Google Python function docstring snippet
(defun python-args-to-google-docstring (text &optional make-fields)
  "Return a reST docstring format for the python arguments in yas-text."
  (let* ((indent (concat "\n" (make-string (current-column) 32)))
         (args (python-split-args text))
         (nr 0)
         (formatted-args
		  (mapconcat
		   (lambda (x)
			 (concat "   " (nth 0 x)
				 (if make-fields (format " ${%d:arg%d}" (+ nr 1) nr))
				 (if (nth 1 x) (concat " \(default " (nth 1 x) "\)"))))
		   args
		   indent)))
    (unless (string= formatted-args "")
      (concat
       (mapconcat 'identity
          (list "" "Args:" formatted-args)
          indent)
       "\n"))))
	   
(setq helm-command-prefix-key "C-c h")
(require 'helm)
(require 'helm-config)
(require 'helm-eshell)
(require 'helm-files)
(require 'helm-grep)

;; (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
					; rebind tab to do persistent action
;; (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
					; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(define-key helm-grep-mode-map (kbd "<return>")  'helm-grep-mode-jump-other-window)
(define-key helm-grep-mode-map (kbd "n")  'helm-grep-mode-jump-other-window-forward)
(define-key helm-grep-mode-map (kbd "p") 'helm-grep-mode-jump-other-window-backward)

(define-key helm-map (kbd "C-x 2") 'helm-select-2nd-action)
(define-key helm-map (kbd "C-x 3") 'helm-select-3rd-action)
(define-key helm-map (kbd "C-x 4") 'helm-select-4rd-action)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
;(print "OK")
(global-set-key (kbd "C-x b") 'helm-mini)
;(print "OK ")
(global-set-key (kbd "C-x r l") 'helm-bookmarks)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c h s") 'helm-semantic-or-imenu)
(global-set-key (kbd "C-c h m") 'helm-man-woman)
(global-set-key (kbd "C-c h f") 'helm-find)
(global-set-key (kbd "C-c h l") 'helm-locate)
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key (kbd "C-c h r") 'helm-resume)
(global-set-key (kbd "C-c m") 'helm-all-mark-rings)

(define-key 'help-command (kbd "C-f") 'helm-apropos)
(define-key 'help-command (kbd "r") 'helm-info-emacs)

(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)

;; use helm to list eshell history
(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map (kbd "M-l")  'helm-eshell-history)))

  ;;; Save current position to mark ring
(add-hook 'helm-goto-line-before-hook 'helm-save-current-pos-to-mark-ring)

;; * helm extensions
;; add some useful functions to helm-find-files

(defun helm-attach-to-email (candidate)
  (mml-attach-file candidate))

(defun helm-find-files-insert-path (target)
  "Insert relative path to TARGET."
  (insert (file-relative-name target)))


(defun helm-find-files-insert-absolute-path (target)
  "Insert absolute path to TARGET."
  (insert (expand-file-name target)))


(add-hook 'helm-find-files-before-init-hook
          (lambda ()

	    (helm-add-action-to-source
	     "Insert path"
	     'helm-find-files-insert-path
	     helm-source-find-files)

	    (helm-add-action-to-source
	     "Insert absolute path"
	     'helm-find-files-insert-absolute-path
	     helm-source-find-files)

	    (helm-add-action-to-source
	     "Attach file to email"
	     'helm-attach-to-email helm-source-find-files)

	    (helm-add-action-to-source
	     "Make directory"
	     (lambda (target)
	       (make-directory target))
	     helm-source-find-files)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun package-upgrade-all ()
  "Upgrade all packages automatically without showing *Packages* buffer."
  (interactive)
  (package-refresh-contents)
  (let (upgrades)
    (cl-flet ((get-version (name where)
                (let ((pkg (cadr (assq name where))))
                  (when pkg
                    (package-desc-version pkg)))))
      (dolist (package (mapcar #'car package-alist))
        (let ((in-archive (get-version package package-archive-contents)))
          (when (and in-archive
                     (version-list-< (get-version package package-alist)
                                     in-archive))
            (push (cadr (assq package package-archive-contents))
                  upgrades)))))
    (if upgrades
        (when (yes-or-no-p
               (message "Upgrade %d package%s (%s)? "
                        (length upgrades)
                        (if (= (length upgrades) 1) "" "s")
                        (mapconcat #'package-desc-full-name upgrades ", ")))
          (save-window-excursion
            (dolist (package-desc upgrades)
              (let ((old-package (cadr (assq (package-desc-name package-desc)
                                             package-alist))))
                (package-install package-desc)
                (package-delete  old-package)))))
      (message "All packages are up to date"))))

;;; Org babel
(with-eval-after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     (lisp . t)
	 (ipython . t))))
	 
;; Usage
;(with-eval-after-load "ob"
;  (require 'org-babel-eval-in-repl)
;  (define-key org-mode-map (kbd "C-<return>") 'ober-eval-in-repl)
;  (define-key org-mode-map (kbd "C-c C-c") 'ober-eval-block-in-repl))

;; Recommended config (optional):
;(with-eval-after-load "eval-in-repl"
;  (setq eir-jump-after-eval nil))

	  
;; set i(a)spell options on different machines
;(setq ispell-personal-dictionary (concat starter-kit-dir "user/.ispell"))

;; adjust this path if it is not where aspell got installed
(setq-default ispell-program-name "C:/Program Files (x86)/Aspell/bin/aspell.exe")

;(setq org-latex-prefer-user-labels t)

(global-auto-complete-mode t)
(add-to-list 'ac-modes 'python-mode)
(add-to-list 'ac-modes 'latex-mode)
(add-to-list 'ac-modes 'lisp-mode)
(load-theme 'blackboard t)
(yas-global-mode 1)
(setq-default buffer-file-coding-system 'utf-8)
(set-language-environment "UTF-8")
