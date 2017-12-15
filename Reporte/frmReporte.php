<?php
include_once("mPDF/mpdf/mpdf.php");

//sistema integral demonitoreo.
include_once("../clsSistema_integral.php");
include_once("../clsPuntuacion.php");
include_once("../clsDetalle_puntuacion.php");
include_once("../clsPeso.php");

//formulario twin shot,spravac y zootec
include_once ('../clsServicio_matenimiento.php');
include_once ('../clsInspeccion_visual.php');
include_once ('../clsInspeccion_funcionamiento.php');
include_once ('../clsDetalle_inspeccion_visual.php');
include_once ('../clsDetalle_inspeccion_funcionamiento.php');


//rpt_sistema_integral("9");

rpt_formulario_twin_shot("258");



//REPORTE DE FORMULARIO DE LA MAQUINA SPRAVAC.
 function rpt_formulario_twin_shot($id_sistema)
{
$html='';

$servicio_mantenimiento=New Servicio_mantenimiento();
$inspeccion_visual= New Inspeccion_visual();
$inspeccion_funcionamiento=New Inspeccion_funcionamiento();
$detalle_inspeccion_visual=New Detalle_inspeccion_visual();
$detalle_inspeccion_funcionamiento=New Detalle_inspeccion_funcionamiento();

$rpt_sm=$servicio_mantenimiento->get_formulario_por_id_y_maquina($id_sistema)
$rpt_inspeccion_visual=$inspeccion_visual->get_formulario_puntuacion_por_id_sim($id_sistema);
$rpt_peso=$peso->get_formulario_peso_por_id_sim($id_sistema);

//$rpt_detalle_puntuacion=$detalle_puntuacion->get_formulario_detalle_puntuacion_por_id_sim_y_puntuacion($id_sistema,$id_puntuacion);
$html.='
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>SISTEMA INTEGRAL DE MONITOREO</title>
     <style type="text/css">
      #tabla_contenido,#tabla_puntuacion{
        border:1px solid #000; 
        margin: 5px;
        align-content: top;
        background: #d9ffcc;
       }
       #tabla_puntuacion
       {
        width: 350px;
       }
       th{
         background-color: #4CAF50;
    color: white;
     border: 1px solid #000;
        height: 50px;

       }
       td{
        height: 40px;
       }
       div{
        height: 100%;
       }
       table
       {
        border-collapse: collapse;
        font-family: arial;
       }
       img
       {
         border: 0px solid #000;
       }
     </style>
  </head>
  <body>
    <header class="clearfix">
    <TABLE>
      <tr>
        <td>
          <img style="width: 50px; height: 50px" src="imagen/invetsa.png">
         </td>
         <td >
         <h2 align="center">SIM (SISTEMA INTEGRAL DE MONITOREO)</h2>
         <h3 align="center">Invetsa Veterinaria S.A.</h3>
        </td>
        <td>
         <b>Codigo:</b> '.$rpt_sim->codigo.'<br>
         <b>Revision:</b>'.$rpt_sim->revision.'<br>
        </td>
      </tr>
      <tr>
        <td style="text-align: left;">
         <b>EMPRESA:</b>'.$rpt_sim->empresa.'  <br>
         <b>GRANJA:</b>'. $rpt_sim->granja .'<br>
         <b>EDAD: </b>'. $rpt_sim->edad .' años<br>
         <b>SEXO: </b>'. $rpt_sim->sexo.'<br>
        </td>
        <td style="text-align: left;" colspan="2">
         <b>ZONA:</b> '. $rpt_sim->zona .' <br>
         <b>GALPON:</b> '. $rpt_sim->codigo_galpon .'<br>
         <b>Nro. de POLLOS:</b> '. $rpt_sim->nro_pollos .'<br>
         <b>FECHA:</b> '. $rpt_sim->fecha .'<br>
        </td>
      </tr>


    </TABLE>
     

     
    </header>
    <main>
   
      <table  id=tabla_contenido>
          <tr >
            <th>Peso Corporal(g)</th>
            <th>Peso Brusca (g)</th>
            <th>Peso de Brazo (g) </th>
            <th>Peso de Timo (g)</th>
            <th>Peso de Higado (g)</th>
            <th>Indice Bursal (g)</th>
            <th>Indice Timico</th>
            <th>Indice Hepatico</th>
            <th>Indice bursometro</th>
          </tr>';
         

            if($rpt_peso!="-1"){
            while ($fila=mysqli_fetch_object($rpt_peso)) {
              if($fila->id=="6")
              {
                
               $html.=' <tr style="background:#a56;">';
                       
              }
              else
              {
                
                $html.='<tr>';
                
              }

            $html.='
                  <td>'.$fila->peso_corporal.'</td>
                  <td>'.$fila->peso_bursa.'</td>
                  <td>'.$fila->peso_brazo.'</td>
                  <td>'.$fila->peso_timo.'</td>
                  <td>'.$fila->peso_higado.'</td>
                  <td>'.$fila->indice_bursal.'</td>
                  <td>'.$fila->indice_timico.'</td>
                  <td>'.$fila->indice_hepatico.'</td>
                  <td>'.$fila->bursometro.'</td>
                  </tr>
                  ';
            }
          }
                 
    $html.='</table><table>';



            if($rpt_puntuacion!="-1"){
              
            while ($objeto=mysqli_fetch_object($rpt_puntuacion)) {
               $bajo=$objeto->id % 2;
               if($bajo==1){
                $html.='<tr>';
              }
              $html.='<td> <div id=div_tabla><table id=tabla_puntuacion>';

              $rpt_detalle_puntuacion=$detalle_puntuacion->get_formulario_detalle_puntuacion_por_id_sim_y_puntuacion($id_sistema,$objeto->id);
              $html.='
                <tr>
                <th colspan=2>'.
                $objeto->id.' '.$objeto->nombre.'
                </th>
                </tr>
              ';
              if($rpt_detalle_puntuacion!="-1"){
              while($fila=mysqli_fetch_object($rpt_detalle_puntuacion)){             
            $html.='
                  <tr>
                  <td>'.$fila->nombre.'</td>
                  <td>'.$fila->estado.'</td>
                  </tr>
                  ';
            }
          }
           $html.='</table></div> </td>';
          if($bajo==1){
               $html.='</tr>';
              }
          }
          }
          
              
      $html.='</table>';
      $html.='<b>Referencia:</b><br>';
