PROGRAM lw14_3_B(INPUT, OUTPUT);
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

PROCEDURE Merge(VAR F1, F2, F3: TEXT);
VAR 
  Ch2, Ch3, W1, W2: CHAR;
BEGIN {Merge}
  W1 := '0';
  W2 := '0';
  RESET(F2);
  RESET(F3);
  REWRITE(F1);
  READ(F2, Ch2);
  READ(F3, Ch3);
  WHILE (W1 = '0') OR (W2 = '0')
  DO
    BEGIN
      IF ((Ch2 < Ch3) AND (W1 = '0')) OR (W2 = '1')
      THEN 
        BEGIN
          WRITE(F1, Ch2);
          IF NOT EOLN(F2)
          THEN           
            READ(F2, Ch2)
          ELSE
            W1 := '1'
        END
      ELSE
        BEGIN
          WRITE(F1, Ch3);
          IF NOT EOLN(F3)
          THEN
            READ(F3, Ch3)
          ELSE 
            W2 := '1' 
        END
    END;
  WRITELN(F1)
END; {Merge}

BEGIN
  REWRITE(F2);
  RCopy(INPUT, F2);
  READLN;
  REWRITE(F3);
  RCopy(INPUT, F3);
  READLN;
  Merge(F1, F2, F3);
  RESET(F1);
  RCopy(F1, OUTPUT);
END.

