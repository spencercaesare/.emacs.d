;; Some commands to adjust the GUI of Emacs on MacOS

(global-display-line-numbers-mode) ; Show line numbers
(scroll-bar-mode -1) ; Disable visible scrollbar
(tool-bar-mode -1) ; Disable toolbar
(tooltip-mode -1) ; Disable tooltips

(menu-bar-mode -1) ; Disable the menu bar

(setq inhibit-startup-message t) ; Disable the startup welcome screen





;; Org-Mode settings

(global-set-key (kbd "C-c l") #'org-store-link) ; Some Org-Mode keybindings
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(require 'org) ; Require the availability of org-mode in emacs
(define-key global-map "\C-cl" 'org-store-link) ; Bind C-c l to store an org-mode link
(define-key global-map "\C-ca" 'org-agenda) ; Bind C-c a to open the org-agenda
(setq org-log-done t) ; Show a timestamp when completing and org-mode todo task

(setq org-agenda-files (list "~/org")) ; Set the agenda files as listed

(setq initial-buffer-choice "~/org/journal.org") ; Make emacs open my journal on startup

;; Create custom templates and keybindings for org-mode quick capture
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/inbox.org" "Tasks") ; Create a Todo quick capture that saves in inbox.org
         "* TODO %?\n %U\n %i\n")
	("n" "Note" entry (file+datetree "~/org/notes.org") ; Create a Note quick capture that saves in notes.org
         "* %?\nEntered on %U\n  %i\n")))

;; For task time-logging
(setq org-clock-persist 'history) ; Make the time-tracking persist across the usage of emacs
(org-clock-persistence-insinuate)




;; Set up MELPA

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)






;; Theme section
(load-theme 'gruvbox-dark-medium t)



;; Enable org-superstar extension
(unless (package-installed-p 'org-superstar)
  (package-install 'org-superstar))

(require 'org-superstar)
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
(org-superstar-configure-like-org-bullets) ; Make org-superstar look like the original org-bullets extension
(setq org-superstar-special-todo-items t) ; Make Todo items have a special check-box



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("4eb6fa2ee436e943b168a0cd8eab11afc0752aebb5d974bba2b2ddc8910fca8f" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
