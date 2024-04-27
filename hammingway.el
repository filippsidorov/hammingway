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
  (if hammingway-mode
      (progn
        (define-key hammingway-mode-map (kbd "DEL") 'delete-backward-char)
        (message "Hammingway Mode: off")
        (hammingway-mode -1))
    (progn
      (define-key hammingway-mode-map (kbd "DEL") 'ignore)
      (message "Hammingway Mode: on")
      (hammingway-mode 1))))

(define-key global-map (kbd "C-c h m") 'hammingway-toggle-backspace)
(global-hammingway-mode 1)
