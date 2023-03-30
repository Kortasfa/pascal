PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
TYPE
  Score = 0 .. 100;
VAR
  WhichScore: 0 .. NumberOfScores;
  Student: 0 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;
  Ch: CHAR;
  F: TEXT;
BEGIN {AverageScore}
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 0;
  WHILE Student < ClassSize
  DO 
    BEGIN
      TotalScore := 0;
      WhichScore := 0;
      Ave := 0;
      IF NOT EOLN
      THEN
        BEGIN
          REWRITE(F);
          READ(Ch);
          WHILE Ch <> ' '
          DO
            BEGIN
              WRITE(F, Ch);
              READ(Ch)
            END
        END;
      WHILE WhichScore < NumberOfScores
      DO
        BEGIN
          READ(NextScore);
          TotalScore := TotalScore + NextScore;
          WhichScore := WhichScore + 1
        END;
      READLN;
      TotalScore := TotalScore * 10;
      Ave := TotalScore DIV NumberOfScores;
      RESET(F);
      WHILE NOT EOLN(F)
      DO
        BEGIN
          READ(F, Ch);
          WRITE(Ch)
        END;
      WRITE(' ');
      IF Ave MOD 10 >= 5
      THEN
        WRITELN(Ave DIV 10 + 1)
      ELSE
        WRITELN(Ave DIV 10);
      ClassTotal := ClassTotal + TotalScore;
      Student := Student + 1
    END;
  WRITELN;
  WRITELN ('Class average:');
  ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
  WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
END.  {AverageScore}
