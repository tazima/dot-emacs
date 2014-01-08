;; フォント
(set-face-attribute 
 'default nil
 :family "CosmicSansNeueMono"
 :height 100)

(load-theme 'solarized-dark t)

;; ruby-mode
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))

;; rinari
(require 'rinari)
(require 'rhtml-mode)

(add-hook 'rhtml-mode-hook
    (lambda () (rinari-launch)))

;; robe
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'robe-mode-hook 'robe-ac-setup)
