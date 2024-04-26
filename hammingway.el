(defvar hammingway-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "DEL") 'delete-backward-char)
    map)
  "Keymap for Hammingway Mode.")

(define-minor-mode hammingway-mode
  "Toggle Hammingway mode."
  :init-value nil
  :lighter " Hammingway"
  :keymap hammingway-mode-map
  :group 'hammingway)

(define-globalized-minor-mode global-hammingway-mode hammingway-mode hammingway-mode)

(defun hammingway-toggle-backspace ()
  (interactive)
  (if (eq (key-binding (kbd "DEL")) 'delete-backward-char)
      (progn
        (define-key hammingway-mode-map (kbd "DEL") 'ignore)
        (message "Hammingway Mode: on"))
    (progn
      (define-key hammingway-mode-map (kbd "DEL") 'delete-backward-char)
      (message "Hammingway Mode: off"))))

(define-key global-map (kbd "C-c h m") 'hammingway-toggle-backspace)
(global-hammingway-mode 1)