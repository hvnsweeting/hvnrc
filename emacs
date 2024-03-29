(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(require 'package)

(load-theme 'tango-dark t)
;; (add-to-list 'package-archives
;;       '("melpa" . "http://melpa.org/packages/") t)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    ein
    elpy
    evil
    flycheck
    material-theme
    elixir-mode
    alchemist
    neotree
    py-autopep8))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
;; (load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(require 'elixir-mode)
(require 'alchemist)
;(neotree-toggle)

;; PYTHON CONFIGURATION
;; --------------------------------------

(elpy-enable)
;; (elpy-use-ipython)
(setq python-shell-interpreter "/home/hvn/py3/bin/ipython"
      python-shell-interpreter-args "-i --simple-prompt")

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(add-hook 'after-init-hook 'global-company-mode)
;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
(pyvenv-activate "~/py3")
(require 'evil)
(evil-mode 1)

;;(projectile-mode +1)
;;(define-key projectile-mode-map (kbd "s-,") 'projectile-command-map)
;;(define-key projectile-mode-map [?\s-d] 'projectile-find-dir)
;;(define-key projectile-mode-map [?\s-p] 'projectile-switch-project)
;;(define-key projectile-mode-map [?\s-f] 'projectile-find-file)
;;(define-key projectile-mode-map [?\s-g] 'projectile-grep)


;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" default)))
 '(package-selected-packages
   (quote
    (paredit cider nim-mode neotree alchemist rope-read-mode geiser ## evil py-autopep8 material-theme flycheck elpy ein better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(show-paren-mode)