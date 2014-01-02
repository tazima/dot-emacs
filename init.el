
(add-to-list 'load-path user-emacs-directory)

;; ユーザ固有のディレクトリをload-pathに追加
(setq user-settings-dir
      (concat user-emacs-directory "users/" user-login-name))
(add-to-list 'load-path user-settings-dir)

;; テーマ
(setq custom-theme-directory (expand-file-name "themes" user-emacs-directory))
(load-theme 'dichromacy t)

;; デフォルト
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default make-backup-files nil)
(setq-default auto-save-default nil)
(fset 'yes-or-no-p 'y-or-n-p)
(windmove-default-keybindings)

;; window-system
(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

;; キーバインド
(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-c y") 'helm-c-yas-complete)
(global-set-key (kbd "C-c C-g") 'helm-ls-git-ls)
(global-set-key (kbd "C-c g") 'helm-git-grep)
(global-set-key (kbd "C-c M-g") 'helm-git-grep-at-point)
(global-set-key (kbd "M-o") 'helm-occur)
(global-set-key (kbd "C-M-o") 'occur-by-moccur)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

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

;; helm-occur
(require 'color-moccur)

;; multiple-cursors
(require 'multiple-cursors)

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

;; js2-modeのセットアップ
(eval-after-load 'js2-mode '(require 'setup-js2-mode))

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'magic-mode-alist '("#!/usr/bin/env node$" . js2-mode))

;; 行番号
(require 'linum)
(global-linum-mode t)
;; 5桁分の領域を確保して行番号のあとにスペースを入れる
(setq linum-format "%4d ")

;; ユーザ固有のelファイルをロード
(when (file-exists-p user-settings-dir)
  (mapc 'load (directory-files user-settings-dir nil "^[^#].*el$")))
