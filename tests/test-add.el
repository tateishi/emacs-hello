(require 'ert)
(require 'add)

(ert-deftest add20 ()
  (should (= 20 (my:add 10 10))))
