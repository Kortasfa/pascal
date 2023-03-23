UNIT Count3;
INTERFACE
  
  PROCEDURE Bump;  //Работа счетчика
  PROCEDURE Value (VAR V100, V10, V1: CHAR); //Вывод данных с счетчика
  
IMPLEMENTATION

VAR
  Ones, Tens, Hundreds: CHAR;

PROCEDURE Start;
{Установка счетчика в начальное состояние(заполняет все разряды нулями)}
BEGIN{Start}
  Ones := '0';
  Tens := '0';
  Hundreds := '0'
END;{Start}

PROCEDURE Bump;  
{Увеличивает 3-цифровой счетчик определенный Ones, Tens, Hundreds на единицу в диапазоне от 0 до 999}

PROCEDURE NextDigit(VAR Digit: CHAR);
{Увеличивает 1 цифру счетчика, подаваемую на входе}
BEGIN {NextDigit}
  IF Digit = '0' THEN Digit := '1' ELSE
  IF Digit = '1' THEN Digit := '2' ELSE
  IF Digit = '2' THEN Digit := '3' ELSE
  IF Digit = '3' THEN Digit := '4' ELSE
  IF Digit = '4' THEN Digit := '5' ELSE
  IF Digit = '5' THEN Digit := '6' ELSE
  IF Digit = '6' THEN Digit := '7' ELSE
  IF Digit = '7' THEN Digit := '8' ELSE
  IF Digit = '8' THEN Digit := '9' ELSE
  IF Digit = '9' THEN Digit := '0'
END;{NextDigit}

BEGIN {Bump}
  NextDigit(Ones);
  IF  Ones = '0' //Изменяет следующий разряд при переполнение Ones
  THEN
    BEGIN
      NextDigit(Tens);  
      IF Tens = '0' //Изменяет следующий разряд при переполнение Tens
      THEN
        BEGIN
          NextDigit(Hundreds);
          IF Hundreds = '0' //Изменяет следующий разряд при переполнение Hundreds
          THEN
            BEGIN
              Ones := '9';
              Tens := '9';
              Hundreds := '9'
            END
        END
    END
END; {Bump}

PROCEDURE Value (VAR V100, V10, V1: CHAR);
{Возвращает содержимое счетчика в переменные}
BEGIN {Value}
  V100 := Hundreds;
  V10 := Tens;
  V1 := Ones
END; {Value}
  
BEGIN {UNIT Count3}
  Start
END. {UNIT Count3}

