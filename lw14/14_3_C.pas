PROGRAM lw14_3_C(INPUT, OUTPUT);
VAR F: TEXT;

PROCEDURE CopyFile(VAR InFile, OutFile: TEXT);
VAR
  Ch: CHAR;
BEGIN {CopyFile}
  RESET(InFile);
  REWRITE(OutFile);
  WHILE NOT EOLN(InFile)
  DO
    BEGIN
      READ(InFile, Ch);
      WRITE(OutFile, Ch)
    END;                       
  WRITELN(OutFile)
END; {CopyFile}

PROCEDURE Split(VAR F1, F2, F3: TEXT);
VAR 
  Ch, Switch: CHAR;
BEGIN {Split}
  RESET(F1);
  REWRITE(F2);
  REWRITE(F3);
  Switch := '2';
  WHILE (NOT EOLN(F1))
  DO
    BEGIN
      READ(F1, Ch);
      IF Switch = '2'
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

PROCEDURE RecursiveSort(VAR F1: TEXT);
VAR 
  F2, F3: TEXT;
  Ch: CHAR;

BEGIN {RecursiveSort}
  RESET(F1);
  IF NOT EOLN(F1)
  THEN
    BEGIN
      READ(F1, Ch);
      IF NOT (EOLN(F1))
      THEN
        BEGIN
          Split(F1, F2, F3);
          RecursiveSort(F2);
          RecursiveSort(F3);
          Merge(F1, F2, F3)
        END
    END;  
END;  {RecursiveSort}

BEGIN
  CopyFile(INPUT, F);
  RecursiveSort(F);
  CopyFile(F, OUTPUT);
END.


