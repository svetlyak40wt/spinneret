;;;; spinneret.asd
(in-package #:asdf-user)

(asdf:defsystem #:spinneret
  :description "Common Lisp HTML5 generator."
  :version "2.0"
  :author "Paul M. Rodriguez <pmr@ruricolist.com>"
  :license "MIT"
  :in-order-to ((asdf:test-op (asdf:test-op #:spinneret/tests)))
  :serial t
  :depends-on (#:parenscript
               #:alexandria
               #:cl-ppcre
               #:global-vars
               #:serapeum
               #:trivial-gray-streams)
  :components ((:file "package")
               (:file "special")
               (:file "stream")
               (:file "syntax")
               (:file "tags")
               (:file "spinneret")
               (:file "run")
               (:file "functions")
               (:file "compile")
               (:file "deftag")
               (:file "dynamic")
               (:file "ps")))

(asdf:defsystem #:spinneret/cl-markdown
  :description "Integration with cl-markdown"
  :version "2.0"
  :author "Paul M. Rodriguez <pmr@ruricolist.com>"
  :license "MIT"
  :serial t
  :depends-on (#:cl-markdown
               #:spinneret)
  :components ((:file "cl-markdown")))

(asdf:defsystem #:spinneret/tests
  :description "Test suite for Spinneret"
  :author "Paul M. Rodriguez <pmr@ruricolist.com>"
  :license "MIT"
  :depends-on (#:spinneret #:spinneret/cl-markdown #:fiveam #:serapeum)
  :perform (asdf:test-op (o c) (uiop:symbol-call :spinneret.tests :run-tests))
  :components ((:file "tests")))
