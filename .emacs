
(load-file "~/.emacs.custom.el")
(setq custom-file "~/.emacs.custom.el")

;; -- -- ENVIRONMENT VARIBLES -- -- 

(electric-indent-mode 0)
(ido-mode 1)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(setq split-height-threshold 0)
(setq split-width-threshold 0)
;; (cua-mode 1)
;;(add-hook 'shell-mode-hook 'compilation-shell-minor-mode) ;; interesting
;; (whitespace-mode on)
(global-whitespace-mode 1)
(setq whitespace-style (quote (face newline space-mark tab-mark)))

(setq indent-tabs-mode nil)
(setq tab-width 4)
(set-frame-font "Iosevka 13" nil t)
(set-face-attribute 'default nil :height 120)

;; -- -- PACKAGES CONFIGURATION -- --

(global-set-key (kbd "M-o") 'ace-window)

(add-to-list 'load-path "~/.emacs_ext/")
(load "multi-web-mode.el")
(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                  (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
                  (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
(multi-web-global-mode 1)

;; (add-to-list 'load-path "~/.emacs_ext/emacs-gdscript-mode/")
;; (load "gdscript-mode.el")
;; (require 'gdscript-mode)

(add-to-list 'load-path "~/.emacs_ext/ef-themes/")
(require 'ef-themes)
(load-theme 'ef-autumn t)

(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

(defun duplicate-line ()
  "Duplicate current line"
  (interactive)
  (let ((column (- (point) (point-at-bol)))
	(line (let ((s (thing-at-point 'line t)))
		(if s (string-remove-suffix "\n" s) "" ))))
    (move-end-of-line 1)
    (newline)
    (insert line)
    (move-beginning-of-line 1)
    (forward-char column)))
(global-set-key (kbd "C-d") 'duplicate-line)

(add-to-list 'load-path "~/.emacs_ext/multiple-cursors/")
(require 'multiple-cursors)
(global-set-key (kbd "C-:")		'mc/skip-to-previous-like-this)
(global-set-key (kbd "C-<")		'mc/mark-previous-like-this)
(global-set-key (kbd "C-\"")		'mc/skip-to-next-like-this)
(global-set-key (kbd "C->")		'mc/mark-next-like-this)
(global-set-key (kbd "C-c C-<")	'mc/mark-all-like-this)
;; (global--key (kbd "M-s")	'mc/edit-lines)

(defun _hello() "Hello, DannyBoy.")
(_hello);