$html.= $rpt_sim->referencia.'<br>';
      $html.='<b>Observaciones:</b><br>';
$html.= $rpt_sim->observaciones.'<br>';
      $html.='<b>Comentarios:</b><br>';
$html.= $rpt_sim->comentarios.'<br>';
 
 if(file_exists("../".$rpt_sim->firma_invetsa))
{
  $src_firma_invetsa="data:image/jpeg;base64,".file_get_contents("../".$rpt_sim->firma_invetsa);
}
 if(file_exists("../".$rpt_sim->firma_invetsa))
{
  $src_firma_empresa="data:image/jpeg;base64,".file_get_contents("../".$rpt_sim->firma_empresa);
}
if(file_exists("../".$rpt_sim->imagen1))
{
  $src_imagen1="data:image/jpeg;base64,".file_get_contents("../".$rpt_sim->imagen1);
}
 if(file_exists("../".$rpt_sim->imegen2))
{
  $src_imegen2="data:image/jpeg;base64,".file_get_contents("../".$rpt_sim->imegen2);
}
if(file_exists("../".$rpt_sim->imagen3))
{
  $src_imagen3="data:image/jpeg;base64,".file_get_contents("../".$rpt_sim->imagen3);
}
 if(file_exists("../".$rpt_sim->imegen4))
{
  $src_imegen4="data:image/jpeg;base64,".file_get_contents("../".$rpt_sim->imegen4);
}
if(file_exists("../".$rpt_sim->imagen5))
{
  $src_imagen5="data:image/jpeg;base64,".file_get_contents("../".$rpt_sim->imagen5);
}
$html.='<th><h3>IMAGENES</h3></th>';
$html.="<img src='$src_imagen1' width=300px/><br>Imagen #1<br><br>";
$html.="<img src='$src_imagen2' width=300px/><br>Imagen #2<br><br>";
$html.="<img src='$src_imagen3' width=300px/><br>Imagen #3<br><br>";
$html.="<img src='$src_imagen4' width=300px/><br>Imagen #4<br><br>";
$html.="<img src='$src_imagen5' width=300px/><br>Imagen #5<br><br>";

$html.="<table id=tabla_contenido>
<tr>
<th>FIRMA INVETSA</th>
<th>FIRMA EMPRESA</th>
</tr>
<tr>
<td>
<img src='$src_firma_invetsa' width=300px/>
</td>
<td>
<img src='$src_firma_empresa' width=300px/>
</td>
</tr>
</table>
";
   /*
if(file_exists("../".$rpt_sim->firma_invetsa))
{
  $contenido=file_get_contents("../".$rpt_sim->firma_invetsa);

header("Content-Type: image/png");
echo $contenido;
}
else
{
  echo "no existe";
}
?>
*/
$html.='
    <footer>
  
      GrayhatCorp
    </footer>
  </body>
 
</html>
';


$mPDF=new mPDF("c","A4");
$mPDF->writeHTML($html);


