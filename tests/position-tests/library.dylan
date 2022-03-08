Module: dylan-user

define library position-tests
  use common-dylan;
  use testworks;
  use position;
  use io;
end library;

define module position-tests
  use common-dylan;
  use testworks;
  use position;
  use streams;
  export position-tests-suite;
end module;