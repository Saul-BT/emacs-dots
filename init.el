;; MUST STUFF
;; Source repos
(require 'package)
(setq package-enable-at-startup nil)

(setq package-archives '(("elpa" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(package-initialize)

;; CONFIG STUFF
;; Bootstrapping use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; quelpa-use-package
(use-package quelpa-use-package
  :ensure t
  :init
  (setq quelpa-update-melpa-p nil)
  (setq quelpa-self-upgrade-p nil))

;; Load configuration
(when (file-readable-p "~/.emacs.d/config.org")
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))

;; Set default font
(set-face-attribute 'default nil
                    :family "Fira Code"
                    :height 120
                    :weight 'normal
                    :width 'normal)

;; CUSTOM STUFF
;; By Custom

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(awesome-tray-active-modules (quote ("buffer-name" "location" "mode-name" "date" "git")))
 '(awesome-tray-mode-line-active-color "#6575A9")
 '(package-selected-packages
   (quote
    (ox-reveal dimmer org-superstar counsel flycheck tide web-mode mark-multiple htmlize swiper company rainbow-delimiters which-key use-package treemacs dashboard dracula-theme))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(awesome-tray-module-buffer-name-face ((t (:foreground "white" :weight normal))))
 '(awesome-tray-module-date-face ((t (:foreground "#008ED4" :weight bold))))
 '(awesome-tray-module-git-face ((t (:foreground "#FCFF90" :weight bold))))
 '(awesome-tray-module-location-face ((t (:foreground "#FF7CCD" :weight bold))))
 '(awesome-tray-module-mode-name-face ((t (:foreground "#C598FF" :weight normal)))))

;; Enable awesome-tray (I can't from config.org D:)
(awesome-tray-mode)
(modify-frame-parameters nil '((wait-for-wm . nil)))
