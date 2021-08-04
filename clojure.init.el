(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

;; add clojure packages
(defvar my-packages '(better-defaults 
                      clojure-mode 
                      cider
                      projectile
                      company
                      smartparens
                      rainbow-delimiters
                      aggressive-indent
                      which-key))

(dolist (p my-packages) (unless (package-installed-p p) (package-install p)))

;; which-key
(require 'which-key)
(which-key-mode)

;; projectile keybinding
(require 'projectile)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)

;; use Shift-arrow keys to move between windows
(windmove-default-keybindings)

;; smooth keyboard scrolling
(setq scroll-step 1) 
(setq column-number-mode t)

;; set font
(set-frame-font "Inconsolata-16")

;; clojure editing tweaks
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)
(define-key smartparens-mode-map (kbd "M-(") 'sp-wrap-round)
(define-key smartparens-mode-map (kbd "M-[") 'sp-wrap-square)
(define-key smartparens-mode-map (kbd "M-{") 'sp-wrap-curly)
(define-key smartparens-mode-map (kbd "M-<delete>") 'sp-unwrap-sexp)
(define-key smartparens-mode-map (kbd "M-<backspace>") 'sp-backward-unwrap-sexp)

(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook #'aggressive-indent-mode)

;; auto-complete
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

;; don't display repl
(setq cider-repl-pop-to-buffer-on-connect nil)
