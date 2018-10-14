(package-initialize)
(require 'package)
(require 'evil)
(evil-mode t)
(global-linum-mode t)
(when (null window-system)
  (menu-bar-mode 0))
; (require 'xscheme)
(add-to-list 'load-path "~/.emacs.d/extendos")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(inhibit-startup-screen t)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/")
     ("melpa" . "http://melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (ob-clojure ox-hugo java-snippets merlin-eldoc tuareg merlin paredit evil-paredit cider clojure-mode htmlize elixir-yasnippets elixir-mode adaptive-wrap sbt-mode scala-mode haskell-mode toc-org org-babel-eval-in-repl evil-visual-mark-mode ##))))
(package-initialize)
(setq linum-format "%4d \u2502 ")
(add-hook 'prog-mode-hook #'linum-mode)
(add-hook 'text-mode-hook #'linum-mode)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq org-pretty-entities t)
(setq org-pretty-entities-include-sub-superscripts t)
(setq prettify-symbols-mode t)

(require 'ob)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((sh . t)
   (emacs-lisp . t)
   (python . t)
   (ruby . t)
   (elixir . t)
   (haskell . t)
   (js . t)
   (ocaml . t)
   (dot . t)
   (ditaa . t)
   (octave . t)
   (scala . t)
   (scheme . t)))
(setq org-confirm-babel-evaluate nil)
(setq org-src-tab-acts-natively t)
(setq org-babel-python-command "python3")
(setq org-src-fontify-natively t)
(setq ensime-startup-notification nil)
(setq org-latex-listings 'minted
      org-latex-packages-alist '(("" "minted"))
      org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
(setq org-export-babel-evaluate nil)
(load "org-colored-text.el")


(global-visual-line-mode 1)
(setq scheme-program-name "chez")
(setq org-latex-minted-options '(("breaklines" "true")
				 ("breakanywhere" "true")))
(progn(require 'comint)
    (define-key comint-mode-map (kbd "<up>") 'comint-previous-input)
    (define-key comint-mode-map (kbd "<down>") 'comint-next-input))



(setq cider-repl-display-help-banner nil)
(setq cider-show-error-buffer 'only-in-repl)
(setq cider-repl-use-pretty-printing t)
(setq cider-repl-wrap-history t)
(setq cider-repl-history-size 1000)
(setq cider-repl-history-file "~/.cider-repl-history")

(defun transpose-buffers (arg)
  "Transpose the buffers shown in two windows."
  (interactive "p")
  (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
    (while (/= arg 0)
      (let ((this-win (window-buffer))
            (next-win (window-buffer (funcall selector))))
        (set-window-buffer (selected-window) next-win)
        (set-window-buffer (funcall selector) this-win)
        (select-window (funcall selector)))
      (setq arg (if (plusp arg) (1- arg) (1+ arg))))))

(require 'org-colored-text)

;; Taken and adapted from org-colored-text
(org-add-link-type
 "color"
 (lambda (path)
   "No follow action.")
 (lambda (color description backend)
   (cond
    ((eq backend 'latex)                  ; added by TL
     (format "{\\color{%s}%s}" color description)) ; added by TL
    ((eq backend 'html)
     (let ((rgb (assoc color color-name-rgb-alist))
           r g b)
       (if rgb
           (progn
             (setq r (* 255 (/ (nth 1 rgb) 65535.0))
                   g (* 255 (/ (nth 2 rgb) 65535.0))
                   b (* 255 (/ (nth 3 rgb) 65535.0)))
             (format "<span style=\"color: rgb(%s,%s,%s)\">%s</span>"
                     (truncate r) (truncate g) (truncate b)
                     (or description color)))
         (format "No Color RGB for %s" color)))))))
(progn
  ;; make indentation commands use space only (never tab character)
  (setq-default indent-tabs-mode nil)
  ;; emacs 23.1 to 26, default to t
  ;; if indent-tabs-mode is t, it means it may use tab, resulting mixed space and tab
  )

(add-hook 'org-mode-hook
          (lambda ()
            (org-indent-mode t))
          t)

(with-eval-after-load 'ox
  (require 'ox-hugo))
(require 'ox-hugo-auto-export)

(setq org-babel-clojure-backend 'cider)
(require 'cider)
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