//$mPDF->Output("reporte.pdf","D");
$mPDF->Output("reporte.pdf","I");
if(isset($_POST['descargar']))
{
  $mPDF->Output("reporte.pdf","D");
}
}


 function rpt_sistema_integral($id_sim)
{
$html='';

$sistema_integral=New Sistema_integral();
$puntuacion= New Puntuacion();
$detalle_puntuacion=New Detalle_puntuacion();
$peso=New Peso();

$id_sistema=$id_sim;

$rpt_sim=$sistema_integral->get_formulario_por_id_sim($id_sistema);
$rpt_puntuacion=$puntuacion->get_formulario_puntuacion_por_id_sim($id_sistema);
$rpt_peso=$peso->get_formulario_peso_por_id_sim($id_sistema);

//$rpt_detalle_puntuacion=$detalle_puntuacion->get_formulario_detalle_puntuacion_por_id_sim_y_puntuacion($id_sistema,$id_puntuacion);
$html.='
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>SISTEMA INTEGRAL DE MONITOREO</title>
     <style type="text/css">
      #tabla_contenido,#tabla_puntuacion{
        border:1px solid #000; 
        margin: 5px;
        align-content: top;
        background: #d9ffcc;
       }
       #tabla_puntuacion
       {
        width: 350px;
       }
       th{
         background-color: #4CAF50;
    color: white;
     border: 1px solid #000;
        height: 50px;

       }
       td{
        height: 40px;
       }
       div{
        height: 100%;
       }
       table
       {
        border-collapse: collapse;
        font-family: arial;
       }
       img
       {
         border: 0px solid #000;
       }
     </style>
  </head>
  <body>
    <header class="clearfix">
    <TABLE>
      <tr>
        <td>
          <img style="width: 50px; height: 50px" src="imagen/invetsa.png">
         </td>
         <td >
         <h2 align="center">SIM (SISTEMA INTEGRAL DE MONITOREO)</h2>
         <h3 align="center">Invetsa Veterinaria S.A.</h3>
        </td>
        <td>
         <b>Codigo:</b> '.$rpt_sim->codigo.'<br>
         <b>Revision:</b>'.$rpt_sim->revision.'<br>
        </td>
      </tr>
      <tr>
        <td style="text-align: left;">
         <b>EMPRESA:</b>'.$rpt_sim->empresa.'  <br>
         <b>GRANJA:</b>'. $rpt_sim->granja .'<br>
         <b>EDAD: </b>'. $rpt_sim->edad .' años<br>
         <b>SEXO: </b>'. $rpt_sim->sexo.'<br>
        </td>
        <td style="text-align: left;" colspan="2">
         <b>ZONA:</b> '. $rpt_sim->zona .' <br>
         <b>GALPON:</b> '. $rpt_sim->codigo_galpon .'<br>
         <b>Nro. de POLLOS:</b> '. $rpt_sim->nro_pollos .'<br>
         <b>FECHA:</b> '. $rpt_sim->fecha .'<br>
        </td>
      </tr>


    </TABLE>
     

     
    </header>
    <main>
   
      <table  id=tabla_contenido>
          <tr >
            <th>Peso Corporal(g)</th>
            <th>Peso Brusca (g)</th>
            <th>Peso de Brazo (g) </th>
            <th>Peso de Timo (g)</th>
            <th>Peso de Higado (g)</th>
            <th>Indice Bursal (g)</th>
            <th>Indice Timico</th>
            <th>Indice Hepatico</th>
            <th>Indice bursometro</th>
          </tr>';
         

            if($rpt_peso!="-1"){
            while ($fila=mysqli_fetch_object($rpt_peso)) {
              if($fila->id=="6")
              {
                
               $html.=' <tr style="background:#a56;">';
                       
              }
              else
              {
                
                $html.='<tr>';
                
              }

            $html.='
                  <td>'.$fila->peso_corporal.'</td>
                  <td>'.$fila->peso_bursa.'</td>
                  <td>'.$fila->peso_brazo.'</td>
                  <td>'.$fila->peso_timo.'</td>
                  <td>'.$fila->peso_higado.'</td>
                  <td>'.$fila->indice_bursal.'</td>
                  <td>'.$fila->indice_timico.'</td>
                  <td>'.$fila->indice_hepatico.'</td>
                  <td>'.$fila->bursometro.'</td>
                  </tr>
                  ';
            }
          }
                 
    $html.='</table><table>';



            if($rpt_puntuacion!="-1"){
              
            while ($objeto=mysqli_fetch_object($rpt_puntuacion)) {
               $bajo=$objeto->id % 2;
               if($bajo==1){
                $html.='<tr>';
              }
              $html.='<td> <div id=div_tabla><table id=tabla_puntuacion>';

              $rpt_detalle_puntuacion=$detalle_puntuacion->get_formulario_detalle_puntuacion_por_id_sim_y_puntuacion($id_sistema,$objeto->id);
              $html.='
                <tr>
                <th colspan=2>'.
                $objeto->id.' '.$objeto->nombre.'
                </th>
                </tr>
              ';
              if($rpt_detalle_puntuacion!="-1"){
              while($fila=mysqli_fetch_object($rpt_detalle_puntuacion)){             
            $html.='
                  <tr>
                  <td>'.$fila->nombre.'</td>
                  <td>'.$fila->estado.'</td>
                  </tr>
                  ';
            }
          }
           $html.='</table></div> </td>';
          if($bajo==1){
               $html.='</tr>';
              }
          }
          }
          
              
      $html.='</table><br>';
      $html.='<b>Referencia:</b><br>';
