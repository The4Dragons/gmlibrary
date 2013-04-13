{
unit Lang

  ES: unidad para facilitar el cambio de idioma en los errores
  EN: unit to facilitate the change of language of the errors

=========================================================================
History:

ver 1.0.0
  ES:
    nuevo: (issue GC4) a�adido el idioma alem�n (gracias Sascha)
    error: corregido error en funci�n GetTranslateText
    nuevo: a�adido el idioma ruso (gracias Teltikov Aleksandr)
  EN:
    new: (issue GC4) added German language (thanks Sascha)
    bug: bug fixed in function GetTranslateText
    new: added russian language (thanks Teltikov Aleksandr)

ver 0.1.9
  ES:
    nuevo: documentaci�n
    nuevo: a�adido el idioma dan�s (gracias Hugo Pedersen)
  EN:
    new: documentation
    new: added danish language (thanks Hugo Pedersen)

ver 0.1.7
  ES:
    nuevo: a�adido el idioma portugu�s (gracias Moacir Fortes)
  EN:
    new: added portuguese language (thanks Moacir Fortes)

ver 0.1.6
  ES:
    nuevo: a�adido el idioma franc�s (gracias St�phane)
  EN:
    new: added french language (thanks St�phane)

ver 0.1:
  ES: primera versi�n
  EN: first version
=========================================================================
IMPORTANTE PROGRAMADORES: Por favor, si tienes comentarios, mejoras,
  ampliaciones, errores y/o cualquier otro tipo de sugerencia, env�ame un correo a:
  gmlib@cadetill.com

IMPORTANT PROGRAMMERS: please, if you have comments, improvements, enlargements,
  errors and/or any another type of suggestion, please send me a mail to:
  gmlib@cadetill.com
=========================================================================

Copyright (�) 2011, by Xavier Martinez (cadetill)

@author Xavier Martinez (cadetill)
@web  http://www.cadetill.com
}
{*------------------------------------------------------------------------------
  Lang unit contains strings messages error displayed by the components and a function to do the translation.
  To add a new language you must be to do these steps:
  - create a new constant array with all translations
  - add the new language to set GMConstants.TLang
  - change the GetTranslateText function by adding new language

  @author Xavier Martinez (cadetill)
  @version 1.0.0
-------------------------------------------------------------------------------}
{=------------------------------------------------------------------------------
  La unit Lang contiene las cadenas de los mensajes de error mostrados por los componentes y una funci�n para realizar la traducci�n.
  Para a�adir un nuevo idioma se tendr�n que hacer estos pasos:
  - crear una nueva constante de tipo array con todas las traducciones
  - a�adir el nuevo idioma al conjunto GMConstants.TLang
  - modificar la funci�n GetTranslateText a�adiendo el nuevo idioma del conjunto

  @author Xavier Martinez (cadetill)
  @version 1.0.0
-------------------------------------------------------------------------------}
unit Lang;

interface

uses
  GMConstants;

