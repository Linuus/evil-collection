;;; evil-collection-profiler.el --- Evil bindings for profiler -*- lexical-binding: t -*-

;; Copyright (C) 2017 James Nguyen

;; Author: Pierre Neidhardt <ambrevar@gmail.com>
;; Maintainer: James Nguyen <james@jojojames.com>
;; Pierre Neidhardt <ambrevar@gmail.com>
;; URL: https://github.com/emacs-evil/evil-collection
;; Version: 0.0.1
;; Package-Requires: ((emacs "25.1"))
;; Keywords: evil, profiler, tools

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;; Evil bindings for `profiler'.

;;; Code:
(require 'evil)
(require 'profiler)

(defun evil-collection-profiler-setup ()
  "Set up `evil' bindings for `profiler'."
  (evil-set-initial-state 'profiler-report-mode 'normal)

  (evil-define-key 'normal profiler-report-mode-map
    ;; motion
    (kbd "SPC") 'scroll-up-command
    (kbd "S-SPC") 'scroll-down-command
    (kbd "<delete>") 'scroll-down-command
    "j" 'profiler-report-next-entry
    "k" 'profiler-report-previous-entry

    (kbd "<tab>") 'profiler-report-toggle-entry

    ;; sort
    "o" 'profiler-report-ascending-sort
    "O" 'profiler-report-descending-sort

    "c" 'profiler-report-render-calltree
    "C" 'profiler-report-render-reversed-calltree
    "i" 'profiler-report-describe-entry
    "=" 'profiler-report-compare-profile

    ;; open
    (kbd "<return>") 'profiler-report-find-entry

    ;; refresh
    "gr" 'revert-buffer

    ;; quit
    "q" 'quit-window
    "ZQ" 'evil-quit
    "ZZ" 'quit-windw))

(provide 'evil-collection-profiler)
;;; evil-collection-profiler.el ends here
