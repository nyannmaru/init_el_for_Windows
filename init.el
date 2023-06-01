;;This file would be copied into the file named
;;(concat "c:/Users/" user-login-name "/AppData/Roaming/.emacs.d/init.el")

;;(require 'package)
(defvar user-init-file-origin user-init-file
  "System default `user-init-file'.
This var is defined in \"...AppData/Roaming/.emacs.d/init.el\".")
(defvar default-directory-origin default-directory
  "System default `default-directory'.
This var is defineed in \"...AppData/Roaming/.emacs.d/init.el\".")
(defun onetime--init-setter nil
  "this one would be added into `pre-command-hook' when emacs boots-up"
  (interactive)
  (setf user-init-file (concat "C:/Users/" user-login-name "/.emacs.d/init.el");prefix "C:" may need modif
	;;package-user-dir (concat "C:/Users/" user-login-name "/.emacs.d/packages")
	;;doesn't work well, it doesn't add downloaded packages into load-path FIXME(´・ω・｀)
	)
  (when (member default-directory;in order not to override the value when def-dir assigned by user
	        (list (concat "c:/Users/" user-login-name "/AppData/Roaming/.emacs.d")
		      "c:/Program Files/Emacs/"
		      (concat "c:/Program Files/Emacs/emacs-" emacs-version "/bin/")));;should compare with ignore cases(´・ω・｀)
    (setf default-directory (concat "C:/Users/" user-login-name "/")))
  (remove-hook 'pre-command-hook 'onetime--init-setter))

;;Below for loading the moved init, adding the setter into the hook
(let* ((init-dir (concat "C:/Users/" user-login-name "/.emacs.d/"))
       (init-file (concat init-dir "init.el")))
  (unless (file-directory-p init-dir)
    (make-directory init-dir t))
  (unless (file-exists-p init-file)
    (write-region nil "" init-file))
  (load init-file))
(add-hook 'pre-command-hook 'onetime--init-setter)
