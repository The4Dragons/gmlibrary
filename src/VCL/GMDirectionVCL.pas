{
TGMDirection component

  ES: componente VCL para mostrar la ruta a seguir entre dos puntos en un mapa de Google
      Maps mediante el componente TGMMap
  EN: VCL component to show the route to follow between two points on Google Map map using
      the component TGMMap

=========================================================================
MODO DE USO/HOW TO USE

  ES: poner el componente en el formulario, unirlo a un TGMMap, establecer las
    propiedades de b�squeda y reproducci�n y hacer una llamada al m�todo Execute
  EN: put the component on the form, link it to a TGMMap, set the request and
    render properties and call the Execute method
=========================================================================
History:

ver 0.1.9
  ES:
    nuevo: documentaci�n
    nuevo: se hace compatible con FireMonkey
  EN:
    new: documentation
    new: now compatible with FireMonkey
=========================================================================
IMPORTANTE PROGRAMADORES: Por favor, si tienes comentarios, mejoras,
  ampliaciones, errores y/o cualquier otro tipo de sugerencia, env�ame un correo a:
  gmlib@cadetill.com

IMPORTANT PROGRAMMERS: please, if you have comments, improvements, enlargements,
  errors and/or any another type of suggestion, please send me a mail to:
  gmlib@cadetill.com
=========================================================================

Copyright (�) 2012, by Xavier Martinez (cadetill)

@author Xavier Martinez (cadetill)
@web  http://www.cadetill.com
}
{*------------------------------------------------------------------------------
  Includes the necessary classes to manage routes and show it into a Google Maps map.

  @author Xavier Martinez (cadetill)
  @version 0.1.9
-------------------------------------------------------------------------------}
{=------------------------------------------------------------------------------
  Contiene las classes necesarias para la manipulaci�n de rutas y mostrarlas en un mapa de Google Maps.

  @author Xavier Martinez (cadetill)
  @version 0.1.9
-------------------------------------------------------------------------------}
unit GMDirectionVCL;

interface

uses
  {$IF CompilerVersion < 23}  // ES: si la versi�n es inferior a la XE2 - EN: if lower than XE2 version
  Classes, Graphics,
  {$ELSE}                     // ES: si la veris�n es la XE2 o superior - EN: if version is XE2 or higher
  System.Classes, Vcl.Graphics,
  {$IFEND}

  GMDirection;

