Module: all-tests
Author: Fernando Raya
License: See LICENSE

define suite dpg-tests-suite ()
  suite time-test-suite;
  suite position-tests-suite;
end;

run-test-application();
