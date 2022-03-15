Module: dylan-user

define library time
  use common-dylan;
  use io;

  export time;  
end library time;

define module time
  use common-dylan;
  use format-out;
  use streams;

  
  export
    <time-of-day>,
    <time-offset>,
    total-seconds,
    total-seconds-setter,
    encode-total-seconds,
    decode-total-seconds,
    past?;

end module time;
