Module: dylan-user

define library time-test
  use common-dylan;
  use testworks;
  use time;
  use io;
end library;

define module time-test
  use common-dylan;
  use testworks;
  use time;
  use streams;
  export time-test-suite;
end module;
