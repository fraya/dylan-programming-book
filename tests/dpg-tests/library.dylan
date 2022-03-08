Module: dylan-user

define library dpg-tests
  use common-dylan;
  use testworks;
  use time-tests;
  use position-tests;
  export dpg-tests;
end library;

define module dpg-tests
  use common-dylan;
  use testworks;
  use time-tests;
  use position-tests;
  export dpg-tests-suite;
end module;