$html.= $rpt_sim->referencia.'<br>';
      $html.='<b>Observaciones:</b><br>';
$html.= $rpt_sim->observaciones.'<br>';
      $html.='<b>Comentarios:</b><br>';
$html.= $rpt_sim->comentarios.'<br>';
 
 if(file_exists("../".$rpt_sim->firma_invetsa))
{
  $src_firma_invetsa="data:image/jpeg;base64,".file_get_contents("../".$rpt_sim->firma_invetsa);
}
 if(file_exists("../".$rpt_sim->firma_empresa))
{
  $src_firma_empresa="data:image/jpeg;base64,".file_get_contents("../".$rpt_sim->firma_empresa);
}
if(file_exists("../".$rpt_sim->imagen1))
{
  $src_imagen1="data:image/jpeg;base64,".file_get_contents("../".$rpt_sim->imagen1);
}
 if(file_exists("../".$rpt_sim->imegen2))
{
  $src_imegen2="data:image/jpeg;base64,".file_get_contents("../".$rpt_sim->imegen2);
}
if(file_exists("../".$rpt_sim->imagen3))
{
  $src_imagen3="data:image/jpeg;base64,".file_get_contents("../".$rpt_sim->imagen3);
}
 if(file_exists("../".$rpt_sim->imegen4))
{
  $src_imegen4="data:image/jpeg;base64,".file_get_contents("../".$rpt_sim->imegen4);
}
if(file_exists("../".$rpt_sim->imagen5))
{
  $src_imagen5="data:image/jpeg;base64,".file_get_contents("../".$rpt_sim->imagen5);
}
if(file_exists("../".$rpt_sim->imagen_jefe))
{
  $src_imagen_jefe="data:image/jpeg;base64,".file_get_contents("../".$rpt_sim->imagen_jefe);
}

$html.='<th><h3>IMAGENES</h3></th>';
$html.="<img src='$src_imagen1' width=300px/><br>Imagen #1<br><br>";
$html.="<img src='$src_imagen2' width=300px/><br>Imagen #2<br><br>";
$html.="<img src='$src_imagen3' width=300px/><br>Imagen #3<br><br>";
$html.="<img src='$src_imagen4' width=300px/><br>Imagen #4<br><br>";
$html.="<img src='$src_imagen5' width=300px/><br>Imagen #5<br><br>";

$html.="<table id=tabla_contenido>
<tr>
<th>IMAGEN DE JEFE DE PLANTA</th>
</tr>
<tr>
<td>
<img src='$src_imagen_jefe' width=300px/>
</td>
</tr>
</table>
<br>
<br>
<br>
";

$html.="<table id=tabla_contenido>
<tr>
<th>FIRMA INVETSA</th>
<th>FIRMA EMPRESA</th>
</tr>
<tr>
<td>
<img src='$src_firma_invetsa' width=300px/>
</td>
<td>
<img src='$src_firma_empresa' width=300px/>
</td>
</tr>
</table>
";
   /*
if(file_exists("../".$rpt_sim->firma_invetsa))
{
  $contenido=file_get_contents("../".$rpt_sim->firma_invetsa);

header("Content-Type: image/png");
echo $contenido;
}
else
{
  echo "no existe";
}
?>
*/
$html.='
    <footer>
  
      GrayhatCorp
    </footer>
  </body>
 
</html>
';


$mPDF=new mPDF("c","A4");
$mPDF->writeHTML($html);


//$mPDF->Output("reporte.pdf","D");
$mPDF->Output("reporte.pdf","I");
if(isset($_POST['descargar']))
{
  $mPDF->Output("reporte.pdf","D");
}
}





?>

<form method="POST" action="frmReporte.php">
  <Input type="submit" value="Descargar" name="descargar"/>
</form>