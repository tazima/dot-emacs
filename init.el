
;; ユーザ固有のディレクトリをload-pathに追加
(setq user-settings-dir
      (concat user-emacs-directory "users/" user-login-name))
(add-to-list 'load-path user-settings-dir)

;; テーマ
(setq custom-theme-directory (expand-file-name "themes" user-emacs-directory))

;; フォント
(set-face-attribute 
 'default nil
 :family "CosmicSansNeueMono"
 :height 95)

;; デフォルト
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default make-backup-files nil)
(setq-default auto-save-default nil)
(fset 'yes-or-no-p 'y-or-n-p)

;; window-system
(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (load-theme 'pastels-on-dark t))

;; キーバインド
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-c y") 'helm-c-yas-complete)
(global-set-key (kbd "C-c C-g") 'helm-ls-git-ls)
(global-set-key (kbd "C-c g") 'helm-git-grep)
(global-set-key (kbd "C-c M-g") 'helm-git-grep-at-point)

;; cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; auto-complete
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories (expand-file-name "ac-dict" user-emacs-directory))
(require 'auto-complete-config)
(ac-config-default)

;; helm
(require 'helm-config)
(helm-mode 1)

;; helm-c-yasnippet
(require 'yasnippet)
(require 'helm-c-yasnippet)
(setq helm-c-yas-space-match-any-greedy t)
(yas--initialize)
;; TODO express-snippets.el

;; helm-ls-git
(require 'helm-ls-git)
(setq-default helm-ls-git-show-abs-or-relative 'absolute)

;; helm-git-grep
(require 'helm-git-grep)

;; TODO helm-c-moccur-occur-by-moccur

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)

;; popwin
(require 'popwin)
(popwin-mode t)

;; smartparens
(require 'smartparens)
(smartparens-global-mode t)

;; flycheck
(require 'flycheck)
(global-flycheck-mode t)

;; ユーザ固有のelファイルをロード
(when (file-exists-p user-settings-dir)
  (mapc 'load (directory-files user-settings-dir nil "^[^#].*el$")))
