PROGRAM Rgr(INPUT, OUTPUT);
VAR 
  F, Dict: TEXT;
  S: STRING;
  
PROCEDURE SaveToDictionary(VAR F: TEXT; VAR Dict: TEXT);
VAR
  Ch, Flag: CHAR;
  Word: STRING;
  I: INTEGER;
BEGIN
  I := 1;
  Flag := 'Y';
  Word := '';
  WHILE NOT EOF(F)
  DO
    BEGIN
      READ(F, Ch);
      IF Ch <> ' ' 
      THEN
        BEGIN
          Flag := 'N';
          Word := Word + Ch;
          INC(I);
        END
      ELSE
        BEGIN
          IF Flag = 'N'
          THEN
            BEGIN
              WRITELN(Dict, Word);
              Word := '';
              I := 1;
              Flag := 'Y'
            END;                           
          READ(F)
        END
    END 
END;

BEGIN

  ASSIGN(F, 'text.txt');
  ASSIGN(Dict, 'dict.txt');
  RESET(F);
  REWRITE(Dict);
  SaveToDictionary(F, Dict)
END.
