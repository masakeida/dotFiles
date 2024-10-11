;
(menu-bar-mode 0)
(if (eq window-system 'x)
	(menu-bar-mode 1))
; No *.~ type backup file
(setq make-backup-files nil)
; No .#* type backup file
(setq auto-save-default nil)
;
; Japanese (UTF-8) & Mozc
;
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)
(setq default-input-method "japanese-mozc")
(global-set-key (kbd "C-o") 'toggle-input-method)
(set-default-coding-systems 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8-unix)
(setq file-name-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
;
; c-mode
;
(add-hook 'c-mode-common-hook
          '(lambda ()
             (c-set-style "bsd")
             ;(setq indent-tabs-mode nil)
             ))
;
;
; YaTeX
(setq load-path
(cons "/usr/local/share/mule/site-lisp/yatex" load-path))
(setq auto-mode-alist
	(cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq tex-command "platex")
;;
(add-hook 'tex-mode-hook 'turn-on-reftex)   ; with Emacs tex mode
(add-hook 'latex-mode-hook 'turn-on-reftex) ; with Emacs latex mode
(add-hook 'LaTeX-mode-hook 'turn-on-reftex) ; with AUCTeX LaTeX mode
(add-hook 'yatex-mode-hook 'turn-on-reftex) ; with YaTeX mode
;; bunkatsu compile no baai ni oya file wo nyuryoku suru.
(setq TeX-parse-self t)
(setq-default TeX-master nil) ;; Set master-file-name manually
(setq YaTeX-kanji-code 4)
;
; ESS
(load "~/.emacs.d/ESS-24.01.1/lisp/ess-site")
+(ess-toggle-underscore nil)
;
; php-mode
(require 'cl)
(autoload 'php-mode "php-mode" "Mode for editing PHP source files")
(add-to-list 'auto-mode-alist '("\\.\\(inc\\|php[s34]?\\)" . php-mode))
(add-hook 'php-mode-hook
	  '(lambda()
	     (setq tab-width 4)
	     (setq indent-tabs-mode t)
	     (setq c-basic-offset 4)
	     ))
