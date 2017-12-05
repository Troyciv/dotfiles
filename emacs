(setq use-spacemacs nil)   ; or nil 

(when use-spacemacs
  (setq user-emacs-directory "~/.spacemacs.d/"))   ; defaults to ~/.emacs.d/

(load (expand-file-name "init.el" user-emacs-directory))
