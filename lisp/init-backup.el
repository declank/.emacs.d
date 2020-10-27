
;; Disable the creation of lock files
(setq create-lockfiles nil)

;; Based on https://emacs.stackexchange.com/a/36
(let ((backup-directory (concat user-emacs-directory "backups/"))
      (auto-save-directory (concat user-emacs-directory "auto-save/")))
  (dolist (dir (list backup-directory auto-save-directory))
    (when (not (file-directory-p dir))
      (make-directory dir t)))
  (setq backup-directory-alist `(("." . ,backup-directory))
	auto-save-file-name-transforms `((".*" ,auto-save-directory t))
	auto-save-list-file-prefix (concat auto-save-directory ".saves-")
	tramp-backup-directory-alist `((".*" . ,backup-directory))
	tramp-auto-save-directory auto-save-directory))

(setq backup-by-copying t
      delete-old-versions t
      version-control t
      kept-new-versions 5
      kept-old-versions 3)

(provide 'init-backup)
