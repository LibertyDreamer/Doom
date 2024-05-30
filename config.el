(use-package! websocket
    :after org-roam)




(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))


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


(nyan-mode)
(setq nyan-animate-nyancat t)
(setq nyan-wavy-trail t)

(org-roam-db-autosync-mode)

(global-org-modern-mode)

(setq telega-server-libs-prefix "/usr")

(setcdr (assq t org-file-apps-gnu) 'browse-url-xdg-open)

(setq telega-open-file-function 'org-open-file)

(global-display-fill-column-indicator-mode)
(auto-fill-mode)

(setq telega-sticker-size '(8 . 48))
