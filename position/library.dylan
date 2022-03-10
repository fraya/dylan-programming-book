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

  export <position>;

  export
    <absolute-position>
    , latitude
    , longitude
    ;

  export
    <relative-position>
    , angle
    , distance
    ;

  export
    <directed-angle>
    , total-seconds
    , direction
    ;
  
end module position;
