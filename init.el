;; WELCOME TO AWALEX EMACS CONFIG FILE ;;
(require 'cl)

;; My cyberpunk theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'gotham t)
;;(load-theme 'cyberpunk t)

;; Column mode
(column-number-mode 1)

;; Font size
(set-face-attribute 'default nil :height 105)

(setq tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80))
(setq indent-tabs-mode nil)

;; disabling startup screen
(setq inhibit-startup-message t)

;; binding files to mode
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.tpl.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.blade\\.php\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.twig\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . html-mode))
(add-to-list 'auto-mode-alist
             '("/\\(views\\|html\\|theme\\|templates\\)/.*\\.php\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.php?\\'" . php-mode))

;; disabling toolbar
(tool-bar-mode -1)

;; Marmalade package 
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))

(setq-default indent-tabs-mode nil)

;; Jedi configuration
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)  

;; IDO configuration, enabling autocomplete MX and FINDFILE 
(require 'ido)
(ido-mode 1)
(add-hook 'find-file-hook 'ido-remember-buffer-file)
(defun ido-remember-buffer-file ()
  (interactive)
  (let ((file (expand-file-name (buffer-file-name))))
    (if file
        (let ((dir (file-name-directory file))
              (name (file-name-nondirectory file)))
          (ido-record-work-file name)
          (ido-record-work-directory dir)
          (ido-file-name-all-completions dir)))))
(ido-everywhere 1)
(defadvice completing-read
  (around use-ido-when-possible activate)
  (if (not (boundp 'ido-cur-list))
      (let ((completions (all-completions "" collection predicate)))
        (if completions
            (setq ad-return-value
                  (ido-completing-read prompt completions nil require-match
                                       initial-input hist def)))))
  (unless ad-return-value
    ad-do-it))
;; End of IDO conf

;;; Smex
(autoload 'smex "smex")
(global-set-key (kbd "M-x") 'smex)

;; color-identifiers-mode
(add-hook 'after-init-hook 'global-color-identifiers-mode)

;; key bindings
(global-set-key (kbd "S-<up>") 'windmove-up)
(global-set-key (kbd "S-<left>") 'windmove-left)
(global-set-key (kbd "S-<right>") 'windmove-right)
(global-set-key (kbd "S-<down>") 'windmove-down)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" "3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "b21bf64c01dc3a34bc56fff9310d2382aa47ba6bc3e0f4a7f5af857cd03a7ef7" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "f0a99f53cbf7b004ba0c1760aa14fd70f2eabafe4e62a2b3cf5cabae8203113b" default)))
 '(sml/mode-width (if (eq powerline-default-separator (quote arrow)) (quote right) (quote full)))
 '(sml/pos-id-separator (quote ("" (:propertize " " face powerline-active1) (:eval (propertize " " (quote display) (funcall (intern (format "powerline-%s-%s" powerline-default-separator (car powerline-default-separator-dir))) (quote powerline-active1) (quote powerline-active2)))) (:propertize " " face powerline-active2))))
 '(sml/pos-minor-modes-separator (quote ("" (:propertize " " face powerline-active1) (:eval (propertize " " (quote display) (funcall (intern (format "powerline-%s-%s" powerline-default-separator (cdr powerline-default-separator-dir))) (quote powerline-active1) nil))) (:propertize " " face sml/global))))
 '(sml/pre-id-separator (quote ("" (:propertize " " face sml/global) (:eval (propertize " " (quote display) (funcall (intern (format "powerline-%s-%s" powerline-default-separator (car powerline-default-separator-dir))) nil (quote powerline-active1)))) (:propertize " " face powerline-active1))))
 '(sml/pre-minor-modes-separator (quote ("" (:propertize " " face powerline-active2) (:eval (propertize " " (quote display) (funcall (intern (format "powerline-%s-%s" powerline-default-separator (cdr powerline-default-separator-dir))) (quote powerline-active2) (quote powerline-active1)))) (:propertize " " face powerline-active1))))
 '(sml/pre-modes-separator (propertize " " (quote face) (quote sml/modes))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