const
  {*------------------------------------------------------------------------------
    Array with messages in Spanish
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Array con los mensajes en espa�ol
  -------------------------------------------------------------------------------}
  Lang_ESP: array[0..14] of string = (
      'No se ha especificado el objeto WebBrowser',    // 0
      'P�gina inicial aun no cargada',      // 1
      'El mapa todav�a no ha sido creado',  // 2
      'No est� activo',                     // 3
      'No se ha podido cargar el recurso',  // 4
      'Este objeto no tiene relaci�n en JavaScript',  // 5
      'Id de JavaScript incorrecto',        // 6
      'Id de JavaScript inexistente',       // 7
      'N�mero de par�metros incorrecto',    // 8
      'Tipo de par�metro incorrecto',       // 9
      'Valor de par�metro incorrecto',      // 10
      '�ndice fuera de rango',              // 11
      'Mapa no asignado',                   // 12
      'El fichero no existe',               // 13
      'El n�mero de columna es incorrecto'  // 14
      );

  {*------------------------------------------------------------------------------
    Array with messages in English
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Array con los mensajes en ingl�s
  -------------------------------------------------------------------------------}
  Lang_ENG: array[0..14] of string = (
      'WebBrowser not defined',             // 0
      'Initial page not loaded',            // 1
      'The map is not yet created',         // 2
      'Not active',                         // 3
      'Can''t load resource',               // 4
      'This object has no relation in JavaScript', // 5
      'Id from JavaScript incorrect',       // 6
      'JavaScript Id does not exist',       // 7
      'Incorrect number of parameters',     // 8
      'Incorrect type parameter',           // 9
      'Incorrect value parameter',          // 10
      'Index out of range',                 // 11
      'Map not assigned',                   // 12
      'File does not exist',                // 13
      'The col number is incorrect'         // 14
      );

  {*------------------------------------------------------------------------------
    Array with messages in French
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Array con los mensajes en franc�s
  -------------------------------------------------------------------------------}
  Lang_FRE: array[0..14] of string = (
      'Navigateur Web non d�fini',          // 0
      'Page initiale non charg�e',          // 1
      'La carte n''est pas encore cr��e',   // 2
      'Non actif',                          // 3
      'Ne peux pas charger la ressource',   // 4
      'Cet object n''a pas de relation dans JavaScript', // 5
      'Id JavaScript incorrect',            // 6
      'Id JavaScript inexistant',           // 7
      'Nombre incorrecte de param�tres',    // 8
      'Type de param�tre incorrect',        // 9
      'Valeur de param�tre incorrecte',     // 10
      'Indice hors limites',                // 11
      'Carte non attribu�e',                // 12
      'Le fichier n''existe pas',           // 13
      'Le num�ro de colonne est incorrect'  // 14
      );

  {*------------------------------------------------------------------------------
    Array with messages in Brazilian Portuguese
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Array con los mensajes en portugu�s de Brasil
  -------------------------------------------------------------------------------}
  Lang_PTBR: array[0..14] of string = (
      'Navegador Web n�o definido',                // 0
      'P�gina inicial n�o foi carregada',          // 1
      'O mapa ainda n�o foi criado',               // 2
      'Inativo',                                   // 3
      'N�o � poss�vel carregar recursos',          // 4
      'Este objeto n�o tem rela��o em JavaScript', // 5
      'Id do JavaScript incorreto',                // 6
      'Id do JavaScript n�o existe',               // 7
      'N�mero incorreto de par�metros',            // 8
      'Tipo de par�metro incorreto',               // 9
      'Valor do par�metro incorreto',              // 10
      '�ndice fora do intervalo',                  // 11
      'Mapa n�o atribu�do',                        // 12
      'O arquivo n�o existe',                      // 13
      'O n�mero da coluna est� errado'             // 14
      );

  {*------------------------------------------------------------------------------
    Array with messages in Danish
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Array con los mensajes en dan�s
  -------------------------------------------------------------------------------}
  Lang_DAN: array[0..14] of string = (
      'WebBrowser ikke defineret',                      // 0
      'F�rste side er ikke hentet',                     // 1
      'Kortet er ikke dannet endnu',                    // 2
      'Ikke aktiv',                                     // 3
      'Kan ikke hente ressource',                       // 4
      'Dette object har ingen relation i JavaScript',   // 5
      'Id fra JavaScript er forkert',                   // 6
      'JavaScript Id findes ikke',                      // 7
      'Forkert antal parametre',                        // 8
      'Forkert parameter type',                         // 9
      'Forkert v�rdi parameter',                        // 10
      'Index uden for omr�de',                          // 11
      'Kort ikke angivet',                              // 12
      'Filen findes ikke',                              // 13
      'Antal kolonner er forkert'                       // 14
      );

  {*------------------------------------------------------------------------------
    Array with messages in German
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Array con los mensajes en alem�n
  -------------------------------------------------------------------------------}
  Lang_GER: array[0..14] of string = (
      'Webbrowser nicht definiert',                      // 0
      'Initialisierungswebseite nicht geladen',          // 1
      'Die Karte wurde noch nicht erzeugt',              // 2
      'Nicht aktiv',                                     // 3
      'Kann die Resourcen nicht laden',                  // 4
      'Dieses Objekt hat in JavaScript keine Zuordnung', // 5
      'ID in JavaScript ung�ltig',                       // 6
      'JavaScript ID existiert nicht',                   // 7
      'Anzahl der Parameter ung�ltig',                   // 8
      'Nicht korrketer Parametertyp',                    // 9
      'Ung�ltiger Wert im Parameter',                    // 10
      'Index ausserhalb des zul�ssigen Bereichs',        // 11
      'Karte nich zugewiesen',                           // 12
      'Datei existiert nicht',                           // 13
      'Die Spaltennummer ist ung�ltig'                   // 14
      );

  {*------------------------------------------------------------------------------
    Array with messages in Russian
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Array con los mensajes en ruso
  -------------------------------------------------------------------------------}
  Lang_RUS: array[0..14] of string = (
      'WebBrowser �� ���������',                         // 0
      '��������� �������� �� ���������',                 // 1
      '����� �� �������',                                // 2
      '�� �������',                                      // 3
      '�� �������� ��������� �������',                   // 4
      '���� ������ �� ����� ������ � JavaScript',        // 5
      'Id �� JavaScript �� ����������',                  // 6
      'JavaScript Id �� ����������',                     // 7
      '������������ ����� ����������',                   // 8
      '������������ ��� ���������',                      // 9
      '������������ �������� ���������',                 // 10
      '������ ��� ���������',                            // 11
      '����� �� ���������',                              // 12
      '���� �� ����������',                              // 13
      '����� ������� ������������'                       // 14
      );

  {*------------------------------------------------------------------------------
    GetTranslateText fucntion retrieves a translated string into the Lang language
    @param Text string to translate
    @param Lang destination language
    @return translated string
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    La funci�n GetTranslateText devuelve una cadena traducida al idioma Lang
    @param Text cadena a traducir
    @param Lang lenguaje destino
    @return cadena traducida
  -------------------------------------------------------------------------------}
  function GetTranslateText(Text: string; Lang: TLang): string;

implementation

{ TLanguage }

function GetTranslateText(Text: string; Lang: TLang): string;
  function GetIndex(Text: string): Integer;
  begin
    Result := 0;
    while Result <= High(Lang_ESP) do
    begin
      if Text = Lang_ESP[Result] then Break;
      Inc(Result);
    end;
    if Result > High(Lang_ESP) then Result := -1;
  end;
var
  Idx: Integer;
begin
  Idx := GetIndex(Text);
  if Idx = -1 then Result := Text
  else
  begin
    case Lang of
      English: Result := Lang_ENG[Idx];
      French: Result := Lang_FRE[Idx];
      PortuguesBR: Result := Lang_PTBR[Idx];
      Danish: Result := Lang_DAN[Idx];
      German: Result := Lang_GER[Idx];
      Russian: Result := Lang_RUS[GetIndex(Text)];
      else Result := Text;
    end;
    if Result = '' then Result := Text;
  end;
end;

end.
