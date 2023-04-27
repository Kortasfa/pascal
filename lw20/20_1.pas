PROGRAM PsevdoGraphic(INPUT, OUTPUT);
CONST
  SetOfChars = ['M', 'A', 'L'];
TYPE
  Positions = SET OF 1 .. 25; 
VAR
  Ch: CHAR;
  Matrix: Positions;  
  
FUNCTION ReadLetter(VAR FIn: TEXT; VAR Ch: CHAR): BOOLEAN;
BEGIN
  READ(FIn, Ch);
  IF Ch IN SetOfChars
  THEN
    ReadLetter := TRUE
  ELSE
    ReadLetter := FALSE 
END;
  
FUNCTION ChooseMatrix(Ch: CHAR): Positions; 
BEGIN
  CASE Ch OF
    'M': ChooseMatrix := [1, 5, 6, 7, 9, 10, 11, 13, 15, 16, 20, 21, 25];
    'A': ChooseMatrix := [3, 7, 9, 11 .. 15, 16, 20, 21, 25];
    'L': ChooseMatrix := [1, 6, 11, 16, 21 .. 25]
  END
END;    

PROCEDURE PrintMatrix(LetterSet: Positions);
VAR                
  Position: INTEGER;
BEGIN      
  FOR Position := 1 TO 25
  DO
    BEGIN
      IF Position IN LetterSet
      THEN
        WRITE(Ch)
      ELSE
        WRITE(' ');
      IF Position MOD 5 = 0
      THEN 
        WRITELN
    END
END;

BEGIN    
  WHILE NOT EOLN
  DO
    BEGIN
      IF ReadLetter(INPUT, Ch)
      THEN
        BEGIN        
          Matrix := ChooseMatrix(Ch);
          PrintMatrix(Matrix)
        END
      ELSE                  
        WRITELN('???????????? ??????')
    END; 
  WRITELN
END.