type
  TGMDirection = class;

  {*------------------------------------------------------------------------------
    Route polyline options.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#PolylineOptions
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Opciones para la polilinea de una ruta.
    M�s informaci�n en https://developers.google.com/maps/documentation/javascript/reference?hl=en#PolylineOptions
  -------------------------------------------------------------------------------}
  TPolylineOptions = class(TCustomPolylineOptions)
  private
    {*------------------------------------------------------------------------------
      The stroke color.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Color del trazo.
    -------------------------------------------------------------------------------}
    FStrokeColor: TColor;
    procedure SetStrokeColor(const Value: TColor);
  protected
    function GetStrokeColor: string; override;
  public
    constructor Create(aOwner: TPersistent); override;

    procedure Assign(Source: TPersistent); override;
  published
    property StrokeColor: TColor read FStrokeColor write SetStrokeColor;
  end;

  {*------------------------------------------------------------------------------
    Defines the properties that can be set on a DirectionsRenderer object.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#DirectionsRendererOptions
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Define las propiedades que pueden ser establecidas en un objeto DirectionsRenderer.
    M�s informaci�n en https://developers.google.com/maps/documentation/javascript/reference?hl=en#DirectionsRendererOptions
  -------------------------------------------------------------------------------}
  TDirectionsRenderer = class(TCustomDirectionsRenderer)
  protected
    procedure CreatePolylineOptions; override;
  end;

  {*------------------------------------------------------------------------------
    The directions response retrieved from the directions server. Base class.
    More information at https://developers.google.com/maps/documentation/javascript/reference?hl=en#DirectionsResult
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Respuesta Directions devuelta por el servidor de direcciones. Clase base.
    M�s informaci�n en https://developers.google.com/maps/documentation/javascript/reference?hl=en#DirectionsResult
  -------------------------------------------------------------------------------}
  TDirectionsResult = class(TCustomDirectionsResult)
  protected
    procedure CreateDirectionsRenderObject; override;
  end;

  {*------------------------------------------------------------------------------
    VCL class for computing directions between two or more places.
    More information at
    - https://developers.google.com/maps/documentation/javascript/reference?hl=en#DirectionsService
    - https://developers.google.com/maps/documentation/javascript/directions
    - https://developers.google.com/maps/documentation/directions
  -------------------------------------------------------------------------------}
  {=------------------------------------------------------------------------------
    Clase VCL para gestionar direcciones entre dos o m�s lugares.
    M�s informaci�n en
    - https://developers.google.com/maps/documentation/javascript/reference?hl=en#DirectionsService
    - https://developers.google.com/maps/documentation/javascript/directions
    - https://developers.google.com/maps/documentation/directions
  -------------------------------------------------------------------------------}
  TGMDirection = class(TCustomGMDirection)
  private
    function GetDirectionResult(I: Integer): TDirectionsResult;
  protected
    procedure CreateDirectionsRenderObject; override;
    procedure GetRetournedData; override;
  public
    {*------------------------------------------------------------------------------
      Results array.
    -------------------------------------------------------------------------------}
    {=------------------------------------------------------------------------------
      Array de resultados.
    -------------------------------------------------------------------------------}
    property DirectionsResult[I: Integer]: TDirectionsResult read GetDirectionResult; default;
  end;

implementation

uses
  GMFunctionsVCL, GMConstants;

{ TPolylineOptions }

procedure TPolylineOptions.Assign(Source: TPersistent);
begin
  inherited;

  if Source is TPolylineOptions then
    StrokeColor := TPolylineOptions(Source).StrokeColor;
end;

constructor TPolylineOptions.Create(aOwner: TPersistent);
begin
  inherited;

  FStrokeColor := clBlue;
end;

function TPolylineOptions.GetStrokeColor: string;
begin
  Result := TTransform.TColorToStr(FStrokeColor);
end;

procedure TPolylineOptions.SetStrokeColor(const Value: TColor);
begin
  if FStrokeColor = Value then Exit;

  FStrokeColor := Value;
  if Assigned(OnChange) then OnChange(Self);
end;

{ TDirectionsRenderer }

procedure TDirectionsRenderer.CreatePolylineOptions;
begin
  inherited;

  PolylineOptions := TPolylineOptions.Create(Self);
  TPolylineOptions(PolylineOptions).OnChange := OnPolylineOptionsChange;
end;

{ TDirectionsResult }

procedure TDirectionsResult.CreateDirectionsRenderObject;
begin
  inherited;

  DirectionsRender := TDirectionsRenderer.Create(Self);
  TDirectionsRenderer(DirectionsRender).OnChange := OnDirectionsRenderChange;
end;

{ TGMDirection }

procedure TGMDirection.CreateDirectionsRenderObject;
begin
  inherited;

  DirectionsRender := TDirectionsRenderer.Create(Self);
end;

function TGMDirection.GetDirectionResult(I: Integer): TDirectionsResult;
begin
  Result := TDirectionsResult(FDirectionsResult[i]);
end;

procedure TGMDirection.GetRetournedData;
var
  DirResult: TDirectionsResult;
begin
  inherited;

  DirResult := TDirectionsResult.Create(Self, FCountDirResult);
  DirResult.DirectionsRender.Assign(DirectionsRender);
  DirResult.SetFromTo(DirectionsRequest.Origin.ToString + ' to ' + DirectionsRequest.Destination.ToString);
  DirResult.XMLData.Text := GetStringField(DirectionsForm, DirectionsFormXML);
  FDirectionsResult.Add(DirResult);
end;

end.
