;; init.el file for using intero for haskell development
;; pre-requisites: [1] stack installed [2] hlint installed


;; If you don't have MELPA in your package archives:
(require 'package)
(add-to-list
  'package-archives
  '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

;; Install Intero
(package-install 'intero)
(add-hook 'haskell-mode-hook 'intero-mode)

;; enable intero for non-stack haskell files
(intero-global-mode 1)

;; shortcut to set intero targets: Alt-s Alt-t 
(global-set-key (kbd "M-s M-t") #'intero-targets)

;; do linting on-the-fly 
(with-eval-after-load 'intero
  (flycheck-add-next-checker 'intero '(warning . haskell-hlint))
)

;; install stack mode with shortcut: Alt-s Alt-s
(package-install 'hasky-stack)
(global-set-key (kbd "M-s M-s") #'hasky-stack-execute)

;; use Shift-arrow keys to move between windows
(windmove-default-keybindings)

(custom-set-variables 
  ;; use manoj-dark - but reset function-name font size (see below)
  '(custom-enabled-themes (quote (manoj-dark)))

  '(column-number-mode t)
  '(linum-format " %7i ")
  '(show-paren-mode t)
)

(custom-set-faces
  ;; stop manoj-dark from using bigger font for function names because it messes up alignment
  '(font-lock-function-name-face ((t (:foreground "green yellow" :weight normal :height 1.0))))

  ;; use small (85%) faint font for comments
  '(font-lock-comment-delimiter-face ((t (:foreground "gray40" :height 0.85))))
  '(font-lock-comment-face           ((t (:foreground "gray40" :height 0.85))))
 
  '(font-lock-type-face ((t (:foreground "violet" :weight normal))))
)
