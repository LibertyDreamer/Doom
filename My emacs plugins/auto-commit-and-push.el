


(defvar auto-commit-directories '("/home/nikita/org-roam/")
  "List of directories where changes should be auto-committed.")


(defun auto-commit-after-save ()
  "Automatically commit and push changes after saving a file."
  (interactive)
  (when (and buffer-file-name
             (member (file-name-directory (buffer-file-name)) auto-commit-directories))
    (let ((default-directory (magit-toplevel)))
      (when default-directory
        (dolist (file (directory-files default-directory))
          (when (file-regular-p file)
            (magit-stage-file file)))
        (magit-commit-create (list "-m" "Auto-commit on save"))
        (magit-push-current-to-upstream nil)))))

(add-hook 'after-save-hook 'auto-commit-after-save)
