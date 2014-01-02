;; フォント
(set-face-attribute 
 'default nil
 :family "CosmicSansNeueMono"
 :height 110)

;; テーマ
(load-theme 'solarized-light t)

;; undo
(global-set-key (kbd "C-z") 'undo-tree-visualize)

;; ブラウザ
(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-generic-program 
  (if (file-exists-p "/usr/bin/chromium")
    "/usr/bin/chromium" "/usr/bin/google-chrome"))

;; 桁数の表示
(add-hook 'text-mode-hook 'ruler-mode)

;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)
