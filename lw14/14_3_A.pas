PROGRAM lw14_3(INPUT, OUTPUT);
VAR
  F1, F2, F3: TEXT;

PROCEDURE RCopy(VAR F1, F2: TEXT);
VAR   {RCopy}
  Ch: CHAR;
BEGIN
  IF NOT EOLN(F1)
  THEN
    BEGIN
      READ(F1, Ch);
      WRITE(F2, Ch);
      RCopy(F1, F2)
    END;
END;   {RCopy}

PROCEDURE Split(VAR F1, F2, F3: TEXT);
VAR 
  Ch, Switch: CHAR;
BEGIN {Split}
  RESET(F1);
  REWRITE(F2);
  REWRITE(F3);
  Switch := '2';
  WHILE NOT (EOLN(F1))
  DO
    BEGIN
      READ(F1, Ch);
      IF (Switch = '2')
      THEN
        BEGIN
          WRITE(F2, Ch);
          Switch := '3';
        END
      ELSE
        BEGIN
          WRITE(F3, Ch);
          Switch := '2';
        END
    END;
  WRITELN(F2);
  WRITELN(F3);
END; {Split}

BEGIN
  Split(INPUT, F2, F3);
  RESET(F2);
  RCopy(F2, OUTPUT);
  WRITELN;
  RESET(F3);
  RCopy(F3, OUTPUT);
  WRITELN
END.

