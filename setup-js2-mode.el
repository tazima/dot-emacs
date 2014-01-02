
;; インデント
(custom-set-variables '(js2-basic-offset 2))

;; グローバル変数
(setq-default js2-global-externs '("module" "require" "jQuery" "$" "sinon" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON" "describe" "it" "before" "after" "beforeEach" "afterEach" "expect"))

;; Use lambda for anonymous functions
(font-lock-add-keywords
 'js2-mode `(("\\(function\\) *("
              (0 (progn (compose-region (match-beginning 1)
                                        (match-end 1) "\u0192")
                        nil)))))

;; Use right arrow for return in one-line functions
(font-lock-add-keywords
 'js2-mode `(("function *([^)]*) *{ *\\(return\\) "
              (0 (progn (compose-region (match-beginning 1)
                                        (match-end 1) "\u2190")
                        nil)))))

(provide 'setup-js2-mode)
;;; setup-js2-mode.el ends here

