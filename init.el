
;;; TODO items:
;; Remove backups and autosave

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking)

(defun require-package (package)
  "Ensures that PACKAGE is installed."
  (unless (or (package-installed-p package)
	      (require package nil 'noerror))
    (unless (assoc package package-archive-contents)
      (package-refresh-contents))
    (package-install package)))


(let ((gc-cons-threshold (* 256 1024 1024)))
  ;; Set custom file
  (setq custom-file (expand-file-name "custom.el" user-emacs-directory))

  ;; Disable GUI features
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (menu-bar-mode -1)
  (setq ring-bell-function 'ignore)

  (column-number-mode t)
  (global-display-line-numbers-mode 'relative)

  ;; Package management - MELPA
  (require 'package)
  (add-to-list 'package-archives
    '("melpa" . "https://melpa.org/packages/") t)
  (setq package-enable-at-startup nil)
  (package-initialize)

  ;; Init modules
  (require 'init-backup)
  (require 'init-company)
  (require 'init-markdown)
  (require 'init-modeline)
  (require 'init-smex)

  ;; Misc. key binding changes
  (global-set-key (kbd "C-x C-b") 'ibuffer)  
  
  ;; After initialising, load the custom file
  (when (file-exists-p custom-file)
    (load custom-file))

)

;; Set the garbage collector limit to 64MB - much higher than 0.7MB default
(setq gc-cons-threshold (* 64 1024 1024))

  
