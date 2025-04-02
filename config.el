(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(use-package! org-modern)
(use-package! undo-tree)


(cua-mode +1)

;;(minimap-mode t)

(treemacs)

(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))
(global-undo-tree-mode)

(global-visual-line-mode 1)
(add-hook 'treemacs-mode-hook (lambda () (visual-line-mode -1)))
(setq visual-line-fringe-indicators '(left-curly-arrow))
(after! treemacs
  (setq treemacs-show-hidden-files t))



(setq nyan-animate-nyancat t)
(setq nyan-wavy-trail t)
(nyan-mode)


(global-org-modern-mode)


(setcdr (assq t org-file-apps-gnu) 'browse-url-xdg-open)


(global-display-fill-column-indicator-mode)
(auto-fill-mode)


(org-babel-do-load-languages 'org-babel-load-languages '((python . t)))

(require 'org-download) ;; TODO: later.
(require 'openwith)
;; org super agenda
;; org timeblockx
