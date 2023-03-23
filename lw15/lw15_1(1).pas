PROGRAM lw15_1(INPUT, OUTPUT);
USES Count3;
VAR
  A, B, C, D: CHAR;
BEGIN
  A := 'A';
  B := 'A';
  C := 'A';
  WHILE NOT EOLN
  DO
    BEGIN
      READ(D);
      A := B  ;
      B := C;
      C := D;
      IF NOT EOLN
      THEN
        BEGIN
          IF (A < B) AND (B > C)
          THEN
            Bump;
          IF (A > B) AND (B < C)
          THEN
            Bump
        END 
    END;
  IF (A < B) AND (B > C)
  THEN
    Bump;
  IF (A > B) AND (B < C)
  THEN
    Bump;
  Value (A, B, C);
  WRITELN(A, B, C)
END. 
