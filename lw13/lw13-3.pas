PROGRAM Split(INPUT, OUTPUT);
VAR
  Ch, Next: CHAR;
  Odds, Evens: TEXT;
  
PROCEDURE CopyOut(VAR F1: TEXT; VAR Ch: CHAR);
BEGIN
  RESET(F1);
  WHILE NOT EOF(F1)
  DO
    BEGIN
      WHILE NOT EOLN(F1)
      DO
        BEGIN
          READ(F1, Ch);
          WRITE(OUTPUT, Ch)
        END;
      READLN(F1)
    END
END;

BEGIN
  REWRITE(Odds);
  REWRITE(Evens);
  Next := '0';
  WHILE NOT EOF(INPUT)
  DO
    BEGIN
      WHILE NOT EOLN(INPUT)
      DO
        BEGIN
          READ(INPUT, Ch); 
          IF Next = '0'
          THEN
            BEGIN
              WRITE(Odds, Ch);
              Next := '1'
            END
          ELSE
            BEGIN
              WRITE(Evens, Ch);
              Next := '0'
            END
        END;
        READLN;
        WRITELN(Odds);
        WRITELN(Evens)
    END;
  WRITELN(Odds);         
  WRITELN(Evens);
  CopyOut(Odds, Ch);
  CopyOut(Evens, Ch);
  WRITELN
END.                         
