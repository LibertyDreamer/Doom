;;TODO change place where help shows when I point mouse to words in
;;source code I want to see pop-up message.

(defvar my-menu-items nil
  "List of menu items. Each item is a list of the form (MODES FUNCTION DESCRIPTION ARGUMENTS), where:
- MODES is a list of major modes for which the item should be shown, or the symbol 't' for all modes.
- FUNCTION is the function to call.
- DESCRIPTION is the text to show in the menu.
- ARGUMENTS is a list of arguments to pass to the function."
  )

(defun my-add-menu-item (modes function description &optional arguments)
  "Add a new item to the popup menu."
  (add-to-list 'my-menu-items (list modes function description arguments)))


(defun my-popup-menu (event)
  "Show a popup menu at EVENT."
  (interactive "e")

  (let ((menu-items (mapcar (lambda (item)
                              (let ((modes (nth 0 item))
                                    (function (nth 1 item))
                                    (description (nth 2 item))
                                    (arguments (nth 3 item)))
                                (when (or (eq modes 't)
                                          (memq major-mode modes))
                                  (cons description (cons function arguments)))))
                            my-menu-items)))

    (setq menu-items (delq nil menu-items))  ; Remove nil items
   ;; (when menu-items

      (command-execute (x-popup-menu event (list "My Menu" (cons "Commands" menu-items))))



      ))


(x-popup-menu
 t
 (list "What action?"
       (cons ""
             '(
               ("Copy here" . org-time-stamp)
               ("Move here" . move)
               ("Link here" . link)
               "--"
               ("Cancel" . a)))))

(command-execute 'org-time-stamp)

(global-set-key [mouse-3] 'my-popup-menu)


(my-add-menu-item '(org-mode) 'org-time-stamp "Insert Date")
(my-add-menu-item '(org-mode) 'org-id-get-create "Add Sub Item")
(my-add-menu-item '(emacs-lisp-mode) 'eval-buffer "Evaluate Buffer")
(my-add-menu-item 't 'save-buffer "Save Buffer")

(my-add-menu-item 't 'cua-cut-region "Cut")
(my-add-menu-item 't 'cua-paste "Paste")


(my-add-menu-item 't 'fill-region "Fill region")


(defun request-to-ai (open-ai-key request &optional information-for-ai-what-to-do-with-request)
  "Send request to AI and show respounce in pop-up window"
  (interactive "e")
  )
