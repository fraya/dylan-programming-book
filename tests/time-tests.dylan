Module: time-tests
Author: Fernando Raya
License: See LICENSE

define test test-encode-total-seconds ()
  let seconds = encode-total-seconds(8, 30, 59);
  assert-equal(30659, seconds)
end test;

define test test-decode-total-seconds ()
  assert-equal(values(8, 30, 59), decode-total-seconds(30659))
end test;

define test test-decode-total-seconds-time ()
  let t1 = make(<time-of-day>, total-seconds: 30659);
  let t2 = make(<time-offset>, total-seconds: 30659);
  let expected = values(8, 30, 59);
  
  assert-equal(expected, decode-total-seconds(t1));
  assert-equal(expected, decode-total-seconds(t2));
end test;

define test test-encode-decode ()
  let sec1 = 30659;
  let (hh, mm, ss) = decode-total-seconds(sec1);
  let sec2 = encode-total-seconds(hh, mm, ss);
  assert-equal(sec1, sec2)
end test;

define test test-print-object-time-of-day ()
  let t1 = make(<time-of-day>, total-seconds: 30659);
  assert-equal("8:30:59", as(<string>, t1));
  let t2 = make(<time-of-day>, total-seconds: 29399);
  assert-equal("8:09:59", as(<string>, t2));
  let t3 = make(<time-offset>, total-seconds: 30659);
  assert-equal("plus 8:30:59", as(<string>, t3));
  let t4 = make(<time-offset>, total-seconds: -29399);
  assert-equal("minus 8:09:59", as(<string>, t4));
end test;

define test test-add-time-offset ()
  let t1 = make(<time-offset>,
		total-seconds: - encode-total-seconds(2, 0, 0));
  let t2 = make(<time-offset>,
		total-seconds: encode-total-seconds(15, 20, 45));
  let sum = decode-total-seconds(t1 + t2);
  assert-equal(values(13, 20, 45), sum);
end test;

define test test-add-time-offset-time-of-day ()
  let t1 = make(<time-of-day>,
                total-seconds: encode-total-seconds(8, 30, 59));
  let o1 = make(<time-offset>,
                total-seconds: - encode-total-seconds(2, 0, 0));
  let rs = make(<time-of-day>,
                total-seconds: encode-total-seconds(6, 30, 59));
  assert-equal(rs.total-seconds, (o1 + t1).total-seconds)
end test;

define suite time-test-suite ()
  test test-encode-total-seconds;
  test test-decode-total-seconds;
  test test-decode-total-seconds-time;
  test test-encode-decode;
  test test-print-object-time-of-day;
  test test-add-time-offset;
  test test-add-time-offset-time-of-day;
end;

