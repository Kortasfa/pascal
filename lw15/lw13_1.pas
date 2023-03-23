PROGRAM Test(INPUT, OUTPUT);
USES Count3;
VAR
  Ones, Tens, Hundreds, A, B, C: CHAR;
BEGIN
  Start;
  Value (A, B, C);
  WRITELN(A, B, C);
  Bump;
  Value (A, B, C);
  WRITELN(A, B, C);
  WHILE (C <> '9') OR (B <> '9') OR (A <> '9')
  DO
    BEGIN
      Bump;
      Value (A, B, C);
      WRITELN(A, B, C)
    END
END. 
