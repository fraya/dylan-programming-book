Module: dylan-user

define library position
  use common-dylan;
  use io;

  export position;  
end library position;

define module position
  use common-dylan;
  use format-out;
  use streams;

  export
    <position>,
    <absolute-position>,
    <relative-position>;

end module position;
