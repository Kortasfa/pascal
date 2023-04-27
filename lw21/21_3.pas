PROGRAM Encryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper 
  и печатает новые символы в OUTPUT}
CONST
  Len = 20;
TYPE
  Str = ARRAY [1 .. Len] OF CHAR;  
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
  SetChar = SET OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  I: INTEGER;                                     
  F: TEXT;
  SymbolValue: SetChar;

PROCEDURE Initialize(VAR FIn: TEXT; VAR Code: Chiper);
VAR
  Key, Value: CHAR;
  I: INTEGER;
{Присвоить Code шифр замены}
BEGIN {Initialize}
  {Code['A'] := 'Z';}
  RESET(FIn);
  I := 0; 
  WHILE NOT EOLN(FIn)
  DO
    BEGIN
      WHILE NOT EOF(FIn)
      DO
        BEGIN
          READ(FIn, Key);
          READ(FIn, Value);
          READLN(FIn);
          Code[Value] := Key;
          SymbolValue := SymbolValue + [Value]
        END
    END
END;  {Initialize}

PROCEDURE Decode(VAR S: Str);
{Выводит символы из Code, соответствующие символам из S}
VAR
  Index: 1 .. I;
BEGIN {Decode}
  FOR Index := 1 TO I
  DO
    IF S[Index] IN SymbolValue
    THEN
      WRITE(Code[S[Index]])
    ELSE
      WRITE(S[Index]);
  WRITELN
END;  {Decode}

BEGIN {Decryption}
  ASSIGN(F, 'Encryption.txt');
  {Инициализировать Code}
  Initialize(F, Code);
  WHILE NOT EOF
  DO
    BEGIN
      {читать строку в Msg и распечатать ее}
      I := 0;
      WHILE NOT EOLN AND (I < Len)
      DO
        BEGIN
          I := I + 1;
          READ(Msg[I]);
          WRITE(Msg[I])
        END;
      READLN;
      WRITELN;
      {распечатать раскодированное сообщение}
      IF I > 0
      THEN
        Decode(Msg)
    END
END.  {Decryption}

