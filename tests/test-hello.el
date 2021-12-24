(require 'ert)
(require 'hello)

(ert-deftest hello-world ()
  (should (string= "hello" my:message)))
