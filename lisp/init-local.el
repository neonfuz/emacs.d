;;; init-local.el --- Local settings
;;; Commentary:
;;; Code:

;; JSX support
;;-----
(require-package 'rjsx-mode)
(add-to-list 'auto-mode-alist '("\\.\\(js\\|es6\\|jsx\\)\\(\\.erb\\)?\\'" . rjsx-mode))

;; Typescript IDE support
;;-----
(require-package 'tide)

(defun setup-tide-mode ()
  "Set up tide mode."
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1)
  (rjsx-minor-mode))

(setq company-tooltip-align-annotations t)

(after-load 'js2-mode
  (add-hook 'js2-mode-hook #'setup-tide-mode)
  (add-hook 'before-save-hook 'tide-format-before-save)
  )

(provide 'init-local)
;;; init-local.el ends here
