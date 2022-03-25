Module: dylan-user

define library time-tests
  use common-dylan;
  use testworks;
  use io;
  use time;
  export time-tests;
end library;

define module time-tests
  use common-dylan;
  use testworks;
  use streams;
  use time;
  export dpg-tests-suite;
end module;
