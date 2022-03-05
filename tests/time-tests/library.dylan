Module: dylan-user

define library time-tests
  use common-dylan;
  use testworks;
  use time;
  use io;
end library;

define module time-tests
  use common-dylan;
  use testworks;
  use time;
  use streams;
  export time-tests-suite;
end module;
